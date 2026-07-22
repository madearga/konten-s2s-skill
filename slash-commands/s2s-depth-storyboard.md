---
description: "Generate a coherent 3x3 depth-only storyboard from visual and depth references"
argument-hint: "[visual reference] [depth reference]"
---

Execute the **s2s depth-storyboard** capability from the `storyboard-to-seedance-suite` skill.

## Step 1 — Locate the skill directory

Find the installed skill directory (use the first match):

```bash
find ~/.pi ~/.config/opencode ~/.opencode ~/.claude ~/.codex \
  -maxdepth 4 -type d -name storyboard-to-seedance-suite 2>/dev/null | head -1
```

Remember the result as `SKILL`.

## Step 2 — Load and execute the capability

Read `$SKILL/commands/depth-storyboard.md` and follow it exactly. Load `$SKILL/references/depth-storyboard-system-prompt.md` in full and `$SKILL/references/depth-map-user-flow.md`. Resolve relative paths against `$SKILL/`.

## Step 3 — Apply user arguments

User arguments: `$ARGUMENTS`

Require IMAGE 1 (visual reference) and IMAGE 2 (depth reference). Output exactly one coherent 3×3 depth-only storyboard. Never collapse this into the single-image `/s2s depth-map` conversion task.
