---
name: update-pr
description: Update the current PR description to reflect the latest changes, then push via Graphite
---

# Update & Submit PR

Analyze the current branch, rewrite the PR description to accurately reflect its current state, then push.

## Steps

1. **Get context:**
   - `gh pr view --json number,title,body,baseRefName` — get the current PR metadata
   - `git log $(git merge-base HEAD <base>)..HEAD --oneline` — all commits since divergence
   - `git diff <base>...HEAD --stat` — summary of all changed files

2. **Analyze the full diff:**
   - `git diff <base>...HEAD` — read the complete diff to understand what the branch does now
   - Focus on the overall purpose and user-facing changes, not implementation minutiae

3. **Draft an updated PR title and body:**
   - Keep the title short (under 70 chars), reflecting the branch's current scope
   - Body format:

     ```
     ## Summary
     <2-5 bullet points describing what this PR does now>

     ## Changes
     <grouped list of notable changes by area/file>
     ```

   - If the PR scope has grown beyond the original title, update the title too
   - Be concise — a reviewer should understand the PR in 30 seconds

4. **Show the user the proposed title and body, then ask for approval before applying.**

5. **Apply and push:**
   - `gh pr edit <number> --title "..." --body "..."`
   - `gt submit`
   - Report the PR URL
