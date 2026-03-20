---
name: debug
description: Systematic debugging workflow. Use when the user says "debug this", "help me debug", "why is this broken", or is stuck on a confusing bug.
---

# Debug

Systematic debugging to find and fix bugs without random shotgun changes.

## Process

1. **Reproduce** — Establish a reliable reproduction:
   - What are the exact steps to trigger the bug?
   - What's the expected behavior? What actually happens?
   - Is it consistent or intermittent?
   - Get the error message, stack trace, or observable symptom.

2. **Isolate** — Narrow down the problem space:
   - What changed recently? (`git log`, `git diff`)
   - What's the smallest input that triggers it?
   - Does it happen in all environments or just one?
   - Binary search: comment out half the code path — which half has the bug?

3. **Hypothesize** — Form a specific, testable hypothesis:
   - "The bug is in [module] because [evidence]"
   - NOT "something is wrong somewhere" — be specific
   - List 2-3 candidate hypotheses, ranked by likelihood

4. **Verify** — Test the top hypothesis:
   - Add logging/assertions at the suspected location
   - Run the reproduction steps
   - Does the evidence support or refute the hypothesis?
   - If refuted, move to the next hypothesis. Do NOT guess-and-fix.

5. **Fix** — Once root cause is confirmed:
   - Write a test that reproduces the bug (RED)
   - Make the minimal fix (GREEN)
   - Verify no regressions — run the full test suite
   - Clean up any debugging artifacts (logging, temporary code)

6. **Reflect** — Briefly document:
   - What was the root cause?
   - How could it have been prevented?
   - Are there similar bugs lurking elsewhere?

## Rules
- NEVER make random changes hoping something works — follow the process
- ONE hypothesis at a time — verify before moving on
- The fix must include a test that would have caught the bug
- If you can't reproduce it, you can't fix it — get reproduction first
- Check assumptions: "I know this works" is often where the bug is
