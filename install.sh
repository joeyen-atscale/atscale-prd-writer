#!/usr/bin/env bash
# install.sh — install the atscale-prd-writer Claude Code skill.
#
# Two modes:
#   1. Repo-local: run as `./install.sh` from a checkout. Symlinks
#      ~/.claude/skills/atscale-prd-writer -> <repo>/skill.
#   2. Curl-piped: `curl ... | bash`. Self-clones into
#      ~/.local/share/atscale-prd-writer, then symlinks.
set -euo pipefail

SKILL_TARGET="$HOME/.claude/skills/atscale-prd-writer"

SCRIPT_PATH="${BASH_SOURCE[0]:-$0}"
REPO_DIR=""
if [ -f "$SCRIPT_PATH" ]; then
  REPO_DIR=$(cd "$(dirname "$SCRIPT_PATH")" && pwd)
fi

# --- Mode 2: curl|bash self-clone -------------------------------------------
if [ -z "$REPO_DIR" ] || [ ! -f "$REPO_DIR/skill/SKILL.md" ]; then
  echo "→ no local checkout detected; self-cloning joeyen-atscale/atscale-prd-writer..."
  command -v git >/dev/null 2>&1 || { echo "fatal: git not found" >&2; exit 1; }
  CLONE_ROOT="${ATSCALE_PRD_WRITER_CLONE_ROOT:-$HOME/.local/share/atscale-prd-writer}"
  mkdir -p "$(dirname "$CLONE_ROOT")"
  if [ -d "$CLONE_ROOT/.git" ]; then
    echo "→ refreshing existing clone at $CLONE_ROOT"
    git -C "$CLONE_ROOT" fetch --depth 1 origin main
    git -C "$CLONE_ROOT" reset --hard origin/main
  else
    echo "→ sparse clone into $CLONE_ROOT"
    git clone --depth 1 --filter=blob:none --sparse \
      https://github.com/joeyen-atscale/atscale-prd-writer.git "$CLONE_ROOT"
    git -C "$CLONE_ROOT" sparse-checkout set skill
  fi
  REPO_DIR="$CLONE_ROOT"
fi

# --- Symlink the skill -------------------------------------------------------
mkdir -p "$(dirname "$SKILL_TARGET")"
rm -rf "$SKILL_TARGET"
ln -s "$REPO_DIR/skill" "$SKILL_TARGET"
echo "→ skill linked: $SKILL_TARGET -> $REPO_DIR/skill"
echo "✓ atscale-prd-writer installed. Use /atscale-prd-writer in Claude Code."
