# Gemini Agent Guidelines

## Creating scripts to solve problems

When solving problems, you should know that you have the entire python ecosystem at your
fingertips. You can always create a script that has dependencies like this:

```python
#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.12"
# dependencies = []
# ///

# YOUR CODE
```

Always prefix your script names with `GEMINI_`.

## Critical Environment Directives

1.  **DIRENV/ENVRC Handling:** I use `direnv` and `.envrc` files extensively. **YOU MUST ASSUME** that if a `.envrc` file exists, its environment variables are **ALREADY LOADED** in your current context. **DO NOT** attempt to manually source or load these files.

## Project Orchestration Tools

It is MANDATORY to prioritize project-specific orchestration tools like `make` or `just` over generic language-specific tools whenever a `Makefile` or `Justfile` is present. These files encapsulate the project's canonical way of building, testing, linting, and performing other common tasks.

### Protocol for Usage

1.  **Discovery**: Your first step for any task involving building, testing, linting, or performing other common operations MUST be to check the root directory for a `Makefile` or `Justfile`.
2.  **Inspection**: If found, read the file to identify relevant targets. Common targets include:
    - `build`: Compilation and syntax verification.
    - `test`: Unit and integration tests.
    - `lint` / `format`: Style and static analysis.
    - `check`: Quick validation.
    - `ci` / `all`: Comprehensive validation suite.
    - `run` / `dev`: Starting the application or environment.
3.  **Execution**: Use `make <target>` or `just <target>` as your primary method for executing these tasks.

### Examples

- **Rust**: If a `Justfile` exists, use `just test` instead of `cargo test`.
- **Python**: If a `Makefile` exists, use `make lint` instead of `ruff check .`, as the Makefile may handle virtual environment activation or specific project flags.
- **General**: Always prefer `make ci` or `just ci` if available, as these typically mirror the project's continuous integration pipeline.

NEVER bypass these files if they exist unless a specific operation is explicitly missing from them.
