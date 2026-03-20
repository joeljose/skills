---
name: code-review
description: Structured code review with severity-rated findings. Use when the user says "review this code", "code review", "check this PR", or wants feedback on code quality.
---

# Code Review

Perform a structured code review with actionable, severity-rated findings.

## Process

1. **Scope** — Ask the user what to review:
   - Specific files or directories
   - A PR (`gh pr diff`)
   - Recent changes (`git diff`)
   - If unclear, review staged/unstaged changes

2. **Read the code** — Understand context: what it does, how it fits into the codebase.

3. **Review against checklist**:

   **Correctness**
   - Does it do what it's supposed to do?
   - Edge cases handled? (null, empty, boundary values)
   - Error handling: are failures caught and handled appropriately?
   - Race conditions or concurrency issues?

   **Security**
   - Input validation at system boundaries?
   - Injection risks (SQL, command, XSS)?
   - Authentication/authorization checks?
   - Secrets or credentials in code?
   - Dependency vulnerabilities?

   **Performance**
   - N+1 queries or unnecessary DB calls?
   - Large allocations in hot paths?
   - Missing indexes for new queries?
   - Unnecessary blocking operations?

   **Readability**
   - Clear naming? Could a new team member understand this?
   - Appropriate abstraction level? (not too abstract, not too concrete)
   - Dead code or commented-out code?

4. **Report findings** — For each issue:
   ```
   **[SEVERITY] Title** — file:line
   Description of the issue.
   Suggested fix: ...
   ```

   Severity levels:
   - 🔴 **Critical** — Bug, security flaw, or data loss risk. Must fix.
   - 🟡 **Warning** — Code smell, potential issue, or significant improvement. Should fix.
   - 🔵 **Suggestion** — Style, readability, or minor improvement. Nice to fix.

5. **Summary** — Overall assessment: ship it, fix criticals then ship, or needs rework.

## Rules
- Always read the code before reviewing — never review from description alone
- Focus on what matters — don't nitpick formatting if there are bugs
- Be specific — "this is bad" is useless; "this SQL is injectable because X" is actionable
- Suggest fixes, don't just point out problems
