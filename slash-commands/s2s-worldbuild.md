---
description: "9-aspect world bible from a one-line spark (companion: kuka-worldbuilder skill)"
argument-hint: "[spark]"
---

Execute the **s2s worldbuild** capability from the `storyboard-to-seedance-suite` skill.

## Step 1 — Locate the skill directory

Find the installed skill directory (use the first match):

```bash
find ~/.pi ~/.config/opencode ~/.opencode ~/.claude ~/.codex \
  -maxdepth 4 -type d -name storyboard-to-seedance-suite 2>/dev/null | head -1
```

Remember the result as `SKILL`.

## Step 2 — Load and execute the capability

Read `$SKILL/commands/worldbuild.md` and follow its instructions exactly. Resolve every relative reference it points to (e.g. `references/*.md`, `[ref:...]`) against `$SKILL/`. Consult `$SKILL/SKILL.md` for the capability router / load map if needed.

The capability itself is a thin router: it loads the `kuka-worldbuilder` companion skill (a separate local Hermes skill) and returns its standard 9-aspect output. If the companion skill is not installed locally, the command prints the install hint from `$SKILL/references/companion-worldbuilder.md` instead of failing.

## Step 3 — Apply user arguments

User arguments: `$ARGUMENTS`

Pass them to the capability as its command file describes. Produce the deliverable the capability specifies (9-aspect world bible + hand-off block to /s2s storyboard and /s2s motion).
