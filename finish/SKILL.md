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

3. **Review session changes** — Quick diff-based review:
   - `git diff main...HEAD` to see all changes on the feature branch
   - Flag anything that looks unfinished (TODOs, commented-out code, debug prints)
   - Confirm all acceptance criteria from the issue/PRD are met

4. **Create PR** — If on a feature branch:
   - Push the branch: `git push -u origin <branch>`
   - Create a PR with `gh pr create`, referencing issues with `fixes #N` in the body
   - GitHub will auto-close referenced issues when the PR is merged

5. **Post-merge cleanup** — After the PR is merged:
   - Switch back to main: `git checkout main && git pull`
   - Delete the local branch: `git branch -d <branch>`
   - Delete the remote branch (if not auto-deleted): `git push origin --delete <branch>`

6. **Summary** — Report:
   ```
   ✓ Tests: [pass/fail]
   ✓ CI: [pass/fail/not configured]
   ✓ PR: [link]
   ✓ Issues to auto-close on merge: [list]
   ✓ Open items: [any remaining TODOs or concerns]
   ```

## Rules
- Never close an issue manually — let GitHub auto-close via PR merge
- If tests fail, fix them before creating the PR
- If there's no test infrastructure, note it as a suggestion but don't block
- Be honest about open items — don't declare victory if something is incomplete
- Always clean up the feature branch after merge
