---
name: design-an-interface
description: '"Design It Twice" — spawn parallel agents to explore different interface designs with different constraints. Use when the user says "design an interface", "API design", or is deciding between different approaches to a module boundary.'
---

# Design an Interface

Apply Ousterhout's "Design It Twice" principle. Never settle for the first interface that comes to mind.

## Process

1. **Understand the module** — Ask the user:
   - What does this module do?
   - Who are its callers?
   - What are the most common operations?
   - What are the constraints?

2. **Explore the codebase** — Understand existing patterns, conventions, and integration points.

3. **Spawn 3 parallel design agents** — Each with a different constraint:

   - **Agent A — Minimize surface area**: Fewest possible methods/endpoints. Combine operations. How simple can the interface be while still being useful?
   - **Agent B — Maximize flexibility**: Support the widest range of use cases. Composable primitives. What if requirements change significantly?
   - **Agent C — Optimize the common case**: Make the 80% use case trivially easy. Convenience over generality. What would a new developer reach for?

   Each agent should produce:
   - The interface (method signatures, types, API shape)
   - Usage example for the most common operation
   - Usage example for an edge case
   - Tradeoffs: what's easy, what's hard, what's impossible

4. **Compare** — Present all three designs in a table:
   | Criterion | Agent A | Agent B | Agent C |
   | Simplicity | | | |
   | Depth (functionality per interface element) | | | |
   | Common-case usability | | | |
   | Extensibility | | | |
   | Learnability | | | |

5. **Recommend** — Pick the best design (or a hybrid) with rationale.

6. **Iterate** — Refine based on user feedback.

## Rules
- All three designs must be genuinely different, not minor variations
- Ground designs in the actual codebase — don't design in a vacuum
- Prefer deep modules: simple interfaces hiding complex functionality
