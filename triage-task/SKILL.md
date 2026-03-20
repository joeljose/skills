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

   **Small** (1-2 files, no design decisions, <30 min)
   → Create one GitHub issue → implement → `/finish`
   Examples: typo fix, config change, simple bug fix, add a test

   **Medium** (2-5 files, one module, clear scope)
   → Lightweight PRD via `/write-a-prd` (problem + scope + acceptance only) → `/prd-to-issues` → implement → `/finish`
   Examples: new endpoint, add validation, refactor a module

   **Large** (cross-cutting, design decisions, multiple modules)
   → `/write-a-prd` → `/grill-me` → `/prd-to-issues` → implement → `/simplify` → `/finish`
   Examples: new feature spanning multiple systems, architecture change, new integration

4. **Present the recommendation** — Show:
   ```
   Type: [type]
   Complexity: [Small / Medium / Large]
   Recommended path: [pipeline]
   Reason: [one sentence]
   ```
   Ask the user to confirm or override.

5. **Execute** — Once confirmed, start the first step of the chosen path:
   - **Small**: Create a GitHub issue with `gh issue create` and begin implementation
   - **Medium/Large**: Invoke `/write-a-prd`

## Rules
- Always create at least one GitHub issue before coding — never skip straight to implementation
- When in doubt between two sizes, recommend the smaller one
- Let the user override — this is a recommendation, not a gate
- If the task is genuinely trivial (rename a variable, fix a typo), Small is correct even if it feels like overkill
