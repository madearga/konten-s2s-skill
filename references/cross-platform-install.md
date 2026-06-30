# Cross-Platform Install
This skill works in **Hermes Agent**, **Claude Code**, **OpenCode**, and **Codex CLI** — they all share the same `SKILL.md` standard. One canonical source, symlinked to each platform.

### Install (run once per machine)

```bash
cd /root/.hermes/skills/mlops/ai-video-production/storyboard-to-seedance-suite
./install.sh            # creates symlinks in ~/.claude/skills/, ~/.opencode/skills/, ~/.codex/skills/
```

This creates:

| Platform | Path | Status |
|----------|------|--------|
| Hermes Agent | `~/.hermes/skills/mlops/ai-video-production/storyboard-to-seedance-suite/` | canonical source |
| Claude Code | `~/.claude/skills/storyboard-to-seedance-suite` | symlink |
| OpenCode (home) | `~/.opencode/skills/storyboard-to-seedance-suite` | symlink |
| OpenCode (xdg) | `~/.config/opencode/skills/storyboard-to-seedance-suite` | symlink |
| Codex CLI | `~/.codex/skills/storyboard-to-seedance-suite` | symlink |

### Verify

```bash
./install.sh --check
```

Output: `[OK]` for each platform if linked correctly.

### Remove

```bash
./install.sh --remove   # removes symlinks only, keeps canonical source intact
```

### Why symlinks (not copies)

- **One source of truth** — edit SKILL.md once in Hermes, all platforms see the update
- **No drift** — Claude Code, OpenCode, Hermes all read the same file
- **Idempotent** — `install.sh` is safe to re-run
- **Easy rollback** — `./install.sh --remove` cleans up

### Why this works (format compatibility)

| Field | Hermes | Claude Code | OpenCode | Codex |
|-------|--------|-------------|----------|-------|
| `name` | required | required | required | required |
| `description` | required (auto-trigger) | required | required | required |
| `triggers` | used | ignored | ignored | ignored |
| `version`, `author`, `license` | optional | ignored | ignored | ignored |
| `references/`, `commands/`, `tests/` | loaded | loaded as supporting material | loaded as supporting material | loaded as supporting material |

Hermes-specific `triggers` field is **extra metadata** — Claude Code / OpenCode / Codex ignore it (use `description` for auto-trigger). All other fields are common.

### Slash command differences

| System | Syntax | How to invoke |
|--------|--------|---------------|
| Hermes | `/s2s <capability> [args]` | Slash command parser reads markdown specs under `commands/` |
| Claude Code | `/s2s-<capability> [args]` | One file per slash command, named after file |
| OpenCode | `/s2s-<capability> [args]` | Same as Claude Code |
| Codex CLI | `/s2s-<capability> [args]` | Same as Claude Code |

In Claude Code / OpenCode / Codex, the slash commands aren't auto-registered like Hermes. To invoke, either:
1. Reference the skill by name in natural language: "use the storyboard-to-seedance-suite skill to make a banana bread video"
2. The agent will auto-load it when trigger keywords appear (e.g., "storyboard prompt", "video motion prompt")

For Hermes users, the explicit `/s2s <capability>` slash commands work as documented in `commands/`.
