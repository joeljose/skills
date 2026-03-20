#!/bin/bash
# Git guardrails — wraps git to block dangerous commands
# Source this file in your shell: source block-dangerous-git.sh

safe_git() {
    local cmd="$*"

    # Check for dangerous patterns
    case "$cmd" in
        *"push --force"*|*"push -f"*)
            echo "⚠️  BLOCKED: git push --force"
            echo "This can overwrite remote history and lose other people's commits."
            echo ""
            echo "Safer alternative: git push --force-with-lease"
            echo "  (only force-pushes if no one else has pushed since your last fetch)"
            echo ""
            read -p "Proceed anyway? (type 'yes' to confirm): " confirm
            [[ "$confirm" != "yes" ]] && echo "Aborted." && return 1
            ;;
        *"reset --hard"*)
            echo "⚠️  BLOCKED: git reset --hard"
            echo "This permanently discards all uncommitted changes."
            echo ""
            echo "Safer alternative: git stash && git reset --hard"
            echo "  (stash saves your changes so you can recover them)"
            echo ""
            read -p "Proceed anyway? (type 'yes' to confirm): " confirm
            [[ "$confirm" != "yes" ]] && echo "Aborted." && return 1
            ;;
        *"clean -f"*|*"clean -fd"*)
            echo "⚠️  BLOCKED: git clean -f"
            echo "This permanently deletes untracked files."
            echo ""
            echo "Safer alternative: git clean -n (dry run to see what would be deleted)"
            echo ""
            read -p "Proceed anyway? (type 'yes' to confirm): " confirm
            [[ "$confirm" != "yes" ]] && echo "Aborted." && return 1
            ;;
        *"branch -D"*)
            echo "⚠️  BLOCKED: git branch -D"
            echo "This force-deletes a branch even if it has unmerged changes."
            echo ""
            echo "Safer alternative: git branch -d (only deletes if fully merged)"
            echo ""
            read -p "Proceed anyway? (type 'yes' to confirm): " confirm
            [[ "$confirm" != "yes" ]] && echo "Aborted." && return 1
            ;;
        *"checkout -- ."*|*"checkout ."*|*"restore ."*)
            echo "⚠️  BLOCKED: Discard all working directory changes"
            echo "This permanently discards all uncommitted modifications."
            echo ""
            echo "Safer alternative: git stash (saves changes for later recovery)"
            echo ""
            read -p "Proceed anyway? (type 'yes' to confirm): " confirm
            [[ "$confirm" != "yes" ]] && echo "Aborted." && return 1
            ;;
    esac

    command git "$@"
}

alias git='safe_git'
echo "Git guardrails active. Dangerous commands will require confirmation."
