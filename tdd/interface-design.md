# Interface-First Design for TDD

## The Principle
Before writing any implementation, think about the interface the caller will use. The test IS the first caller — so writing a test first forces you to design the interface first.

## Process
1. What does the caller need to do? (the method signature)
2. What does the caller need to provide? (the inputs)
3. What does the caller get back? (the outputs)
4. What can go wrong? (the error cases)

Write tests that answer these questions. The implementation follows.

## Good Interface Design
- **Minimal inputs**: Don't make callers provide information the module could figure out itself
- **Obvious naming**: The method name should make the test name redundant
- **Consistent abstractions**: All methods on a class should operate at the same level of abstraction
- **Fail loudly**: Invalid inputs should produce clear errors, not silent wrong behavior

## Anti-Patterns
- **Config object soup**: Passing a giant options bag instead of designing clear parameters
- **Stringly-typed interfaces**: Using strings for things that should be enums or types
- **Leaky abstractions**: Interface that exposes internal implementation details
- **Feature envy**: Interface that requires the caller to do work the module should do

## TDD Connection
If your first test is awkward to write, the interface is wrong. Iterate on the interface (the test) before writing any implementation. The test should read like documentation of how to use the module.
