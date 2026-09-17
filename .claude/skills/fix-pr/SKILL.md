---
name: fix-pr
description: Figure out why GH pipeline is failing
argument-hint: "[pr-number]"
allowed-tools: Bash(gh *)
---

# Task: Fix PR Build Failures

You are an expert software engineer. You are tasked with fixing the CI failures for GitHub PR.

## Steps

1.  **Determine which PR:**
    If a PR number was passed with the invocation (e.g. `/fix-pr 40`), use it and skip ahead.
    Otherwise run `gh pr list` and ask the user which one to work on.

2.  **Checkout PR:**
    Check out the pull request locally using the GitHub CLI:
    ```bash
    gh pr checkout {{ PR }}
    ```

3.  **Analyze Failures:**
    Use the `gh` CLI to identify which checks failed and retrieve their logs to understand the root cause.
    - Check status: `gh pr checks {{ PR }}`
    - Get logs: Identify the failed run/job and use `gh run view ... --log-failed` to see the errors.

4.  **Fix the Code:**
    Based on the analysis of the logs, locate the problematic code and implement the necessary fixes.

5.  **Verify Locally:**
    Run local checks (tests, linters, build) to ensure the fix works. Inspect the project structure (e.g., `Makefile`, `Justfile`, `package.json`, `Cargo.toml`) to find the appropriate verification commands.
