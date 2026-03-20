---
name: explain-codebase
description: Generate an architecture overview of a codebase. Use when onboarding to a new project, the user says "explain this codebase", "how does this work", or "give me an overview".
---

# Explain Codebase

Generate a comprehensive architecture overview for onboarding.

## Process

1. **Identify the project** — Use the current working directory, or ask the user which repo/directory to explain.

2. **Discover structure** — Explore:
   - Top-level files: README, package.json/Cargo.toml/go.mod/etc.
   - Directory structure and naming conventions
   - Configuration files (CI, Docker, linting, etc.)

3. **Identify tech stack**:
   - Language(s) and framework(s)
   - Database(s) and data stores
   - External services and APIs
   - Build tools and dependency management

4. **Map the architecture**:
   - **Entry points**: Where does execution start? (main, server, CLI)
   - **Key modules**: What are the major components?
   - **Data flow**: How does data move through the system?
   - **Boundaries**: Where are the system boundaries? (API, DB, external services)
   - **Patterns**: What architectural patterns are used? (MVC, microservices, event-driven)

5. **Highlight important details**:
   - Key abstractions and their purposes
   - Non-obvious conventions or patterns
   - Areas of complexity or technical debt
   - Testing approach and coverage patterns

6. **Present the overview** — Structured as:
   ```
   ## Tech Stack
   ## Architecture
   ## Entry Points
   ## Key Modules
   ## Data Flow
   ## Conventions & Patterns
   ## Areas of Note
   ```

## Rules
- Start high-level, add detail on request — don't dump everything at once
- Ground explanations in actual code, not assumptions
- Flag things that are confusing or unconventional — that's what newcomers need most
- Skip boilerplate and generated code — focus on what humans wrote and need to understand
