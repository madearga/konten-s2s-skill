---
description: "Product reference image prompt (Step 2b)"
argument-hint: "[args]"
---

Execute the **s2s product-ref** capability from the `storyboard-to-seedance-suite` skill.

## Step 1 — Locate the skill directory

Find the installed skill directory (use the first match):

```bash
find ~/.pi ~/.config/opencode ~/.opencode ~/.claude ~/.codex \
  -maxdepth 4 -type d -name storyboard-to-seedance-suite 2>/dev/null | head -1
```

Remember the result as `SKILL`.

## Step 2 — Load and execute the capability

Read `$SKILL/commands/product-ref.md` and follow its instructions exactly. Resolve every relative reference it points to (e.g. `references/*.md`, `[ref:...]`) against `$SKILL/`. Consult `$SKILL/SKILL.md` for the capability router / load map if needed.

## Step 3 — Apply user arguments

User arguments: `$ARGUMENTS`

Pass them to the capability as its command file describes. Produce the deliverable the capability specifies.
