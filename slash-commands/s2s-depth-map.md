---
description: "Convert a normal storyboard into a composition-only depth map storyboard"
argument-hint: "[storyboard path/URL] [optional tone/character/product refs]"
---

Execute the **s2s depth-map** capability from the `storyboard-to-seedance-suite` skill.

## Step 1 — Locate the skill directory

Find the installed skill directory (use the first match):

```bash
find ~/.pi ~/.config/opencode ~/.opencode ~/.claude ~/.codex \
  -maxdepth 4 -type d -name storyboard-to-seedance-suite 2>/dev/null | head -1
```

Remember the result as `SKILL`.

## Step 2 — Load and execute the capability

Read `$SKILL/commands/depth-map.md` and follow it exactly. Load `$SKILL/references/depth-map-storyboard.md` and `$SKILL/references/depth-map-user-flow.md`. Resolve relative paths against `$SKILL/`.

## Step 3 — Apply user arguments

User arguments: `$ARGUMENTS`

Preserve the revised order: normal storyboard first, then conversion. Never claim conversion succeeded without a real generated image artifact.
