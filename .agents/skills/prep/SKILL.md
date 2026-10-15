---
name: prep
description: Prepare for work in this particular repo
allowed-tools: Read, Glob, Bash(ls *), Bash(find *)
---

# Task: Prepare for Work in This Repo

Load project context before starting any work so you can follow the repo's conventions and honor its local configuration.

## Steps

1. **Read agent guidance files (if present):**
   - `AGENTS.md` at the repo root
   - `CLAUDE.md` at the repo root
   - Any nested `CLAUDE.md` files (e.g., `**/CLAUDE.md`) — these often carry directory-specific instructions
   - `.claude/settings.local.json` for local permissions, hooks, and environment overrides

2. **If a file is missing, skip it silently.** Do not create these files; their absence is itself information.

3. **Summarize briefly (3-6 bullets max):**
   - The repo's purpose, stack, and any hard rules from AGENTS.md/CLAUDE.md
   - Notable permissions, hooks, or env vars from `.claude/settings.local.json`
   - Anything that would change how you'd approach a typical task here (e.g., "don't run migrations", "tests require X")

4. **Stop and wait for the user's actual task.** Do not start exploring the codebase or making
   changes — the goal of this skill is only to load context.
