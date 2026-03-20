# Refactoring in TDD

The refactor step is where design improvement happens. All tests must stay green throughout.

## When to Refactor
- After making a test pass (the "refactor" in red-green-refactor)
- When you see duplication across tests or production code
- When a name no longer describes what something does
- When a method is doing more than one thing

## Safe Refactoring Moves
These preserve behavior by construction:

- **Extract method**: Pull a block into a named method
- **Inline method**: Replace a trivial method with its body
- **Rename**: Make names match what things actually do
- **Extract variable**: Name a complex expression
- **Introduce parameter**: Replace a hardcoded value with a parameter
- **Move method**: Put a method on the class that has the data it needs

## Process
1. All tests are green
2. Make ONE refactoring move
3. Run all tests — still green?
4. If green, commit. If red, undo and try a smaller move.
5. Repeat

## Rules
- NEVER refactor and add new behavior at the same time
- NEVER refactor with failing tests
- Small moves — if you can't describe the refactoring in one sentence, break it into smaller moves
- Refactoring tests is just as important as refactoring production code
- If a refactoring breaks a test, the test was testing implementation, not behavior — fix the test
