#!/usr/bin/env bash
# install.sh — Cross-platform installer for storyboard-to-seedance-suite
#
# Symlinks this skill to other agent platforms:
#   Skill (SKILL.md + commands/ + references/) — auto-discovered by:
#     - Hermes
#     - Claude Code:   ~/.claude/skills/<name>
#     - OpenCode:      ~/.config/opencode/skills/<name>  (and ~/.opencode/skills/<name>)
#     - Codex CLI:     ~/.codex/skills/<name>
#     - Pi:            ~/.pi/agent/skills/<name>
#   Slash commands (/s2s-* in autocomplete) — for platforms that DON'T auto-discover
#   a `commands/` folder:
#     - Pi:            ~/.pi/agent/prompts/s2s-*.md
#     - OpenCode:      ~/.config/opencode/command/s2s-*.md
#
# Usage:
#   ./install.sh           # install (idempotent — safe to re-run)
#   ./install.sh --check   # check install status without changing anything
#   ./install.sh --remove  # remove symlinks (keeps canonical source intact)
#
# Why symlinks (not copies):
#   - Single source of truth: edit once here, all platforms see the update
#   - No drift between platforms
#   - Easy to update: re-run install.sh after editing
#   - Easy to remove: ./install.sh --remove

set -e

SKILL_NAME="storyboard-to-seedance-suite"

# Auto-detect canonical source = directory containing this script.
# Falls back to the Hermes path if invoked from elsewhere without a local SKILL.md.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd)"
if [ -f "${SCRIPT_DIR}/SKILL.md" ]; then
  CANONICAL="$SCRIPT_DIR"
else
  CANONICAL="${HERMES_CANONICAL:-/root/.hermes/skills/mlops/ai-video-production/${SKILL_NAME}}"
fi

# --- Skill target paths (the SKILL.md bundle) ---
CLAUDE_TARGET="$HOME/.claude/skills/${SKILL_NAME}"
OPENCODE_TARGET="$HOME/.opencode/skills/${SKILL_NAME}"
OPENCODE_CONFIG_TARGET="$HOME/.config/opencode/skills/${SKILL_NAME}"
CODEX_TARGET="$HOME/.codex/skills/${SKILL_NAME}"
PI_SKILL_TARGET="$HOME/.pi/agent/skills/${SKILL_NAME}"

# --- Slash-command target dirs (for platforms without commands/ auto-discovery) ---
PI_PROMPTS_DIR="$HOME/.pi/agent/prompts"
OPENCODE_COMMAND_DIR="$HOME/.config/opencode/command"

MODE="${1#--}"
MODE="${MODE:-install}"  # strip leading -- if present, default to install

# --- Sanity check canonical source ---
if [ ! -f "${CANONICAL}/SKILL.md" ]; then
  echo "ERROR: Canonical skill not found at ${CANONICAL}"
  echo "Run this script from inside the cloned repo (it auto-detects its own dir),"
  echo "or set HERMES_CANONICAL=/path/to/skill ./install.sh"
  exit 1
fi

SLASH_SRC="${CANONICAL}/slash-commands"

# --- Helper: check if a path is a valid symlink to canonical ---
is_valid_link() {
  local target="$1"
  local dest="$2"
  [ -L "$target" ] && [ "$(readlink -f "$target")" = "$(readlink -f "$dest")" ]
}

# --- Helper: create or refresh a symlink (target -> dest) ---
link_to() {
  local target="$1"   # the symlink path to create
  local dest="$2"     # what it should point at
  local label="$3"

  mkdir -p "$(dirname "$target")"

  if is_valid_link "$target" "$dest"; then
    echo "  [OK]    $label: $target (already linked)"
    return 0
  fi

  if [ -e "$target" ] && [ ! -L "$target" ]; then
    local backup="${target}.bak-$(date +%Y%m%d-%H%M%S)"
    echo "  [WARN]  $label: real file exists, backing up to $backup"
    mv "$target" "$backup"
  fi

  if [ -L "$target" ]; then
    rm "$target"
  fi

  ln -s "$dest" "$target"
  echo "  [NEW]   $label: $target -> $dest"
}

# --- Helper: remove a symlink if it points at our canonical/dest ---
unlink_path() {
  local target="$1"
  local dest="$2"
  local label="$3"

  if is_valid_link "$target" "$dest"; then
    rm "$target"
    echo "  [REM]   $label: $target (removed)"
  elif [ -L "$target" ]; then
    echo "  [SKIP]  $label: $target (symlink, but not ours — leaving alone)"
  elif [ -e "$target" ]; then
    echo "  [SKIP]  $label: $target (real file/dir — leaving alone)"
  else
    echo "  [N/A]   $label: not present"
  fi
}

