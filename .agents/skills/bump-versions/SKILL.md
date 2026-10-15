---
name: bump-versions
description: Use when asked to find pinned versions, check for available updates, or bump dependencies, tools, runtimes, charts, container images, CI actions or providers in a repo
---

# Task: Find Pinned Versions and Bump Them

You edit files, research and verify. The user applies changes (deploys, runs playbooks, installs, commits). Never apply, deploy or commit yourself.

## 1. Inventory

- Grep the repo for every pin. Typical places: tool version files (`.tool-versions`, `mise.toml`, `.nvmrc`), package manifests (`package.json`, `pyproject.toml`, `Cargo.toml`, `go.mod`, `requirements*.txt`), `Dockerfile` `FROM`, `image:`/`tag:`, chart `version:`, CI action refs, IaC provider constraints, `*_version` variables in build files and scripts, URLs containing versions.
- Find floating references and report them as findings: `latest`, `stable`, `main`/`master`, untagged images, missing chart/package versions, wide ranges (`*`, `>=`, `^`, `~>`), installs without a version (`go install ...@latest`, `apt install pkg`, `curl .../latest/...`). Propose an exact pin for each, set to the version currently running when it can be determined, so pinning changes nothing. Check implicit defaults too: a chart, base image or module may default to `latest` when the repo sets nothing.
- Note pins that are defined but never referenced.
- When the repo deploys something, compare pins with what actually runs (cluster, hosts, registries). Pins in code paths that deploy nothing are dead; report them instead of bumping.
- Lockfiles are outputs. Bump the manifest, then let the package manager regenerate the lock.

## 2. Find latest versions

Query upstream, never answer from memory: GitHub releases/tags (`gh api`), package registries (npm, PyPI, crates.io, Go proxy), container registry tag APIs (probe an exact tag with a manifest request when listings paginate), helm repo index or `helm show chart`, OS package indexes.

Present one table per file: item, pinned, latest. Include the latest patch of the current minor. List floating references in their own table with the proposed exact pin.

## 3. Bump in batches by risk

Confirm batching with the user, then: patch → minor → major. One batch per round trip; the user applies and asks you to verify before the next.

For every bump, before editing:
- Read release notes between pinned and target; grep for `break`, `remov`, `deprecat`, `migrat`, `requires`.
- Check compatibility against what the repo actually uses: platform versions a component supports, client/server version ranges, runtime versions a tool supports (newest interpreter is not always supported).
- When a template engine renders output (helm, kustomize, codegen), render old and new with the repo's real inputs and diff. Check whether schema/CRD changes are applied automatically.
- Hold back a bump when a dependency does not support it yet, or when it would destroy and recreate infrastructure or data. State why and what unblocks it.

After edits, run the repo's own checks (lint, syntax check, build, tests). Give the user exact apply commands in order, including tool installs and dependency refreshes.

## 4. Verify after the user applies

- Running versions match the pins.
- Nothing unhealthy, crash-looping or restarting since the change.
- Exercise the real path end to end (request an endpoint, run a backup/replication check, run the CLI), not just a status listing.
- Stateful restarts can take minutes. Wait with a background `until` loop instead of declaring success early.

## Common Mistakes

| Mistake | Fix |
|---|---|
| Editing env-loader files (`.envrc`, `.env`) | Loaders may block or skip changed files, so later commands run with empty secrets. Tell the user to re-allow/reload before applying. |
| Package/chart "version not found" right after a bump | Local index cache is stale. Make sure the update/refresh step runs on every apply, not only on first setup. |
| Dependency installer reports "already installed" | Many installers do not upgrade without an explicit flag (`--upgrade`, `--force`). |
| Tool manager picks the newest interpreter for a CLI tool | Pin the interpreter for that tool explicitly; setting per-tool options can drop registry defaults, so re-add them. |
| Bumping only a build toolchain | Rebuilds may be gated on the app version, so nothing changes until the app itself is bumped. Say so. |
| Declaring done from a version listing | Check health and exercise the real path. |
