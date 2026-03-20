# Mocking Guide

## When to Mock
- **External services**: APIs, databases, file systems, network calls
- **Non-deterministic behavior**: Time, randomness, UUIDs
- **Slow dependencies**: Anything that makes tests take seconds instead of milliseconds

## When NOT to Mock
- **Your own code**: If you're mocking your own classes, the design is probably wrong
- **Value objects**: Don't mock data — just construct it
- **Everything**: If a test mocks 5 things, it's testing nothing real

## Mock Hierarchy (prefer top to bottom)
1. **Real implementation** — Use the real thing when possible
2. **Fake** — Lightweight in-memory implementation (e.g., in-memory DB)
3. **Stub** — Returns canned responses, no behavior verification
4. **Mock** — Verifies specific interactions (use sparingly)

## Rules
- Mock at the boundary, not in the middle of your code
- If you need to mock an internal class, that's a design smell — inject the dependency instead
- One mock per test maximum. If you need more, the unit under test has too many responsibilities.
- Never mock what you don't own — wrap it in an adapter first, then mock the adapter
