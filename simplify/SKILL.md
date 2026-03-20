---
name: simplify
description: Post-implementation refactoring pass on recently changed code. Use after implementation, when the user says "simplify", "clean this up", or wants to reduce complexity in recent changes.
---

# Simplify

Refactoring pass focused only on recently changed code.

## Process

1. **Identify recent changes** — Use `git diff` (or `git diff HEAD~N` for recent commits) to find files changed in the current task.

2. **Scan for simplification opportunities**:
   - **Duplication**: Similar code blocks that could share a function
   - **Complex conditionals**: Nested if/else that could be flattened or use early returns
   - **Unnecessary abstractions**: Indirection that adds complexity without value
   - **Dead code**: Unused imports, variables, or functions introduced in the changes
   - **Over-engineering**: Feature flags, config options, or extension points that aren't needed yet

3. **Apply simplifications** — For each opportunity:
   - Make the change
   - Run tests to verify behavior is preserved
   - If tests fail, revert and move on

4. **Present results** — Show a before/after diff for each simplification:
   ```
   ### [Description of simplification]
   **Before**: [relevant code snippet]
   **After**: [simplified code snippet]
   **Why**: [one sentence explanation]
   ```

5. **Ask for approval** — Let the user accept, reject, or modify each change.

## Rules
- ONLY simplify code that was recently changed — do not refactor unrelated code
- Every simplification must pass existing tests — no behavior changes
- If nothing is worth simplifying, say so and move on
- Prefer removing code over adding code
- Do not add comments, docstrings, or type annotations unless the user asks
