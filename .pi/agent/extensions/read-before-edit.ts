import { homedir } from "node:os";
import { resolve } from "node:path";
import type { ExtensionAPI } from "@earendil-works/pi-coding-agent";

// Tools after which the model knows a file's exact content.
const knownContentTools = new Set(["read", "write", "edit"]);

function absolutePath(path: string, cwd: string): string {
	const stripped = path.replace(/^@/, "");
	return resolve(cwd, stripped.replace(/^~(?=\/|$)/, homedir()));
}

export default function (pi: ExtensionAPI) {
	let known = new Set<string>();

	pi.on("session_start", async () => {
		known = new Set();
	});

	pi.on("tool_result", async (event, ctx) => {
		const path = (event.input as { path?: unknown }).path;
		if (knownContentTools.has(event.toolName) && !event.isError && typeof path === "string") {
			known.add(absolutePath(path, ctx.cwd));
		}
	});

	pi.on("tool_call", async (event, ctx) => {
		if (event.toolName !== "edit") return undefined;
		const path = (event.input as { path?: unknown }).path;
		if (typeof path === "string" && known.has(absolutePath(path, ctx.cwd))) return undefined;
		return { block: true, reason: `Read ${path} before editing it, so the old text matches exactly.` };
	});
}
