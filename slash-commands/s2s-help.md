---
description: "Explain /s2s commands and route users to the right capability"
argument-hint: "[command name or goal]"
---

Execute the **s2s help** capability from the `storyboard-to-seedance-suite` skill.

## Step 1 — Locate the skill directory

Find the installed skill directory (use the first match):

```bash
find ~/.pi ~/.config/opencode ~/.opencode ~/.claude ~/.codex \
  -maxdepth 4 -type d -name storyboard-to-seedance-suite 2>/dev/null | head -1
```

Remember the result as `SKILL`.

## Step 2 — Load and execute the capability

Read `$SKILL/commands/help.md` and follow its instructions exactly. If the user names a command, explain that command only. If the user describes a goal, route them to the smallest matching `/s2s` command.

## Step 3 — Apply user arguments

User arguments: `$ARGUMENTS`
