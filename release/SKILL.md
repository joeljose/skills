---
name: release
description: Cut a release — bump version, update changelog, commit, tag, and hand off to /finish. Use when the user says "release", "cut a release", "bump version", "ship it", or wants to prepare a versioned release.
---

# Release

Prepare and cut a versioned release with changelog updates.

## Process

1. **Check prerequisites** — Before releasing:
   - Confirm all tests pass (`pytest`, `make test`, or project equivalent)
   - Confirm CI is green on the current branch
   - Check for uncommitted changes — stop if working tree is dirty

2. **Determine version bump** — Ask the user or infer from changes:
   - **Patch** (x.y.Z): bug fixes, minor tweaks, no new features
   - **Minor** (x.Y.0): new features, backwards-compatible
   - **Major** (X.0.0): breaking changes
   - Read current version from the project's version source of truth (e.g., `VERSION` file, `pyproject.toml`, `__version__`)

3. **Update changelog** — Edit `CHANGELOG.md` (create if missing):
   - Use [Keep a Changelog](https://keepachangelog.com/) format
   - Review commits since last release: `git log $(git describe --tags --abbrev=0 2>/dev/null || git rev-list --max-parents=0 HEAD)..HEAD --oneline`
   - Categorize changes under: Added, Changed, Fixed, Removed (only include sections that apply)
   - Move items from `[Unreleased]` to `[X.Y.Z] - YYYY-MM-DD`
   - Keep entries concise — one line per change, link to PR/issue if available

4. **Bump version** — Update the version source of truth:
   - If `VERSION` file: write new version
   - If `__version__` in code: update it
   - If `pyproject.toml`: update `version` field
   - Verify all version references are consistent (search for old version string)

5. **Commit and tag** — Create a release commit and tag:
   - Stage version + changelog files
   - Commit: `Release vX.Y.Z`
   - Tag: `git tag -a vX.Y.Z -m "Release vX.Y.Z"`

6. **Hand off** — Present the release summary and suggest next steps:
   - Run `/finish` to push, create PR, merge
   - After merge, push the tag: `git push origin vX.Y.Z`
   - If Docker: remind to rebuild images (they'll pick up the new version)

## Rules
- Never release from a dirty working tree
- Never release if tests are failing
- Always update the changelog — no silent releases
- Always tag the release commit — tags are how downstream consumers pin versions
- If no `CHANGELOG.md` exists, create one with the full Keep a Changelog header
- If no version source of truth exists, ask the user where version lives before proceeding
- Patch is the default bump unless the user specifies otherwise
