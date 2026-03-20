#!/bin/bash
# Symlinks all skill directories from this repo into ~/.claude/skills/
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.claude/skills"

mkdir -p "$TARGET_DIR"

linked=0
for skill_dir in "$REPO_DIR"/*/; do
    skill_name=$(basename "$skill_dir")
    [[ "$skill_name" == "scripts" || "$skill_name" == ".git" ]] && continue
    [[ ! -f "$skill_dir/SKILL.md" ]] && continue
    ln -sfn "$skill_dir" "$TARGET_DIR/$skill_name"
    echo "Linked: $skill_name"
    linked=$((linked + 1))
done

echo ""
echo "Done. $linked skills linked to $TARGET_DIR"
