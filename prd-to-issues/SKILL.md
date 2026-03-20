---
name: prd-to-issues
description: Break a PRD into GitHub issues — one per vertical slice with acceptance criteria. Use when you need trackable work items from a PRD, or when the user says "create issues for this" or "break this into tickets".
---

# PRD to Issues

Turn a PRD into GitHub issues, one per vertical slice.

## Process

1. **Load the PRD** — Ask the user to provide or point to the PRD.

2. **Explore the codebase** to understand architecture and relevant modules.

3. **Break into vertical slices** — Same approach as prd-to-plan:
   - Each slice cuts through all layers end-to-end
   - Independently deployable and testable
   - Ordered by dependency → risk → value

4. **Create a parent issue** — Summary issue linking to all child issues:
   ```
   ## Feature: [Name]
   PRD: #[prd-issue-number]

   ### Slices
   - [ ] #XX — Phase 1: [description]
   - [ ] #XX — Phase 2: [description]
   ...
   ```

5. **Create child issues** — One per slice, each with:
   - **Context**: Link to parent and PRD
   - **Goal**: What this slice accomplishes end-to-end
   - **Acceptance Criteria**: Checkboxed list
   - **Blocked by**: Links to prerequisite issues (if any)
   - **Files likely involved**: Key files to touch
   - **Testing approach**: How to verify

6. **Update parent** with links to all created child issues.

## Rules
- Use `gh issue create` for all issues
- Label issues consistently (e.g., `feature`, `phase-1`)
- Keep issue bodies concise — enough context to start work, not a novel
- First slice should be the thinnest end-to-end path
