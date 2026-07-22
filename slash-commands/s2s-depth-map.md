---
description: "Convert one supplied image into a physically accurate grayscale linear depth map"
argument-hint: "[source image path/URL]"
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

Read `$SKILL/commands/depth-map.md` and follow it exactly. Load `$SKILL/references/depth-map-user-flow.md`, then select `$SKILL/references/depth-map-conversion.md` for a single image or `$SKILL/references/depth-storyboard-conversion.md` for a storyboard/contact sheet. Resolve relative paths against `$SKILL/`.

## Step 3 — Apply user arguments

User arguments: `$ARGUMENTS`

Transform only the supplied source image. Do not invent a nine-shot sequence. Never claim conversion succeeded without a real generated artifact.
