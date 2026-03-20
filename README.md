# Claude Code Skills Collection

A personal collection of reusable [Claude Code](https://docs.anthropic.com/en/docs/claude-code) skills for planning, development, and tooling workflows.

## Installation

Clone this repo and run the install script to symlink all skills into `~/.claude/skills/`:

```bash
git clone git@github.com:joeljose/skills.git ~/Projects/skills
cd ~/Projects/skills
./install.sh
```

Skills are symlinked, so edits to this repo are immediately available in Claude Code.

## Uninstallation

```bash
./uninstall.sh
```

## Skills

### Pipeline
| Skill | Description |
|-------|-------------|
| `triage-task` | Assess task complexity and route to the right-sized pipeline |
| `finish` | Post-implementation verification — run tests, check CI, close issues, cleanup |
| `release` | Cut a release — bump version, update changelog, commit, tag, and hand off to /finish |
| `simplify` | Post-implementation refactoring pass on recently changed code |

### Planning
| Skill | Description |
|-------|-------------|
| `write-a-prd` | Interactive PRD creation — interviews you, explores codebase, writes structured PRD as GitHub issue |
| `prd-to-plan` | Breaks a PRD into phased implementation plan using vertical "tracer bullet" slices |
| `prd-to-issues` | Like prd-to-plan but creates actual GitHub issues per slice |
| `grill-me` | Stress-test your plan — Claude relentlessly questions every decision |
| `design-doc` | Create a technical design doc — architecture, alternatives, tradeoffs — before breaking into issues |

### Development
| Skill | Description |
|-------|-------------|
| `tdd` | Strict red-green-refactor TDD workflow with reference guides |
| `triage-issue` | Autonomous bug investigation → root cause → GitHub issue with TDD fix plan |
| `design-an-interface` | "Design It Twice" — spawns parallel agents with different constraints |
| `improve-architecture` | Finds architectural friction, proposes redesigns via parallel agents |

### Tooling
| Skill | Description |
|-------|-------------|
| `git-guardrails` | Blocks dangerous git commands before execution + commit message policies |
| `write-a-skill` | Meta-skill for creating new Claude Code skills |
| `code-review` | Structured code review with severity-rated findings + CI/CD checks |
| `security-audit` | Scan for common vulnerabilities and secrets |
| `explain-codebase` | Generate architecture overview for onboarding |
| `debug` | Systematic debugging: reproduce → isolate → hypothesize → verify → fix |

## Recommended Pipeline

Start with `/triage-task` to route to the right-sized workflow:

```
/triage-task  →  routes to:

  SMALL (docs/chore):  issue → branch → implement → /finish → /release (if needed)
  SMALL (code):        issue → branch → /tdd → /finish → /release (if needed)
  MEDIUM:              /write-a-prd → /design-doc (mini) → /prd-to-issues → branch → /tdd → /finish → /release
  LARGE:               /write-a-prd → /grill-me → /design-doc → /prd-to-issues → branch → /tdd → /simplify → /finish → /release
```

## Usage

In Claude Code, type `/skill-name` to invoke any skill. For example:

```
/triage-task
/tdd
/code-review
```

## Creating New Skills

Use the meta-skill: `/write-a-skill`

Or manually create a directory with a `SKILL.md` file and run `./install.sh`.