# --- Link every slash-commands/*.md into a target dir (pi / opencode) ---
link_slash_commands() {
  local dest_dir="$1"
  local label="$2"
  if [ ! -d "$SLASH_SRC" ]; then
    echo "  [SKIP]  $label: no slash-commands/ in canonical source"
    return
  fi
  mkdir -p "$dest_dir"
  for src in "$SLASH_SRC"/*.md; do
    [ -e "$src" ] || continue
    local fname
    fname="$(basename "$src")"
    link_to "${dest_dir}/${fname}" "$src" "$label/$fname"
  done
}

# --- Unlink every slash-command from a target dir ---
unlink_slash_commands() {
  local dest_dir="$1"
  local label="$2"
  if [ ! -d "$SLASH_SRC" ]; then return; fi
  for src in "$SLASH_SRC"/*.md; do
    [ -e "$src" ] || continue
    local fname
    fname="$(basename "$src")"
    unlink_path "${dest_dir}/${fname}" "$src" "$label/$fname"
  done
}

# --- Mode dispatcher ---
case "$MODE" in
  install)
    echo "Installing '${SKILL_NAME}' cross-platform..."
    echo "Canonical source: $CANONICAL"
    echo ""
    echo "Skill bundle (SKILL.md + commands/ + references/):"
    link_to "$CLAUDE_TARGET"          "$CANONICAL" "Claude Code    "
    link_to "$OPENCODE_TARGET"        "$CANONICAL" "OpenCode (home)"
    link_to "$OPENCODE_CONFIG_TARGET" "$CANONICAL" "OpenCode (xdg) "
    link_to "$CODEX_TARGET"           "$CANONICAL" "Codex CLI      "
    link_to "$PI_SKILL_TARGET"        "$CANONICAL" "Pi (skill)     "
    echo ""
    echo "Slash commands (/s2s-* in autocomplete — portable wrappers):"
    link_slash_commands "$PI_PROMPTS_DIR"       "Pi prompts    "
    link_slash_commands "$OPENCODE_COMMAND_DIR" "OpenCode cmd  "
    echo ""
    echo "Done. Verify with: ./install.sh --check"
    echo ""
    echo "Notes:"
    echo "  - Hermes: commands/*.md are auto-discovered — nothing to link."
    echo "  - Claude Code / Cursor / Codex: read the skill bundle directly."
    echo "  - Pi: /skill:${SKILL_NAME} loads the skill; /s2s-* are the capability shortcuts."
    echo "  - OpenCode: /s2s-* appear in the slash menu."
    ;;

  check)
    echo "Install status for '${SKILL_NAME}':"
    echo "Canonical: $CANONICAL"
    [ -f "${CANONICAL}/SKILL.md" ] && echo "  [OK]   canonical source present" || echo "  [FAIL] canonical source MISSING"
    echo ""
    echo "Skill bundle links:"
    for entry in \
      "Claude Code:$CLAUDE_TARGET" \
      "OpenCode (home):$OPENCODE_TARGET" \
      "OpenCode (xdg):$OPENCODE_CONFIG_TARGET" \
      "Codex CLI:$CODEX_TARGET" \
      "Pi (skill):$PI_SKILL_TARGET"; do
      label="${entry%%:*}"; target="${entry#*:}"
      if is_valid_link "$target" "$CANONICAL"; then
        echo "  [OK]    $label: linked"
      elif [ -L "$target" ]; then
        echo "  [STALE] $label: symlink -> $(readlink "$target")"
      elif [ -e "$target" ]; then
        echo "  [REAL]  $label: real path (not a symlink)"
      else
        echo "  [N/A]   $label: not present"
      fi
    done
    echo ""
    echo "Slash commands:"
    if [ -d "$SLASH_SRC" ]; then
      echo "  Source has $(ls "$SLASH_SRC"/*.md 2>/dev/null | wc -l | tr -d ' ') command(s)."
      for f in "$PI_PROMPTS_DIR"/s2s-*.md "$OPENCODE_COMMAND_DIR"/s2s-*.md; do
        [ -e "$f" ] || [ -L "$f" ] || continue
        if [ -L "$f" ]; then
          echo "  [LINK]  $f -> $(readlink "$f")"
        else
          echo "  [REAL]  $f (not a symlink — may be stale)"
        fi
      done
    else
      echo "  No slash-commands/ in canonical source."
    fi
    ;;

  remove)
    echo "Removing '${SKILL_NAME}' from cross-platform locations..."
    echo "Canonical source UNTOUCHED: $CANONICAL"
    echo ""
    unlink_path "$CLAUDE_TARGET"          "$CANONICAL" "Claude Code    "
    unlink_path "$OPENCODE_TARGET"        "$CANONICAL" "OpenCode (home)"
    unlink_path "$OPENCODE_CONFIG_TARGET" "$CANONICAL" "OpenCode (xdg) "
    unlink_path "$CODEX_TARGET"           "$CANONICAL" "Codex CLI      "
    unlink_path "$PI_SKILL_TARGET"        "$CANONICAL" "Pi (skill)     "
    echo ""
    echo "Slash commands:"
    unlink_slash_commands "$PI_PROMPTS_DIR"       "Pi prompts    "
    unlink_slash_commands "$OPENCODE_COMMAND_DIR" "OpenCode cmd  "
    echo ""
    echo "Done. To re-install: ./install.sh"
    ;;

  *)
    echo "Usage: $0 [install|check|remove]"
    exit 1
    ;;
esac
