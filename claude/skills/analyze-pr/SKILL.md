---
name: analyze-pr
description: Analyze PR comments autonomously and save a report for later review
argument-hint: <pr-numbers...> [--name session-name]
---

# Autonomous PR Analysis

Analyze one or more pull request comments autonomously and save a comprehensive report for later review.

## Important

- This skill runs NON-INTERACTIVELY by default.
- Do NOT ask user questions during analysis.
- Fetch all data, analyze all comments, make recommendations, and save a report

## Arguments

Parse from `$ARGUMENTS`:

- PR numbers (required): One or more space-separated numbers, e.g., `123 456 789`
- `--name <name>`: Optional custom session name for the report

## Execution Flow (No User Interaction)

### Step 1: Validate and Fetch PR Data

1. Get repo info: `gh repo view --json nameWithOwner -q .nameWithOwner`
2. For each PR number, fetch metadata:
   ```bash
   gh pr view {number} --json number,title,headRefName,author,reviewDecision,updatedAt
   ```
3. If a PR doesn't exist, log error and continue with valid ones

### Step 2: Fetch All Comments (Silently)

For each valid PR, fetch all review comments:

```bash
gh api repos/{owner}/{repo}/pulls/{number}/comments --paginate
```

Also fetch review summaries for context:

```bash
gh api repos/{owner}/{repo}/pulls/{number}/reviews --paginate
```

Do not consider resolved comments.

### Step 3: Analyze Each Comment

For each comment, determine:

1. **Read the relevant file and surrounding context** (use Read tool)
2. **Categorize the comment type:**
   - `bug` - Reviewer reports broken functionality
   - `code_quality` - Style, patterns, unnecessary code
   - `a11y` - Accessibility concerns
   - `question` - Needs clarification/reply
   - `suggestion` - Optional improvement

3. **Assess current status:**
   - Check if the issue still exists in the current code
   - Note if it appears to have been fixed
   - Flag if ambiguous

4. **Make a recommendation:**
   - `ACCEPT` - Valid concern, should fix
   - `DEFER` - Valid but low priority / can do later
   - `REJECT` - Not applicable or already fixed
   - `INVESTIGATE` - Need more context to decide
   - `REPLY` - Needs a response, not a code change

5. **For code changes, draft the fix** (if straightforward)

6. **For all comments, draft a response to the comment. Keep it brief. No more than one or two sentences, unless a longer explanation is warranted.**

### Step 4: Generate Session ID

If `--name` provided, use that. Otherwise:

- Look for common branch prefix (e.g., `feature/auth-*` → `auth`)
- Look for common words in PR titles
- Fallback: `review-{YYYY-MM-DD}-{random-chars}`

### Step 5: Save Comprehensive Report

Create directory if needed: `mkdir -p .claude/pr-reviews`

Save TWO files:

1. **JSON file** for programmatic access: `.claude/pr-reviews/{session-id}.json`
2. **Markdown file** for human review: `.claude/pr-reviews/{session-id}.md`

The markdown report should include:

- Executive summary with counts by category
- Prioritized action plan
- Each comment with:
  - File and line
  - Reviewer comment text
  - Current code status (still present? fixed?)
  - Recommendation and reasoning
  - Suggested fix (if applicable)

### Step 6: Print Summary

After saving, output a brief summary:

```
Analysis Complete
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

PRs: #123, #456
Session: search-v2-123-456
Report: .claude/pr-reviews/search-v2-123-456.md

Summary:
  12 bugs (8 confirmed, 4 need verification)
  35 code quality items
   5 accessibility issues
  15 questions to reply to

Priority fixes identified: 6

To review interactively: /review-pr --session search-v2-123-456
```

## Key Behaviors

1. **NO QUESTIONS** - Never use AskUserQuestion during analysis
2. **Read actual files** - Verify if issues still exist before recommending
3. **Be thorough** - Analyze every comment, don't skip any
4. **Be opinionated** - Make clear ACCEPT/DEFER/REJECT recommendations
5. **Note outdated comments** - If code has changed, note that the comment may be stale
6. **Save everything** - The report should be comprehensive enough to act on later

## Error Handling

- If GitHub auth fails: Report error and exit
- If a file can't be read: Note in recommendation, mark as INVESTIGATE
- If API rate limited: Save partial results, note in report
