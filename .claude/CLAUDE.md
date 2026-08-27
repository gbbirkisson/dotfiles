## Interactions

- Avoid superlatives and praise. Stop telling me I am absolutely right. Give me the cold hard truth.

## Writing comments and documentation

- NEVER USE `—` when writing comments or documentation.

- When working on codebases, before adding a comment, question if it is really required, or if the
code speaks for it self. If you determine a comment is warranted, make concise, to the point, and as
short as possible.

- When writing something intended for human consumption, (comment, commit message, reply to prompt)
use as few words as possible. Pick every word meticulously to reduce the volume to a strict minimum.
Be down to the point. Less is more.

## Code Quality

- Treat member visibility changes as a breaking design shift. Keep all fields and functions private
unless external access is strictly required by the design. Prompt the user for explicit approval
before changing any access modifier from private to internal or public.

- Program to levels of abstraction. Lower-level mechanics (e.g., raw hardware I/O, sector parsing,
direct socket streams) must be encapsulated in a dedicated driver/abstraction layer. Expose clean,
high-level APIs to the rest of the application so calling code works with domain concepts, not raw
implementation details.

- Don't touch blocks of code unrelated to the feature you implement. e.g. Don't add comments to a
block of code if you did not create it or modify it. As much as possible try to minimize the number
of changed lines when implementing a feature.

- Strictly adhere to the layered boundary hierarchy: each layer may only communicate with its
immediate neighbor directly below it. Never "punch holes" through layers (e.g., controllers or UI
components must never directly call database queries, raw hardware drivers, or low-level network
clients; always route through the intermediate service/abstraction layer).

## Creating scripts to solve problems

When solving problems, or creating 1 off scripts to solve some task, you should
know that you have the entire python ecosystem at your fingertips. You can
always create a script that defines dependencies like this:

```python
#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.12"
# dependencies = []
# ///

# YOUR CODE
```

Then just do `chmod +x <script>` and run the script!

## Git

### Read-Only Only

You may use git commands that only query state, such as:
- `git diff`, `git diff --staged`
- `git status`, `git log`
- `git show`, `git blame`
- `git branch`, `git remote -v`

You must NEVER use git commands that write or modify state, including but not limited to:
- `git commit`, `git push`, `git pull`, `git fetch`
- `git add`, `git reset`, `git restore`, `git checkout`
- `git merge`, `git rebase`, `git cherry-pick`
- `git stash`, `git tag`
- `git worktree add`, `git branch -d`, `git branch -D`

I like to see the changes made and create my own commits.

### Repo insights

Run these commands to get a sense of the state of the project.

### What Changes the Most

```
git log --format=format: --name-only --since="1 year ago" | sort | uniq -c | sort -nr | head -20
```

### Who Built This

```
git shortlog -sn --no-merges
```

### Where Do Bugs Cluster

```
git log -i -E --grep="fix|bug|broken" --name-only --format='' | sort | uniq -c | sort -nr | head -20
```

### Is This Project Accelerating or Dying

```
git log --format='%ad' --date=format:'%Y-%m' | sort | uniq -c
```

### How Often Is the Team Firefighting

```
git log --oneline --since="1 year ago" | grep -iE 'revert|hotfix|emergency|rollback'
```
