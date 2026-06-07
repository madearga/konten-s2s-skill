#!/usr/bin/env bash
# install.sh — Cross-platform installer for storyboard-to-seedance-suite
#
# Symlinks the canonical skill (in ~/.hermes/skills/...) to other agent platforms:
#   - Claude Code:   ~/.claude/skills/<name>
#   - OpenCode:      ~/.opencode/skills/<name>  (and ~/.config/opencode/skills/<name>)
#   - Codex CLI:     ~/.codex/skills/<name>     (optional, same SKILL.md format)
#
# Usage:
#   ./install.sh           # install (idempotent — safe to re-run)
#   ./install.sh --check   # check install status without changing anything
#   ./install.sh --remove  # remove symlinks (keeps canonical source intact)
#
# Why symlinks (not copies):
#   - Single source of truth: edit once in Hermes, all platforms see update
#   - No drift between Claude Code / OpenCode / Hermes versions
#   - Easy to update: re-run install.sh after editing the canonical SKILL.md
#   - Easy to remove: ./install.sh --remove
#
# Why this works:
#   - Hermes, Claude Code, OpenCode, Codex all use the same SKILL.md format
#   - Hermes-specific frontmatter (triggers, version) is ignored by other platforms
#   - Sub-files in references/ and commands/ are loaded as supporting material

set -e

SKILL_NAME="storyboard-to-seedance-suite"
CANONICAL="/root/.hermes/skills/mlops/ai-video-production/${SKILL_NAME}"

# Platform target paths
CLAUDE_TARGET="$HOME/.claude/skills/${SKILL_NAME}"
OPENCODE_TARGET="$HOME/.opencode/skills/${SKILL_NAME}"
OPENCODE_CONFIG_TARGET="$HOME/.config/opencode/skills/${SKILL_NAME}"
CODEX_TARGET="$HOME/.codex/skills/${SKILL_NAME}"

MODE="${1#--}"
MODE="${MODE:-install}"  # strip leading -- if present, default to install

# --- Sanity check canonical source ---
if [ ! -f "${CANONICAL}/SKILL.md" ]; then
  echo "ERROR: Canonical skill not found at ${CANONICAL}"
  echo "Run from a system where the skill is installed in Hermes."
  exit 1
fi

# --- Helper: check if a path is a valid symlink to canonical ---
is_valid_link() {
  local target="$1"
  [ -L "$target" ] && [ "$(readlink -f "$target")" = "$(readlink -f "$CANONICAL")" ]
}

# --- Helper: create or refresh a symlink ---
link_skill() {
  local target="$1"
  local label="$2"

  # Create parent dir if missing
  mkdir -p "$(dirname "$target")"

  if is_valid_link "$target"; then
    echo "  [OK]    $label: $target (already linked)"
    return 0
  fi

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    # Real file/dir exists, not a symlink — back it up
    local backup="${target}.bak-$(date +%Y%m%d-%H%M%S)"
    echo "  [WARN]  $label: real path exists, backing up to $backup"
    mv "$target" "$backup"
  fi

  if [ -L "$target" ]; then
    # Stale or wrong symlink — replace
    rm "$target"
  fi

  ln -s "$CANONICAL" "$target"
  echo "  [NEW]   $label: $target -> $CANONICAL"
}

# --- Helper: remove a symlink (if it's a link to our canonical) ---
unlink_skill() {
  local target="$1"
  local label="$2"

  if is_valid_link "$target"; then
    rm "$target"
    echo "  [REM]   $label: $target (removed)"
  elif [ -L "$target" ]; then
    echo "  [SKIP]  $label: $target (symlink, but not to our canonical — leaving alone)"
  elif [ -e "$target" ]; then
    echo "  [SKIP]  $label: $target (real file/dir, not a symlink — leaving alone)"
  else
    echo "  [N/A]   $label: not present"
  fi
}

# --- Mode dispatcher ---
case "$MODE" in
  install)
    echo "Installing '${SKILL_NAME}' cross-platform..."
    echo "Canonical source: $CANONICAL"
    echo ""
    echo "Platforms:"
    link_skill "$CLAUDE_TARGET"          "Claude Code   "
    link_skill "$OPENCODE_TARGET"        "OpenCode (home)"
    link_skill "$OPENCODE_CONFIG_TARGET" "OpenCode (xdg) "
    link_skill "$CODEX_TARGET"           "Codex CLI     "
    echo ""
    echo "Done. Verify with: ./install.sh --check"
    echo ""
    echo "To test in each platform:"
    echo "  Claude Code: claude  ->  ask 'bikinin prompt video buat nasi goreng'"
    echo "  OpenCode:    opencode  ->  ask same"
    echo "  Hermes:      (already works — used to build the suite)"
    ;;

  check)
    echo "Install status for '${SKILL_NAME}':"
    echo "Canonical: $CANONICAL"
    [ -f "${CANONICAL}/SKILL.md" ] && echo "  [OK]   canonical source present" || echo "  [FAIL] canonical source MISSING"
    echo ""
    echo "Platforms:"
    for entry in "Claude Code:$CLAUDE_TARGET" "OpenCode (home):$OPENCODE_TARGET" "OpenCode (xdg):$OPENCODE_CONFIG_TARGET" "Codex CLI:$CODEX_TARGET"; do
      label="${entry%%:*}"
      target="${entry#*:}"
      if is_valid_link "$target"; then
        echo "  [OK]    $label: linked to canonical"
      elif [ -L "$target" ]; then
        echo "  [STALE] $label: symlink exists but doesn't point to canonical (target: $(readlink "$target"))"
      elif [ -e "$target" ]; then
        echo "  [REAL]  $label: real file/dir (not a symlink)"
      else
        echo "  [N/A]   $label: not present"
      fi
    done
    echo ""
    echo "Frontmatter cross-check (what each platform reads):"
    echo "  name:        $(grep '^name:' "${CANONICAL}/SKILL.md" | head -1 | sed 's/name: *//')"
    echo "  description: $(grep '^description:' "${CANONICAL}/SKILL.md" | head -1 | sed 's/description: *//' | cut -c1-100)..."
    echo "  triggers:    $(grep -c '^  - ' "${CANONICAL}/SKILL.md") keywords (Hermes only — others ignore)"
    ;;

  remove)
    echo "Removing '${SKILL_NAME}' from cross-platform locations..."
    echo "Canonical source UNTOUCHED: $CANONICAL"
    echo ""
    unlink_skill "$CLAUDE_TARGET"          "Claude Code   "
    unlink_skill "$OPENCODE_TARGET"        "OpenCode (home)"
    unlink_skill "$OPENCODE_CONFIG_TARGET" "OpenCode (xdg) "
    unlink_skill "$CODEX_TARGET"           "Codex CLI     "
    echo ""
    echo "Done. To re-install: ./install.sh"
    ;;

  *)
    echo "Usage: $0 [install|check|remove]"
    exit 1
    ;;
esac
