---
name: triage-task
description: Route tasks to the right-sized pipeline. Use when starting any new task, the user says "triage this", "new task", or before deciding whether to write a full PRD.
---

# Triage Task

Assess task complexity and route to the right-sized pipeline.

## Process

1. **Understand the task** — Ask the user to describe what they want to do. If context already exists in this session (bug report, feature idea, code review), summarize it and confirm.

2. **Assess** — Evaluate:
   - **Type**: bug, feature, refactor, docs, chore
   - **Scope**: How many files/modules are affected?
   - **Risk**: Could this break existing behavior?
   - **Unknowns**: Are there design decisions to make?

3. **Classify and recommend a path**:

   **Small — docs/chore** (1-2 files, no design decisions, <30 min)
   → Create one GitHub issue → branch → implement → `/finish` → `/release` (if needed)
   Examples: typo fix, config change, CI tweak, documentation update

   **Small — code** (1-2 files, no design decisions, <30 min)
   → Create one GitHub issue → branch → `/tdd` → `/finish` → `/release` (if needed)
   Examples: simple bug fix, add a test, small refactor

   **Medium** (2-5 files, one module, clear scope)
   → `/write-a-prd` (lightweight) → `/design-doc` (mini) → `/prd-to-issues` → branch → `/tdd` (per issue) → `/finish` → `/release`
   Examples: new endpoint, add validation, refactor a module

   **Large** (cross-cutting, design decisions, multiple modules)
   → `/write-a-prd` → `/grill-me` → `/design-doc` → `/prd-to-issues` → branch → `/tdd` (per issue) → `/simplify` → `/finish` → `/release`
   Examples: new feature spanning multiple systems, architecture change, new integration

4. **Present the recommendation** — Show:
   ```
   Type: [type]
   Complexity: [Small / Medium / Large]
   Testing: [/tdd | not required]
   Recommended path: [pipeline]
   Reason: [one sentence]
   ```
   Ask the user to confirm or override.

5. **Execute** — Once confirmed, start the first step of the chosen path:
   - **Small**: Create a GitHub issue with `gh issue create`, create a feature branch (`git checkout -b feature/short-description`), and begin implementation
   - **Medium/Large**: Create a GitHub issue or invoke `/write-a-prd`, then create a feature branch before implementation begins

## Rules
- Always create at least one GitHub issue before coding — never skip straight to implementation
- Always create a feature branch before implementing — never commit directly to `main`
- When in doubt between two sizes, recommend the smaller one
- Let the user override — this is a recommendation, not a gate
- If the task is genuinely trivial (rename a variable, fix a typo), Small is correct even if it feels like overkill
- For docs and chore tasks, testing is not required. For all other types, `/tdd` is the implementation method — tests are written before code and committed together, before pushing.
