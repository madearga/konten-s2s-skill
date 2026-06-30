---
description: "Voiceover script for ElevenLabs v3 inline audio tags — input brief or product/duration, output .txt file with lowercase bracketed audio tags ready for ElevenLabs Studio v3 input or /v1/text-to-speech API with model_id=eleven_v3"
argument-hint: "[hook] [product] [duration] [tone] [language] [audio event intent]"
---

# /s2s vo-v3 — Voiceover Script (Eleven v3)

Generates plain-text voiceover scripts with Eleven v3 inline audio tags (`[whispers]`, `[laughs]`, `[sighs]`, `[pause]`, emotions, accents). v3-only — no SSML, no XML wrapper.

## Step 1 — Locate s2s skill

Use the canonical Hermes skill path first:

```text
~/.hermes/skills/mlops/ai-video-production/storyboard-to-seedance-suite
```

If this slash command runs from a symlinked Claude/OpenCode/Codex install, resolve the skill directory that contains this file and use its parent skill root as `SKILL`.

## Step 2 — Load the v3 command spec

Read `$SKILL/commands/vo-v3.md` and follow it exactly. It will reference:

- `$SKILL/references/elevenlabs-vo-v3-tags.md` (full v3 audio tag list, verified from official ElevenLabs blog + help center)
- `$SKILL/assets/vo-script-template-v3.txt` (blank 4-segment plain-text template)

Apply the rules from `vo-v3.md`: use `[lowercase_tags]` only, no XML/SSML, numbers as words, max 3,000 chars, IVC/Voice Design/stock voice (NOT PVC).

## Step 3 — Apply user arguments

User arguments: `$ARGUMENTS`

Parse minimum inputs (hook + product + duration + tone + language + audio event intent). If empty, ask 5 quick questions or use defaults: 15s casual mom Indonesian, light audio events (1-2 emotion tags, no reaction sounds).

Produce a single `.txt` file at `~/Downloads/vo_scripts/<slug>.txt` (honor user-specified path). Validate: no XML/SSML tags, numbers spelled out, lowercase tags only, word count within budget. Then tell the user:

- Recommended voice (Indonesian Female Voice Library ID, or Voice Design prompt)
- Recommended model: `eleven_v3`
- API call shape (POST `/v1/text-to-speech` body with `model_id: "eleven_v3"`)
- Studio UI: paste into v3 text box, ensure model dropdown = "Eleven v3"
