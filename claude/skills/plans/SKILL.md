---
name: plans
description: List all saved plans with summaries and dates, sorted by most recent
user-invocable: true
allowed-tools: Bash(ls *), Bash(stat *), Read, Glob
---

# List Saved Plans

List all saved plans in `~/.claude/plans/` with a brief summary and date, sorted by most recent.

## Execution Flow

### Step 1: Find all plan files

Use Glob to find all `.md` files in `~/.claude/plans/`.

If no files are found, output "No saved plans found." and stop.

### Step 2: Get modification dates

Run a single bash command to get modification dates for all plan files:

```bash
stat -f '%m %N' ~/.claude/plans/*.md | sort -rn
```

This gives epoch timestamps sorted by most recent first.

### Step 3: Read each file and extract summary

For each file (sorted by most recent first), read the first 20 lines to extract a 1-line summary. The summary should capture the main goal of the plan in ~10 words.

Read files in parallel batches for speed.

### Step 4: Display results

Output a markdown table:

```
| # | Plan | Date | Summary |
|---|------|------|---------|
| 1 | velvety-purring-stearns | Feb 21, 2026 | ... |
| 2 | ... | ... | ... |
```

- **Plan**: filename without `.md` extension
- **Date**: formatted as `Mon DD, YYYY` from the file modification time
- **Summary**: 1-line summary extracted from reading the file

## Key Behaviors

1. Sort by most recent modification date first
2. Keep summaries concise (one short sentence)
3. Show all plans, don't truncate the list
4. Use `date -r <epoch>` to format dates nicely
