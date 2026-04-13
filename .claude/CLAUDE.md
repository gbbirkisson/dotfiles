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
