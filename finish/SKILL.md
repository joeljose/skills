---
name: finish
description: Post-implementation verification and cleanup. Use after completing implementation, when the user says "finish", "wrap up", "are we done", or wants to verify and close out work.
---

# Finish

Verify implementation, close issues, and clean up after a task.

## Process

1. **Run checks** — Detect and run the project's linters and tests:
   - Check for: `Makefile`, `package.json` scripts, `pyproject.toml`, CI workflow files
   - Run what exists (e.g., `make lint`, `npm test`, `pytest`)
   - If nothing is found, run a basic sanity check on changed files

2. **Check CI** — If a GitHub Actions workflow exists:
   - `gh run list --limit 3` to check recent run status
   - If the latest run failed, investigate and flag the failure

3. **Close issues** — Find and close related issues:
   - Scan recent commit messages for issue references (`#123`, `fixes #123`)
   - For each referenced issue, verify the work is done, then `gh issue close`
   - If issues were created earlier in this session, close those too

4. **Review session changes** — Quick diff-based review:
   - `git diff` of all changes made in this session
   - Flag anything that looks unfinished (TODOs, commented-out code, debug prints)
   - Confirm all acceptance criteria from the issue/PRD are met

5. **Branch cleanup** — If on a feature branch:
   - Suggest merging or creating a PR if not done yet
   - Suggest deleting the branch after merge

6. **Summary** — Report:
   ```
   ✓ Tests: [pass/fail]
   ✓ CI: [pass/fail/not configured]
   ✓ Issues closed: [list]
   ✓ Open items: [any remaining TODOs or concerns]
   ```

## Rules
- Never close an issue unless the work is actually done — check first
- If tests fail, fix them before closing anything
- If there's no test infrastructure, note it as a suggestion but don't block
- Be honest about open items — don't declare victory if something is incomplete
