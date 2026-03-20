---
name: improve-architecture
description: Find architectural friction in a codebase and propose redesigns. Use when the user says "improve architecture", "find tech debt", "refactor suggestions", or wants to improve code structure.
---

# Improve Architecture

Find areas of architectural friction and propose targeted improvements.

## Process

1. **Explore the codebase** — Look for friction signals:
   - Shallow modules (interface as complex as implementation)
   - Tight coupling (changes in one module force changes in others)
   - Untested seams (boundaries between modules with no tests)
   - Pass-through methods (methods that just forward calls)
   - Duplicated logic across modules
   - God classes/files (too many responsibilities)

2. **Present candidates** — List 3-5 areas of friction with:
   - Where it is (files, modules)
   - What the friction is
   - How it manifests (developer pain, bugs, slow changes)
   - Estimated improvement impact: High / Medium / Low

3. **User selects** — Let the user pick which areas to redesign.

4. **Spawn parallel redesign agents** — For each selected area, spawn an agent that:
   - Analyzes the current design in detail
   - Proposes a new design following deep-module principles
   - Lists specific files to change
   - Identifies risks and migration path

5. **Create RFC** — Compile the best redesigns into a GitHub issue:
   - Current state and problems
   - Proposed changes with rationale
   - Migration plan (how to get there incrementally)
   - Risks and mitigations

See `REFERENCE.md` for detailed guidance on identifying and fixing architectural problems.

## Rules
- Focus on changes that reduce ongoing friction, not cosmetic cleanup
- Propose incremental migrations, never big-bang rewrites
- Every suggestion must be grounded in observed codebase problems
