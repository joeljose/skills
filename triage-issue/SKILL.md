---
name: triage-issue
description: Autonomous bug investigation — traces code path, finds root cause, creates GitHub issue with TDD fix plan. Use when the user reports a bug, says "triage this", or wants help investigating an issue.
---

# Triage Issue

Autonomously investigate a bug and produce a GitHub issue with a fix plan.

## Process

1. **Gather symptoms** — Ask the user to describe:
   - What happened vs what they expected
   - Steps to reproduce (if known)
   - Error messages, stack traces, logs

2. **Investigate** — Autonomously trace the code path:
   - Start from the entry point (route, handler, CLI command)
   - Follow the data flow through each layer
   - Identify where the actual behavior diverges from expected
   - Check recent changes to the affected code (`git log`)
   - Look for related issues or known problems

3. **Identify root cause** — State clearly:
   - What the bug is
   - Where in the code it occurs (file + line)
   - Why it happens (the underlying cause, not just the symptom)

4. **Create the issue** — Use `gh issue create` with:
   - **Title**: Concise description of the bug
   - **Description**:
     - Symptoms and reproduction steps
     - Root cause analysis
     - Affected code paths
   - **Fix Plan** as a TDD sequence:
     - RED: Specific test that reproduces the bug
     - GREEN: Minimal fix to make the test pass
     - REFACTOR: Any cleanup needed
   - **Labels**: `bug`, severity level

## Rules
- Investigate thoroughly before concluding — don't guess at root causes
- The fix plan must start with a failing test that reproduces the bug
- If you can't determine root cause with confidence, say so and list hypotheses
