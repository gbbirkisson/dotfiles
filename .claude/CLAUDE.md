# Git: Read-Only Only

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
