---
name: security-audit
description: Scan codebase for common vulnerabilities and secrets. Use when the user says "security audit", "check for vulnerabilities", "security scan", or before deploying to production.
---

# Security Audit

Systematic scan for common security vulnerabilities.

## Process

1. **Scope** — Determine what to audit:
   - Entire codebase, specific module, or recent changes
   - Identify the tech stack to focus the right checks

2. **Scan for vulnerabilities** — Check each category:

   **Injection**
   - SQL injection: raw queries with string concatenation
   - Command injection: `exec`, `system`, `eval` with user input
   - XSS: unescaped user content in HTML/templates
   - Path traversal: user input in file paths without sanitization

   **Authentication & Authorization**
   - Missing auth checks on sensitive endpoints
   - Weak password requirements or storage (plaintext, weak hash)
   - Session management issues (fixation, no expiry)
   - Missing CSRF protection on state-changing requests

   **Secrets & Configuration**
   - Hardcoded API keys, passwords, tokens
   - Secrets in git history (`git log -p -S "password"`)
   - `.env` files or credentials committed to repo
   - Overly permissive CORS, debug mode in production configs

   **Dependencies**
   - Known vulnerabilities in dependencies (check advisories)
   - Outdated packages with security patches available
   - Unnecessary dependencies increasing attack surface

   **Data Handling**
   - PII logged or exposed in errors
   - Missing encryption for sensitive data at rest/in transit
   - Overly broad data access (returning full objects when only IDs needed)

3. **Report findings** — For each vulnerability:
   ```
   **[SEVERITY] Title** — file:line
   Category: [Injection/Auth/Secrets/Dependencies/Data]
   Risk: What an attacker could do
   Fix: Specific remediation steps
   ```

   Severity: 🔴 Critical | 🟡 High | 🔵 Medium | ⚪ Low

4. **Prioritized summary** — Ordered by severity, with quick wins highlighted.

## Rules
- Search broadly, report specifically — don't report vague "might be vulnerable"
- Include proof: show the vulnerable code, not just the file name
- Suggest specific fixes, not "fix the vulnerability"
- Don't report false positives — verify before reporting
