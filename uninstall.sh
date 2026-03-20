#!/bin/bash
# Removes symlinks in ~/.claude/skills/ that point back to this repo
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.claude/skills"

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Nothing to uninstall — $TARGET_DIR does not exist."
    exit 0
fi

removed=0
for link in "$TARGET_DIR"/*/; do
    [[ ! -L "${link%/}" ]] && continue
    target=$(readlink -f "${link%/}")
    if [[ "$target" == "$REPO_DIR"/* ]]; then
        rm "${link%/}"
        echo "Removed: $(basename "${link%/}")"
        removed=$((removed + 1))
    fi
done

echo ""
echo "Done. $removed symlinks removed from $TARGET_DIR"
