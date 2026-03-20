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

4. **Create PR and merge** — If on a feature branch:
   - Push the branch: `git push -u origin <branch>`
   - Create a PR with `gh pr create`, referencing issues with `fixes #N` in the body
   - Ask user to confirm, then merge: `gh pr merge --merge`

5. **Branch cleanup** — Immediately after merge:
   - Switch back to main: `git checkout main && git pull`
   - Delete the local branch: `git branch -d <branch>`
   - Delete the remote branch: `git push origin --delete <branch>`
   - Verify cleanup: confirm no stale branches remain

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
- If production code was changed but no tests were added or modified, STOP before pushing and ask: "No tests cover these changes. Run /tdd to add tests, or confirm 'skip tests' to proceed."
- Skip this check for docs-only or config-only changes
- If the user confirms skip, note "Shipped without tests" in the PR body
- Be honest about open items — don't declare victory if something is incomplete
- Always clean up the feature branch after merge
- After merge, ask: "Does this warrant a version bump? Run `/release` to cut a release, or skip if not needed." Skip for trivial changes (typos, internal docs). Suggest for bug fixes (patch), new features (minor), or breaking changes (major).
