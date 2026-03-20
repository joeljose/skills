---
name: prd-to-plan
description: Break a PRD into a phased implementation plan using vertical "tracer bullet" slices. Use when you have a PRD and need an implementation plan, or when the user says "plan this" or "break this down".
---

# PRD to Plan

Turn a PRD into an actionable, phased implementation plan.

## Process

1. **Load the PRD** — Ask the user to provide or point to the PRD (GitHub issue, file, or paste).

2. **Explore the codebase** — Understand the current architecture, relevant modules, and existing patterns.

3. **Identify vertical slices** — Break the work into "tracer bullet" slices. Each slice:
   - Cuts through ALL layers (UI → API → DB, or equivalent)
   - Is independently deployable and testable
   - Delivers a thin but complete path through the system
   - Do NOT plan horizontally (all models first, then all controllers, etc.)

4. **Order the slices** — Sequence by:
   - Dependencies (what unblocks the most?)
   - Risk (tackle unknowns early)
   - Value (deliver something useful as soon as possible)

5. **Write the plan** with this structure for each phase:
   ```
   ## Phase N: [Name]
   **Goal**: One sentence
   **Slice**: What end-to-end path this implements
   **Files to touch**: List key files
   **Acceptance criteria**: How to verify it works
   **Estimated complexity**: S / M / L
   ```

6. **Save** — Write the plan to `./plans/[feature-name].md`. Create the `plans/` directory if needed.

## Rules
- VERTICAL slices, not horizontal layers — this is the most important rule
- Each phase should be completable in a single focused session
- First phase should be the thinnest possible end-to-end path
- Flag risks and unknowns explicitly
- Include a "Phase 0" for any necessary setup or scaffolding
