---
name: design-doc
description: Create a technical design document that turns PRD requirements into architecture before breaking into issues. Use after writing a PRD, when the user says "design doc", "write a design", or before creating implementation issues for medium/large features.
---

# Design Doc

Create a technical design document that bridges "what" (PRD) and "how" (implementation issues).

## When to use

- **Large tasks**: Always — multiple components, data model changes, irreversible decisions
- **Medium tasks**: Mini version — problem + approach + key decisions only
- **Small tasks**: Skip

## Process

1. **Load context** — If a PRD and/or grill findings exist in this session, use them directly. Otherwise, ask the user to point you to the PRD (GitHub issue, file, or paste). Read relevant parts of the codebase to understand existing architecture.

2. **Write the design doc** with these sections:

   - **Context** — Brief problem summary, link to PRD
   - **Goals and Non-Goals** — Explicitly scope what this design does and does NOT address
   - **Proposed Design** — Architecture, components, how they interact. API contracts if applicable. Data models if applicable.
   - **Alternatives Considered** — At least 2 alternatives and why they were rejected (most valuable section long-term)
   - **Tradeoffs and Risks** — What we're giving up, what could go wrong, assumptions
   - **Open Questions** — Unresolved items needing input

   For **mini design docs** (medium tasks), include only:
   - Context (1-2 sentences)
   - Proposed Design (the approach)
   - Key Decisions (choices made and why)

3. **Review** — Present the design doc to the user. Iterate based on feedback.

4. **Save** — Write to `docs/design/[feature-name].md` in the repo. Mark as `Status: APPROVED` once the user confirms.

## Rules
- Design docs are archived, not maintained — the code is the source of truth for "what is", the design doc is the source of truth for "what was intended and why"
- Keep it concise — 1-3 pages for medium tasks, 3-10 pages for large
- No actual code — pseudocode is fine
- The design doc's components/phases directly feed into issue creation via `/prd-to-issues`
- Always explore the codebase before proposing architecture — ground the design in what exists today
