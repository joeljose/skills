---
name: tdd
description: Strict red-green-refactor TDD workflow. Use when the user says "tdd", "test-driven", "write tests first", or wants to implement a feature using TDD.
---

# Test-Driven Development

Enforce strict red-green-refactor. The cardinal rule: ONE test at a time, vertically.

## Workflow

For each behavior to implement:

1. **RED** — Write exactly ONE failing test that describes the next behavior.
   - Run it. Confirm it fails. Show the failure.
   - The test name should describe the behavior, not the implementation.

2. **GREEN** — Write the MINIMUM code to make that one test pass.
   - No extra logic. No "while I'm here" additions.
   - Run all tests. Confirm they pass.

3. **REFACTOR** — Clean up while all tests stay green.
   - Remove duplication, improve names, simplify.
   - Run tests after each change.

4. **Repeat** — Pick the next behavior. Go to step 1.

## Rules
- NEVER write multiple tests before implementing — this is horizontal, not vertical
- NEVER write production code without a failing test demanding it
- NEVER skip the red step — if the test passes immediately, it's not testing new behavior
- Keep tests focused: one behavior per test, no "and" in test names
- Test behavior, not implementation — tests shouldn't break when you refactor

## Reference Guides
For deeper guidance, read these files in this skill's directory:
- `tests.md` — What makes a good vs bad test
- `mocking.md` — When and how to use mocks
- `deep-modules.md` — Designing modules with simple interfaces and deep functionality
- `interface-design.md` — Interface-first thinking for TDD
- `refactoring.md` — Refactoring patterns during the green-to-refactor step
