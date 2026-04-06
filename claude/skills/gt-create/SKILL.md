---
name: gt-create
description: Create a new Graphite branch/PR stack item with staged or unstaged changes
argument-hint: "[description of changes]"
---

Create a new Graphite stack branch from the current branch's changes and commit them.

## Branch naming

Use the format `kc/[category]/[description]` where:
- `category` is one of: `fix`, `impr`, `feat`, `chore`, `refactor`, or a domain like `cms`, `cli`, `reports`, `exam`, etc.
- `description` is a short kebab-case summary

## Steps

1. Run `git status` and `git diff` (staged + unstaged) to understand current changes
2. Run `git log --oneline -5` to see recent commit message style
3. Determine an appropriate branch name and commit message based on the changes and $ARGUMENTS (if provided)
4. Check if the chosen branch name already exists by running `git branch --list '<branch-name>'`. If it does, append a short differentiating suffix (e.g., `-v2`, `-layout`, `-tweaks`) to make it unique. Re-check until the name is available.
5. Stage all changed files relevant to the task (prefer specific files over `git add -A`)
6. Run `gt create <branch-name> -m "<commit-message>"` to create a new Graphite stack branch with the commit
7. If `gt create` fails due to a diverged or existing branch, clean up:
   - `gt untrack <branch>` if needed
   - Switch back to the parent branch, delete the problem branch, and retry
8. Run `gt log short` to verify the branch is properly tracked in the stack
9. Report the branch name and commit to the user

## Commit message format

Follow the repo convention: `category(scope): description`

Examples:
- `fix(cms): correct item picker checkbox click`
- `impr(cms): improve responsiveness of operation list`
- `feat(common-app, cms): add standards confirmation modal`

Append a `Co-Authored-By` trailer with your current model name (e.g., `Co-Authored-By: Claude <model> <noreply@anthropic.com>`).
