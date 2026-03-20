---
name: write-a-skill
description: Meta-skill for creating new Claude Code skills. Use when the user says "create a skill", "write a skill", "new skill", or wants to add a skill to their collection.
---

# Write a Skill

Help the user create a new Claude Code skill with proper structure and best practices.

## Process

1. **Interview** — Ask about the skill:
   - What task should it automate or guide?
   - When should it activate? (user command, auto-trigger, or both)
   - What tools/commands does it need? (gh, git, file ops, agents)
   - Is the audience just you, or will others use it?

2. **Draft SKILL.md** — Create the skill file with:
   - Frontmatter: `name`, `description` (with "Use when..." triggers)
   - Clear step-by-step process
   - Rules section for guardrails
   - Keep under 100 lines

3. **Decide on reference files** — If the skill needs detailed guidance:
   - Keep SKILL.md as the overview (what to do)
   - Put detailed reference in separate .md files (how to do it)
   - Progressive disclosure: Claude loads SKILL.md first, references on demand

4. **Review** — Present the draft to the user. Iterate.

5. **Create files** — Write the skill to the skills repo:
   - `~/Projects/skills/[skill-name]/SKILL.md`
   - Any reference files
   - Run `~/Projects/skills/install.sh` to activate

## Skill Quality Checklist
- [ ] Description has "Use when..." trigger phrases
- [ ] Process is step-by-step, not a wall of text
- [ ] Rules prevent common mistakes
- [ ] SKILL.md is under 100 lines
- [ ] Reference files used for detailed guidance
- [ ] Tested by invoking `/skill-name` in Claude Code

## Anti-Patterns
- Skill that tries to do everything — split into focused skills
- Vague description — Claude won't know when to activate
- No rules section — Claude will take shortcuts
- Entire knowledge base in SKILL.md — use reference files
