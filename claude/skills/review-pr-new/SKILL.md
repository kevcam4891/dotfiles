---
name: review-pr-new
description: Review PR comments and provide recommendations, with optional interactive fix application
argument-hint: <pr-numbers...>
---

I'd like to interactively review each Pull Request comment, one at a time. Before iterating, gather all unresolved comments, and provide for me a summary of the review. What does the effort look like, and what areas are in focus?

Then, for each comment, evaluate the comment for its merits, provide me with additional context about the comment, critiques of the comment. Provide me with some guidance to best make a decision, and offer me an array of choices I can select with my up/down keys and enter. Options should include;

- Fix this issue according to the best recommendation
- Add a @todo on all relevant pieces of this code to revisit at a later time after this PR is merged
- An option to skip the issue.

Be a critical, yet helpful and productive thought partner in this process.

Do not actually take any immediate action, but take note of what the decisions were. Collect all of the decisions. Once all decisions have been made for all comments, create a plan of action, present the plan, and ask for review and confirmation.
