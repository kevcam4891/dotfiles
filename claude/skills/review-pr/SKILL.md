---
name: review-pr
description: Review and apply recommendations from a saved PR analysis
argument-hint: <pr-numbers...> | --session <id> | --latest | --list | --interactive
---

# Review PR Recommendations

Load a saved analysis and either display the report or interactively apply fixes.

**DEFAULT BEHAVIOR: If no saved session exists, runs /analyze-pr automatically and saves a report. Does NOT prompt for interaction unless --interactive flag is used.**

## Arguments

Parse from `$ARGUMENTS`:
- PR numbers: `123 456 789` - find or create session for these PRs
- `--session <id>`: Load specific session by name/ID
- `--latest`: Load most recent analysis
- `--list`: Show all available sessions
- `--interactive`: Enable interactive mode for applying fixes one-by-one
- `--apply-all`: Apply all recommended fixes without prompting

## Default Flow (Non-Interactive)

### Step 1: Find or Create Session

1. Check for existing session in `.claude/pr-reviews/`:
   - If PR numbers given: find session containing those PRs
   - If `--session`: load that specific session
   - If `--latest`: load most recent
   - If `--list`: display sessions and exit

2. **If no session exists and PR numbers provided:**
   - Automatically run full analysis (same as /analyze-pr)
   - Save the report
   - Continue to Step 2

### Step 2: Display Report

If the session has a markdown report (`.claude/pr-reviews/{id}.md`):
- Output the full report content
- The user can read and decide what to do

If only JSON exists:
- Generate a summary from the JSON
- Display prioritized action items

### Step 3: Exit with Next Steps

Print available next actions:
```
Report saved at: .claude/pr-reviews/search-v2-123-456.md

Next steps:
  • Review the report above
  • Run /review-pr --session search-v2-123-456 --interactive to apply fixes
  • Run /review-pr --session search-v2-123-456 --apply-all to apply all ACCEPT items
```

---

## Interactive Mode (--interactive flag)

When `--interactive` is specified, enter interactive review mode:

### Present Summary First

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Review Session: search-v2-123-456
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PRs: #123, #456
Total: 52 comments analyzed
  • 8 ACCEPT (ready to fix)
  • 12 DEFER (lower priority)
  • 6 INVESTIGATE (need verification)
  • 15 REPLY (need response)
  • 11 REJECT (no action needed)
```

### Ask Review Mode (ONLY in interactive mode)

> **How would you like to proceed?**
> 1. Fix ACCEPT items - Apply the 8 recommended fixes
> 2. Review by category - Go through bugs, then code quality, etc.
> 3. Review all - See every comment and decide
> 4. Exit - Keep report for later

### For Each Item in Interactive Mode

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
[1/8] PR #123 - FilterCurriculum.tsx:230
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

@Seacant: "both sides of this if statement are identical"

Status: CONFIRMED - Still present in code
Recommendation: ACCEPT

Suggested fix:
  Remove the else branch - both branches do the same thing

[A]pply fix  [S]kip  [V]iew code  [Q]uit
```

---

## Apply All Mode (--apply-all flag)

When `--apply-all` is specified:

1. Load the session
2. Filter to only ACCEPT recommendations
3. For each ACCEPT item with a suggested fix:
   - Apply the fix using Edit tool
   - Track which files were modified
4. After all fixes applied:
   - Show summary of changes
   - Offer to commit (requires user confirmation for commit/push)

---

## Session Management

### List Sessions (--list)

```
Available sessions:
  search-v2-123-456   PRs #123, #456   2h ago      52 comments
  auth-feature        PR #789          yesterday   23 comments

Archived:
  bugfix-api          PR #501          3 days ago  completed
```

### Session Staleness

When loading a session, check if PRs have new activity:
```bash
gh pr view {number} --json updatedAt -q .updatedAt
```

If newer than `analyzed_at`, show warning:
```
Warning: PR #123 has new activity since analysis.
Consider re-running: /analyze-pr 123 456
```

---

## Key Behaviors

1. **Default is non-interactive** - Just display the report unless --interactive
2. **Auto-analyze if no session** - Don't ask, just do it
3. **Commits require confirmation** - Always ask before git commit/push
4. **Track progress** - Update session JSON as items are applied
5. **Archive when done** - Move completed sessions to archive/
