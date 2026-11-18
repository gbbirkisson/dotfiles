import { type ExtensionAPI, isToolCallEventType } from "@earendil-works/pi-coding-agent";

const allowedTools = new Set([
	"read",
	"write",
	"edit",
	"ls",
	"grep",
	"mcp__kagi__kagi_search_fetch",
	"mcp__kagi__kagi_extract",
]);

// `true` is a command taking only arguments; a record lists a group's own subcommands.
type Subcommands = { [name: string]: Subcommands | true };

interface Program {
	// Flags that run arbitrary commands, write files or redirect credentials.
	deniedLongFlags?: string[];
	deniedShortFlags?: string;
	// Flags taking a value, so `-n foo` and `-nfoo` are not read as flags or subcommands.
	valueFlags?: string[];
	// Allowed subcommands. Absent allows any arguments.
	subcommands?: Subcommands;
}

const allowedPrograms: Record<string, Program> = {
	just: {
		deniedLongFlags: [
			"--choose",
			"--chooser",
			"--command",
			"--cygpath",
			"--dotenv-command",
			"--edit",
			"--shell",
			"--shell-arg",
			"--shell-command",
		],
		deniedShortFlags: "ce",
	},
	make: { deniedLongFlags: ["--eval"], deniedShortFlags: "E" },
	rg: { deniedLongFlags: ["--pre", "--hostname-bin"] },
	fd: { deniedLongFlags: ["--exec", "--exec-batch"], deniedShortFlags: "xX" },
	grep: {},
	cat: {},
	"renovate-check": {},
	kubectl: {
		deniedLongFlags: [
			// Kubeconfig exec plugins, kuberc aliases and defaults.
			"--kubeconfig",
			"--kuberc",
			// Alternate server or credentials, impersonation.
			"--server",
			"--proxy-url",
			"--insecure-skip-tls-verify",
			"--tls-server-name",
			"--certificate-authority",
			"--client-certificate",
			"--client-key",
			"--token",
			"--username",
			"--password",
			"--as",
			"--as-group",
			"--as-uid",
			"--as-user-extra",
			// Writes files.
			"--cache-dir",
			"--profile",
			"--profile-output",
			// Local files or URLs, kustomize, raw API paths (pod and service proxy).
			"--filename",
			"--kustomize",
			"--raw",
		],
		deniedShortFlags: "sfk",
		valueFlags: [
			"-n", "--namespace", "--context", "--cluster", "--user", "--request-timeout",
			"-v", "--v", "--vmodule", "--log-flush-frequency",
			"-o", "--output", "-l", "--selector", "-L", "--label-columns", "-c", "--container",
		],
		subcommands: {
			get: true,
			describe: true,
			logs: true,
			events: true,
			explain: true,
			"api-resources": true,
			"api-versions": true,
			version: true,
			top: { node: true, nodes: true, no: true, pod: true, pods: true, po: true },
			// `dump` writes to --output-directory.
			"cluster-info": {},
			auth: { "can-i": true, whoami: true },
			config: { view: true, "get-contexts": true, "current-context": true, "get-clusters": true, "get-users": true },
			rollout: { status: true, history: true },
		},
	},
};

// A plain word without glob or tilde characters, or a quoted one without expansions.
const word = /'([^']*)'|"([^"$`\\]*)"|([\w./:=@+,-]+)/;
// Words separated by spaces or tabs. Newlines would start a new command.
const simpleCommand = `(?:${word.source})(?:[ \\t]+(?:${word.source}))*`;
// Simple commands joined by single unquoted pipes.
const pipeline = new RegExp(`^[ \\t]*${simpleCommand}(?:[ \\t]*\\|[ \\t]*${simpleCommand})*[ \\t]*$`);
// A word in groups 1-3 or a pipe in group 4.
const token = new RegExp(`${word.source}|(\\|)`, "g");

// The words of each pipeline segment, or undefined if the syntax is not allowed.
function parseSegments(command: string): string[][] | undefined {
	if (!pipeline.test(command)) return undefined;
	const segments: string[][] = [[]];
	for (const m of command.matchAll(token)) {
		if (m[4] !== undefined) segments.push([]);
		else segments[segments.length - 1].push(m[1] ?? m[2] ?? m[3]);
	}
	return segments;
}

function deniedFlag(args: string[], { deniedLongFlags = [], deniedShortFlags = "", valueFlags = [] }: Program): string | undefined {
	return args.find((arg) => {
		if (arg.startsWith("--")) {
			// getopt accepts unambiguous prefixes, e.g. `make --ev`.
			const name = arg.split("=")[0];
			return name !== "--" && deniedLongFlags.some((flag) => flag.startsWith(name));
		}
		if (!arg.startsWith("-")) return false;
		for (const c of arg.slice(1)) {
			if (deniedShortFlags.includes(c)) return true;
			// The rest is this flag's value, e.g. `-ojson`.
			if (valueFlags.includes(`-${c}`)) break;
		}
		return false;
	});
}

// Resolves subcommands like cobra: a flag without `=` takes the next word as its value.
// An unknown such flag could hide a subcommand, so it fails closed. Returns the offending word.
function disallowedSubcommand(args: string[], { valueFlags = [], subcommands }: Program): string | undefined {
	if (subcommands === undefined) return undefined;
	let group: Subcommands | true = subcommands;
	for (let i = 0; i < args.length && group !== true; i++) {
		const arg = args[i];
		if (!arg.startsWith("-")) {
			if (!Object.hasOwn(group, arg)) return arg;
			group = group[arg];
		} else if (valueFlags.includes(arg)) {
			i++;
		} else if (!arg.includes("=") && (arg.startsWith("--") || arg.length === 2)) {
			return arg;
		}
	}
	return undefined;
}

function segmentBlockReason([name, ...args]: string[]): string | undefined {
	if (!Object.hasOwn(allowedPrograms, name)) return `program \`${name}\` is not allowed`;
	const program = allowedPrograms[name];
	const flag = deniedFlag(args, program);
	if (flag !== undefined) return `flag \`${flag}\` is not allowed for ${name}`;
	const sub = disallowedSubcommand(args, program);
	if (sub !== undefined) return sub.startsWith("-") ? `flag \`${sub}\` is not allowed for ${name}` : `\`${name} ${sub}\` is not allowed`;
	return undefined;
}

function commandBlockReason(command: string): string | undefined {
	const segments = parseSegments(command);
	if (segments === undefined) return "unsupported shell syntax (use only plain words, quotes without $ ` \\, and single | pipes)";
	return segments.map(segmentBlockReason).find((reason) => reason !== undefined);
}

export default function (pi: ExtensionAPI) {
	pi.on("tool_call", async (event) => {
		if (allowedTools.has(event.toolName)) return undefined;
		const reason = isToolCallEventType("bash", event)
			? commandBlockReason(event.input.command)
			: `tool \`${event.toolName}\` is not allowed`;
		if (reason === undefined) return undefined;
		return {
			block: true,
			reason: [
				`Blocked by tool-gate: ${reason}.`,
				`Allowed tools: ${[...allowedTools].join(", ")}.`,
				`Allowed bash programs, alone or piped with |: ${Object.keys(allowedPrograms).join(", ")}.`,
			].join("\n"),
		};
	});
}
