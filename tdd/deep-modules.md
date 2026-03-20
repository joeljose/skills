# Deep Modules

From John Ousterhout's "A Philosophy of Software Design."

## Core Idea
A module should have a **simple interface** but provide **deep functionality**. The interface hides complexity — callers get a lot of value without needing to understand the internals.

## Deep vs Shallow
- **Deep module**: Simple interface, lots of functionality hidden behind it.
  - Example: Unix file I/O — `open`, `read`, `write`, `close` hides filesystem complexity.
- **Shallow module**: Interface is nearly as complex as the implementation.
  - Example: A `UserValidator` class with 10 methods that each check one field — the caller has to know all the rules anyway.

## How This Applies to TDD
When designing what to test:
- Test the **deep interface**, not the shallow internals
- If your tests mirror the implementation 1:1, the module is too shallow
- A well-designed module lets you write meaningful tests through its public interface alone

## Design Signals
- If the test setup is more complex than the thing being tested → module is too shallow
- If you need 10 tests for 10 trivial methods → consolidate into fewer, deeper methods
- If testing requires exposing private methods → redesign the interface

## What to Do
- Combine related operations into fewer, more powerful methods
- Hide implementation decisions behind the interface
- Push complexity down — callers should think less, not more
