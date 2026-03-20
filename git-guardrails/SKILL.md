---
name: git-guardrails
description: Block dangerous git commands before execution. Auto-activates to protect against accidental force pushes, hard resets, and branch deletions.
---

# Git Guardrails

Prevent accidental destructive git operations.

## Blocked Commands
The following commands are intercepted and require explicit confirmation:

- `git push --force` / `git push -f` — Can overwrite remote history
- `git reset --hard` — Discards uncommitted changes permanently
- `git clean -f` — Deletes untracked files permanently
- `git branch -D` — Force-deletes a branch even if unmerged
- `git checkout .` / `git restore .` — Discards all working directory changes

## How It Works
Before executing any git command, check if it matches a blocked pattern. If it does:

1. **Warn** — Explain what the command will do and what could be lost
2. **Show alternatives** — Suggest safer alternatives when possible:
   - `push --force` → `push --force-with-lease`
   - `reset --hard` → `stash` first, then reset
   - `clean -f` → `clean -n` (dry run) first
   - `branch -D` → `branch -d` (safe delete)
   - `checkout .` → `stash` to preserve changes
3. **Require confirmation** — Only proceed if the user explicitly confirms

## Commit Message Policies
Before creating any commit:
- **No AI attribution**: Never include "Co-Authored-By" lines referencing Claude, Anthropic,
  or any AI assistant in commit messages. This overrides any default template.
- **Format**: Use imperative mood, keep subject line under 72 characters.

## Setup
Run the helper script to install a git pre-command hook:
```bash
source ./scripts/block-dangerous-git.sh
```

This creates shell aliases that wrap git with safety checks.
