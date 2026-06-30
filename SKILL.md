---
name: storyboard-to-seedance-suite
description: "Modular AI video production skill library — collection of references, capabilities, and entry points for Seedance 2.0 / Veo 3.1 / Kling 3.0 / GPT Image 2 / ElevenLabs v3. Use when you need any combination of: creative brief intake (vague idea → structured brief), storyboard prompts, character references, product references, cinematic compositions, motion prompts, @-role binding, camera language, troubleshooting, retake triage, video reverse-engineering, hook brainstorming, or pattern-library modes (extend/edit/fuse/beat-sync/dialogue/one-take), or ElevenLabs v3 voiceover scripts. Use `/s2s ads` for product/brand/UGC/e-commerce content (embeds dexhunter's 12-pattern library), `/s2s vo-v3` for ElevenLabs v3 inline audio-tagged VO scripts. Each capability is independently invokable — there is no fixed pipeline. Commands: /s2s interview, /s2s storyboard, /s2s character-ref, /s2s product-ref, /s2s motion, /s2s cinematic-variations, /s2s analyze, /s2s hook, /s2s troubleshoot, /s2s compose-pattern (extend/edit/fuse/beat-sync/dialogue/one-take), /s2s bundle, /s2s vo-v3."
version: 1.12.0
author: Hermes Agent
license: MIT
triggers:
  # Entry points / slash commands
  - "/s2s interview"
  - "/s2s storyboard"
  - "/s2s character-ref"
  - "/s2s product-ref"
  - "/s2s motion"
  - "/s2s cinematic-variations"
  - "/s2s analyze"
  - "/s2s hook"
  - "bikin video AI"
  - "bantuin bikin video"
  - "bikinin video"
  - "bikinin sesuatu"
  - "you decide"
  - "kamu yang tentukan"
  - "bebas"
  - "terserah kamu"
  - "creative brief"
  - "brief intake"
  - "vague idea"
  - "interview video"
  - "wawancara video"
  - "PSA kompetisi"
  - "tugas sekolah video"
  - "/s2s troubleshoot"
  - "/s2s compose-pattern"
  - "/s2s bundle"
  - "/s2s ads"
  - "iklan"
  - "product video"
  - "produk video"
  - "brand content"
  - "e-commerce"
  - "showcase"
  - "promo"
  - "campaign video"
  - "UGC ad"
  - "TikTok shop"
  - "Shopee"
  - "Tokopedia"
  - "elevenlabs v3"
  - "eleven v3"
  - "v3 audio tags"
  - "v3 voice"
  - "v3 pause"
  - "expressive voice v3"
  - "elevenlabs v3 script"
  - "voice acting v3"
  - "v3 inline tags"
  - "bikin script eleven v3"
  - "retake"
  - "reroll"
  - "fix in post"
  - "keep or regenerate"
  - "continuation failed"
  # Capability keywords
  - "storyboard prompt"
  - "12-section storyboard"
  - "seedance prompt"
  - "video motion prompt"
  - "character reference"
  - "product reference"
  - "character sheet"
  - "product sheet"
  - "cinematic composition"
  - "cinematic variations"
  - "10 compositions"
  - "pre-visualization"
  - "film still"
  - "cinematic realism"
  - "image to video pipeline"
  - "storyboard to seedance"
  - "video prompt suite"
  - "analyze video"
  - "reverse engineer video"
  - "video analysis"
  - "extract prompt from video"
  - "analisa video"
  - "bikin prompt dari video"
  - "competitor analysis"
  - "@ reference"
  - "asset binding"
  - "camera language"
  - "troubleshoot video"
  - "video failed"
  - "repair prompt"
  - "compose pattern"
  - "extend video"
  - "video extension"
  - "extend video"
  - "video edit"
  - "edit existing video"
  - "video fusion"
  - "merge videos"
  - "beat sync"
  - "music sync"
  - "dialogue video"
  - "one take"
  - "single take"
  - "hook engaging"
  - "hook yang engaging"
  - "alternatif hook"
  - "hook paling ngena"
  - "hook out of the box"
  - "visual hook"
  - "hook brainstorming"
  - "social issue video"
  - "anti-judi-online hook"
  - "PSA hook"
  - "competition hook"
  - "data-driven hook"
  - "Indonesian statistics hook"
  - "hook viral video"
  - "script to storyboard"
  - "storyboard from script"
  - "generate storyboard from script"
  - "cinematic storyboard from script"
  - "assign composition per panel"
  - "buat storyboard"
  - "bikinin prompt video"
  - "bikin video AI"
  - "AI video pipeline"
  - "Seedance 2.0 prompt"
  - "pregnancy safe"
  - "maternal content"
  - "bumil"
  - "hamil"
  - "in-use shot"
  - "product in use"
  - "product tutorial"
  - "calm UGC"
  - "soft pacing"
  - "settle beat"
  - "breathe beat"
  - "human plus product"
  - "human dan product"
  - "kedua referensi"
  - "competition submission"
  - "lomba AI video"
  - "Kreafest"
  - "public safety video"
  - "Polda Jatim"
  - "AI for public safety"
  - "Indonesian public service"
  - "16 Putaran"
  - "social impact video"
  - "grid fate video"
  - "split fate video"
  - "multi-clip storyboard"
  - "narrative split video"
  - "monochrome storyboard"
  - "12-panel storyboard"
  - "storyboard monochrome 4x3"
---

# storyboard-to-seedance-suite

A **modular reference library and capability router** for AI video production. Provides prompts, references, patterns, and entry points for Seedance 2.0 / Veo 3.1 / Kling 3.0 / GPT Image 2 — designed to be picked up piece-by-piece, not run as a fixed pipeline.

Tuned for **Seedance 2.0** as the canonical video generator; reference structures generalize to Veo 3.1 Lite and Kling 3.0 (see compatibility notes per file).

---

## Library Mental Model

> This is not a 3-step pipeline. It is a **library of capabilities** you invoke based on what the user actually needs.

When the user asks for something, identify which **capability** is required, load the relevant reference(s), and invoke the matching command. Multiple capabilities can chain together by user request — but there is no automatic `Step 1 → Step 2 → Step 3` enforcement.

```text
User intent
  ↓
Capability Router (this file)
  ↓
Load references / invoke commands
  ↓
Output: copy-paste-ready prompts, references, or analysis
```

---

## Capability Router

| User Intent                                       | Capability        | Command                  | Required References                                    |
|---------------------------------------------------|-------------------|--------------------------|--------------------------------------------------------|
| Have a vague idea, need a structured brief       | Interview         | `/s2s interview`         | `creative-brief-intake.md`                                |
| Have a brief, want storyboard image               | Storyboard        | `/s2s storyboard`        | `storyboard-prompt-template.md` + `cinematic-composition-vocabulary.md` |
| Want 10 composition options for one key moment    | Pre-visualization | `/s2s cinematic-variations` | `cinematic-composition-vocabulary.md` + `cinematic-variations-script-mode.md` |
| Need human character reference image              | Character Ref     | `/s2s character-ref`     | `character-ref-prompt.md`                              |
| Need product reference image                      | Product Ref       | `/s2s product-ref`       | `product-ref-prompt.md`                                |
| Have storyboard + ref, need motion prompt         | Motion            | `/s2s motion`            | `seedance-motion-prompt.md` + `seedance-camera-language.md` + `seedance-motion-vocabulary.md` |
| Have multiple assets, need role binding           | Motion (binding)  | `/s2s motion --bind`     | `seedance-reference-syntax.md` + `seedance-asset-binding.md` |
| Want to extend / edit / fuse / beat-sync / dialogue / one-take | Pattern | `/s2s compose-pattern`   | `seedance-pattern-library.md`                          |
| Have video file, want to reverse-engineer         | Analyze           | `/s2s analyze`           | `video-analysis-template.md` + `tiktok-analyzer-system-prompt.md` |
| Want hook variants for short-form                 | Hook              | `/s2s hook`              | `hook-brainstorming-social-issue.md`                   |
| Want product/brand/UGC ad prompt                  | Ads               | `/s2s ads`               | `dexhunter-patterns-ads.md` + `seedance-reference-syntax.md` |
| Want VO script for ElevenLabs v3 (inline audio tags) | VO v3            | `/s2s vo-v3`             | `elevenlabs-vo-v3-tags.md`                                |
| Generated video wrong, need repair / retake triage | Troubleshoot      | `/s2s troubleshoot`      | `seedance-retake-protocol.md` + `seedance-model-mechanics.md` + `seedance-failure-atlas.md` + `seedance-troubleshooting.md` |
| Want all artifacts bundled into one file          | Bundle            | `/s2s bundle`            | (assembles from prior outputs)                         |
| Have a vague idea (no full brief yet)            | Interview         | `/s2s interview`           | `references/creative-brief-intake.md`                   |

---

## Routing Questions

When intent is ambiguous, ask the user the **minimum disambiguating questions**:

| Question                                            | Branches                                                       |
|-----------------------------------------------------|----------------------------------------------------------------|
| Do you have a video to analyze, or a brief for new? | `analyze` (have video) ↔ `storyboard` / `motion` (have brief)  |
| Is there a human in the video?                      | Yes → `character-ref` first; No → skip                          |
| Is there a product?                                 | Yes → `product-ref` first; No → skip                            |
| Is the video > 30s or multi-beat narrative?         | Yes → multi-clip mode (see `references/competition-deliverable-blueprint.md`) |
| Do you already have a storyboard image?             | Yes → skip `storyboard`, go to `motion`                         |
| Are you extending/editing existing video?           | Yes → `compose-pattern` (extend/edit/fuse)                     |
| Did the previous output fail or look wrong?         | Yes → `troubleshoot` first, then retake                        |

---

## Reference Library

All references live in `references/`. Pick the ones you need; ignore the rest.

### Intake Reference

| File                          | Use                                                       |
|-------------------------------|-----------------------------------------------------------|
| `creative-brief-intake.md`    | Vague idea → structured brief (5 core fields + 7 extended + Indonesian defaults) |

### Prompt Templates

| File                                              | Use                                                   |
|---------------------------------------------------|-------------------------------------------------------|
| `storyboard-prompt-template.md`                   | 12-section fill-in template for storyboard image prompt |
| `character-ref-prompt.md`                         | 3-angle character sheet template                       |
| `product-ref-prompt.md`                           | 5 variants: hero / multi-angle / lifestyle / in-use / sheet |
| `seedance-motion-prompt.md`                       | 5-part spine for motion prompt                         |
| `video-analysis-template.md`                      | 10-section fill-in template for `/s2s analyze`         |

### Seedance Craft References (v1.7.0 — adopted from Emily2040 + dexhunter)

| File                                              | Use                                                   |
|---------------------------------------------------|-------------------------------------------------------|
| `seedance-reference-syntax.md`                    | `@`-role binding system (which attachment does what)  |
| `seedance-camera-language.md`                     | Camera moves, shot sizes, advanced techniques, lens vocabulary |
| `seedance-motion-vocabulary.md`                   | Action verbs, body parts, object interaction, rhythm/beat vocab, anti-slop lexicon |
| `seedance-troubleshooting.md`                     | Failure-mode taxonomy (10 categories) + repair patterns |
| `seedance-retake-protocol.md`                      | Keep / fix in post / edit / reroll / rewrite triage + one-variable retake rule |
| `seedance-model-mechanics.md`                      | 8-mechanism diagnosis model: attention, negation, trajectory, reference overlap, etc. |
| `seedance-failure-atlas.md`                        | Sequence and continuation failure table with primary repair variable |

### Ad Patterns

| File                            | Use                                                       |
|---------------------------------|-----------------------------------------------------------|
| `dexhunter-patterns-ads.md`     | 12-pattern library from dexhunter annotated for ads (Product Showcase default, Beat-Sync, FX Replication, Multi-Cut Assembly) |

### Voiceover / ElevenLabs v3 References (v1.11.0 — added for `/s2s vo-v3`)

| File                                              | Use                                                   |
|---------------------------------------------------|-------------------------------------------------------|
| `elevenlabs-vo-v3-tags.md`                        | Full Eleven v3 audio tag reference (verified against `elevenlabs.io/blog/v3-audiotags` + 4 official blog posts June 2026) + v2 SSML→v3 migration table |

### Composition & Style References

| File                                              | Use                                                   |
|---------------------------------------------------|-------------------------------------------------------|
| `cinematic-composition-vocabulary.md`             | 19 cinematic styles + texture pack + script-to-storyboard table |
| `cinematic-variations-script-mode.md`             | Script-mode variant of cinematic-variations + character-consistency ordering |
| `storyboard-style-monochrome-4x3.md`              | Monochrome graphite+amber 4×3 12-panel DNA (validated for "16 Putaran") |
| `director-strip-7-track.md`                       | RHYTHM + ESCALATION vocabulary (7 tracks)            |
| `koda-ivanna-patterns-2026-06.md`                 | 4 patterns reverse-engineered from Koda + Ivanna prompts |
| `seedance-no-character-ref-pov-workflow.md`       | No-character-reference POV workflow + cyberbullying safety |
| `cinematic-composition-vocabulary.md`             | (also listed above — style anchor for cinematic)      |

### Continuity & Pattern References

| File                                              | Use                                                   |
|---------------------------------------------------|-------------------------------------------------------|
| `seedance-asset-binding.md`                       | Legacy `@`-style role binding (still supported)        |
| `seedance-pattern-library.md`                     | 6 patterns: extend / edit / fuse / beat-sync / dialogue / one-take |
| `notion-prompt-alignment.md`                      | Canonical storyboard vs motion prompt hygiene in Notion |
| `competition-deliverable-blueprint.md`            | Full Kreafest 2026 "16 Putaran" case study + v2 patches |
| `hook-brainstorming-social-issue.md`              | Hook brainstorming for social-issue / competition videos |

### Validation / Worked Examples

| File                                              | Use                                                   |
|---------------------------------------------------|-------------------------------------------------------|
| `banana-bread-worked-example.md`                  | Anonymized real-world case study                       |
| `storyboard-motion-prompt-review-notes.md`        | Review checklist + realism-lock phrases                |
| `seedance-2-best-practices-2026.md`               | Broader Seedance research (June 2026)                  |
| `seedance-best-practices.md`                      | General Seedance best practices                        |
| `tiktok-analyzer-system-prompt.md`                | Reverse-engineering competitor videos                  |
| `git-sync-state-and-ecosystem-2026-06-15.md`      | Ecosystem snapshot                                     |

---

## Commands

Each command in `commands/` is a **single capability spec** — invocable independently, not chained by default.

| Command                       | Capability        | Spec File                  |
|-------------------------------|-------------------|----------------------------|
| `/s2s interview`              | Interview (intake)| `commands/interview.md`    |
| `/s2s storyboard`             | Storyboard        | `commands/storyboard.md`   |
| `/s2s character-ref`          | Character Ref     | `commands/character-ref.md` |
| `/s2s product-ref`            | Product Ref       | `commands/product-ref.md`  |
| `/s2s cinematic-variations`   | Pre-visualization | `commands/cinematic-variations.md` |
| `/s2s motion`                 | Motion            | `commands/motion.md`       |
| `/s2s compose-pattern`        | Pattern (extend/edit/fuse/beat-sync/dialogue/one-take) | `commands/motion.md` (pattern mode) |
| `/s2s analyze`                | Analyze           | `commands/analyze.md`      |
| `/s2s hook`                   | Hook              | `commands/cinematic-variations.md` (hook mode) — or prompt user to use hook ref |
| `/s2s troubleshoot`           | Troubleshoot      | `commands/troubleshoot.md` + retake/model/failure refs |
| `/s2s bundle`                 | Bundle            | (composes from prior outputs into single markdown file) |
| `/s2s ads`                    | Ads               | `commands/ads.md`             |
| `/s2s vo-v3`                  | VO v3             | `commands/vo-v3.md`            |

**Backward compat:**
- `/s2s pipeline` still works as alias for "storyboard + character-ref + motion in sequence, with checkpoints" (see `commands/pipeline.md`). It is NOT default behavior — only invoke if user explicitly requests the chained pipeline.
- `/s2s analyze --seedance` still feeds into `/s2s motion`.

---

## When to Use What — Decision Flowchart

```text
User Request
  │
  ├─ "bikin video AI" / "bikinin sesuatu" / "kamu yang tentukan" / vague idea
  │    → /s2s interview (creative brief intake first)
  │
  ├─ "analyze this video / reverse engineer / extract prompt"
  │    → /s2s analyze [path]
  │
  ├─ "make me a [brief]"
  │    │
  │    ├─ Has human? → /s2s character-ref
  │    ├─ Has product? → /s2s product-ref
  │    │
  │    ├─ Want storyboard image first?
  │    │   ├─ One moment, 10 options → /s2s cinematic-variations
  │    │   ├─ Full scene, 12 panels → /s2s storyboard
  │    │   └─ From existing script → /s2s storyboard --script-mode
  │    │
  │    ├─ Want motion prompt only (have refs)?
  │    │   ├─ New clip → /s2s motion
  │    │   ├─ Extend/edit/fuse → /s2s compose-pattern [extend|edit|fuse]
  │    │   ├─ Beat-sync / music video → /s2s compose-pattern beat-sync
  │    │   ├─ Dialogue / voice-over → /s2s compose-pattern dialogue
  │    │   └─ One-take / continuous → /s2s compose-pattern one-take
  │    │
  │    ├─ Want hook brainstormed first?
  │    │    → /s2s hook (or load hook-brainstorming-social-issue.md)
  │    │
  │    └─ Don't know → ask 1-3 routing questions, then route
  │
  ├─ "output was wrong / doesn't look right"
  │    → /s2s troubleshoot
  │       1. Triage: keep / fix in post / edit / reroll / rewrite
  │       2. Diagnose mechanism + failure mode
  │       3. Retake with ONE-variable change + shot log
  │
  ├─ "bundle everything into one file"
  │    → /s2s bundle (assembles from most recent outputs)
  │
  └─ "just run the whole pipeline for me"
       → /s2s pipeline (legacy chained mode — explicit user request only)
```

---

## Multi-Clip & Competition Patterns

For videos > 30s, multi-beat narratives, or competition submissions, see:

- `references/competition-deliverable-blueprint.md` — Kreafest 2026 "16 Putaran" case study (7×15s, 16-fate grid, Indonesian context, $5 budget, 1:45 duration)
- SKILL.md sections below: "Multi-Clip Storyboards", "Style Lock: Monochrome Sepia/Amber", "Script-to-Storyboard Workflow"

Validated structure: **7×15s = 1:45**

| Clip | Detik | Role     | Beat                          |
|------|-------|----------|-------------------------------|
| 1    | 0:00-0:15 | Hook  | Repetitive gesture, world state |
| 2-5  | 0:15-1:15 | Buildup | 4 fates per clip, 16 total  |
| 6    | 1:15-1:30 | Climax | Chaos / glitch / freeze        |
| 7    | 1:30-1:45 | Resolution | End card, text only, silence |

**Key multi-clip rules** (full list in `references/competition-deliverable-blueprint.md`):
1. Same `@[character ref]` in every clip's motion prompt (prevents face drift)
2. Spatial Continuity Lock MUST carry across clips (same room, geography, screen direction)
3. Director strip RHYTHM TRACK escalates monotonically (`hold` → `pause` → `build` → `burst` → `pause` → `rest`)
4. Audio bed is a SINGLE layer in post (generate each clip with diegetic foley only)
5. End card (final clip) gets typography exception (only place text on screen is permitted)
6. For 4x4 grid scenes: lock "upper-center, fixed position" + add anti-contact-sheet negatives
7. Cost scales linearly: 7 clips × $0.50-0.75 motion + $0.14 storyboards + $0.02 char ref ≈ $3.66-5.41

---

## Style Lock: Monochrome Sepia/Amber (Validated 2026-06-14, "16 Putaran" Rizky)

> Full style DNA, cell narrative map, and validated pitfalls: see `references/storyboard-style-monochrome-4x3.md`

When the project uses a **monochrome graphite + amber/sepia** look (NOT photorealistic, NOT 3D stylized), apply these style anchors to every storyboard prompt:

**Visual anchors (per panel):**
- Monochrome hand-drawn graphite-and-sepia, cross-hatched pencil, wobbly organic strokes
- No hard outlines, paper grain texture overlay throughout
- Dark bedroom as consistent anchor: rumpled single bed, vintage metal standing fan (left), small nightstand with glowing tungsten desk lamp (right), water bottle and a phone, bare scuffed walls cross-hatched charcoal
- Subject: young Indonesian man with messy dark hair, plain wrinkled t-shirt, plain/aged features
- **Supernatural 4x4 floating grid of 16 small rectangular cards** hovers in the air as the primary light source
- Cards glow amber-gold sequentially; unlit cards stay dim grey
- ONLY the numeral (1-16) appears on each lit card — NO Indonesian text labels, NO captions, NO scene descriptions inside cells (visual iconography only)

**Carry-over logic across clips (multi-storyboard):**
- Clip 1: cells 1-3 light (Masa Kecil, Ayah, Ibu)
- Clip 2: cells 4-8 light (Sekolah, Sahabat, Cinta Pertama, Kuliah, Mimpi) — cells 1-3 stay lit
- Clip 3: cells 9-12 light (Kerja, Gagal, Hutang, Sakit) — cells 1-8 stay lit, tone shifts cooler/clinical
- Clip 4: cells 13-16 light (Rambut, Mata, Jari, Penjara) — cells 1-12 stay lit, tone colder/redder (climax)
- Clip 5: all 16 lit in unison — unified amber-gold, frozen tableau, quiet acceptance

**Aspect:** 1536x1024 landscape (16:9), 4 rows × 3 columns of equal panels with thin gutters on charcoal background.

**Reference style anchor:** See `references/storyboard-style-monochrome-4x3.md` for the validated reference image and full style DNA.

**Pitfall (validated 2026-06-14):** User rejected photorealistic triptych / 4-panel output in favor of monochrome 4x3 grid. If brief says "monochrome", "sepia", "amber", "hand-drawn", "sketched", or references a grayscale/monochrome anchor image, **do NOT generate photorealistic triptych**. Use the 4x3 12-panel grid pattern from this section.

---

## Script-to-Storyboard Workflow (v1.6.2)

When a user arrives with a **full creative script** (multi-clip, panel-level detail, locked narrative) and wants to generate storyboard images with cinematic compositions assigned per panel — use this manual path:

```
Full Script (N clips × M panels)
   ↓
For each clip:
  1. Read script → identify panels P01-PM
  2. For each panel: assign composition from 19-vocab library
     (see references/cinematic-composition-vocabulary.md)
     - Hook panels → handheld close, foreground obstruction, POV
     - Establishing panels → environmental scale, wide negative space
     - Emotional panels → reflection, silhouette, frame-in-frame
     - Impact panels → extreme low angle, diagonal, compressed telephoto
  3. Write 12-section storyboard prompt with composition locked in PANEL HEADERS
  4. Feed to image_generate / GPT Image 2
   ↓
Continue to motion prompt construction (/s2s motion)
```

**Key distinction from `/s2s cinematic-variations`:**
- `cinematic-variations` = explores 10 composition OPTIONS for a SINGLE key moment (pre-storyboard, user picks winner)
- Script-to-storyboard = assigns ONE composition per panel ACROSS all panels (no exploration, locked from script intent)

**When to use this path:**
- User has a complete script with per-panel descriptions
- User says "generate storyboard from this script"
- User wants cinematic compositions baked into the storyboard from the start
- Competition submissions where every panel's composition matters

**Composition assignment heuristic (from script → panel):**

| Script beat type        | Composition assignment                              |
|-------------------------|------------------------------------------------------|
| Hook / first frame      | Handheld close OR POV (immersion)                    |
| Establishing / master   | Environmental scale OR wide negative space           |
| Character emotional     | Reflection OR silhouette OR frame-in-frame           |
| Action / impact         | Extreme low angle OR diagonal                        |
| Dialogue / two-person   | OTS OR foreground obstruction                        |
| Reveal / hero moment    | Symmetrical blocking OR compressed telephoto         |
| Isolation / loneliness  | Wide negative space OR deep vanishing point          |
| Tactile / close detail  | POV OR handheld close                                |
| Climax / peak           | Diagonal OR compressed telephoto                     |
| Resolution / settle     | Asymmetrical balance OR layered FG/MG/BG             |

---

## Sensitive Content Safety Guardrails (2026-06-16)

For motion prompts involving self-harm, suicide, cyberbullying, or graphic violence, prepend this 6-point production standard to BOTH the storyboard image prompt AND the motion prompt:

1. **Hand/limbs only** — show hands, feet, or partial body. NO full face, full body, or full posture in any frame. Cut to black before the act.
2. **NO method shown** — no ligatures, weapons, pills, ropes, gas, drowning. "Implied" framing only.
3. **NO graphic violence** — no blood, no open wounds, no injury detail. Healed scars only (for backstory).
4. **Show environmental impact** — clock stopped at the hour, family photo on wall, phone still glowing, door open. The world froze, the room remained.
5. **Setting stays INTACT** — bedroom/room/kitchen/office is preserved. Implied not staged. No "scene of the act" framing.
6. **Help line CTA in end card** — for Indonesian context: **119 ext 8** (Into The Light) / **@janganbunuhdiri** / **Yayasan Pulih**.

**Language pattern for the prompt (use verbatim):**
> "CRITICAL: Hand only. DO NOT show face, body, full posture, or method of [harm type]. DO NOT show victim in frame beyond hand/partial body. [Environment] intact, [symbol] stopped, [symbol] on wall. Bedroom preserved. Implied framing only."

This pattern was developed and tested on the Layar Terakhir (anti-cyberbullying) project — 7 motion prompts + 7 storyboards, all passed downstream review for an Indonesian public-service film brief.

---

## Codex Backend Quota Pitfall (2026-06-16)

`gpt-image-2-medium` (Codex native backend) is subject to **soft hourly quota** on ChatGPT Plus/Pro plans. Symptom: 1 image generates OK, then 2+ subsequent calls in same hour return `Codex response contained no image_generation_call result` (NOT a 429 — the model loads but doesn't trigger tool_use).

**Recovery (in order):**
1. Wait 30-60 minutes for hourly window reset
2. Switch to Pixazo Flux Schnell via `pixazo-gen` skill (free, 3-4s, no quota)
3. Switch to Pixazo GPT Image 2 (pay-per-use, style-consistent)
4. Skip image gen — write ASCII storyboard table for visual reference

**Do NOT** retry in a tight loop (will keep failing). **Do NOT** assume hard failure. Apply to character ref, storyboard, and product reference steps equally.

---

## A/B Hook Variant Pattern (2026-06-16)

For 9:16 vertical narrative shorts where the first 3 seconds drive retention, generate 3 frozen-first-3-seconds storyboard images (one per hook strategy) before committing to motion generation. Compare 0-1s drop rate, pick default + fallback. See `references/hook-brainstorming-social-issue.md` + `/s2s hook` command.

---

## Image Backend for Storyboard Panels (Jun 2026 update)

For the **storyboard.png** step (any storyboard command) the `image_generate` native tool is now the preferred path when ChatGPT plan is active:

```python
# Inside any storyboard command, replace manual Pixazo call with:
image_generate(
    prompt=twelve_section_storyboard_prompt,
    aspect_ratio="landscape"  # or square/portrait; backend auto-translates per model
)
```

- Backend selection is via `image_gen.provider` in `~/.hermes/config.yaml` — default to `openai-codex` for highest quality. Fall back to `fal-ai/flux-2/klein/9b` (cheaper, faster) for iteration.
- Output auto-saves to `$HERMES_HOME/cache/images/openai_codex_gpt-image-2-medium_*.png` — easier to track than Pixazo's R2 URLs which expire.
- Aspect ratio auto-mapped by backend (e.g., `landscape` → `1536x1024` for GPT-Image-2, `landscape_16_9` for Flux). For multi-clip storyboards (16-fate grid), use `square` (1024×1024) to keep the 4x4 grid legible.
- See `image-gen` skill "Image Backend Decision Matrix" for full backend comparison (Pollinations 403/402 failures → Pixazo fallback → Hermes native plugin default).
- **Cost note**: Pixazo gpt-image-2-text-to-image = $0.067/image; Hermes Codex plugin = free with ChatGPT plan. For a 7-clip storyboard (7 panels), savings = ~$0.47.
- **Consistency tip**: When generating 5-7 storyboard panels for one brief, keep the same `image_gen.model` and prepend a fixed style prefix to all 7 prompts (e.g., "16:9 monochrome storyboard grid, identical ink line weight, ..."). Models vary less within one session than across sessions.

---

## Pitfalls (Top 12 — accumulated through 2026-06-15)

These are real failure modes validated across sessions. Apply prophylactically when relevant.

### Top 6 Mistakes to Avoid

**1. Treating storyboard image as the signal** — the image is documentation. The text in the motion prompt (director strip + panel beats) is the contract. Always include the text, not just the image attachment.

**1a. Triptych/3-panel default for multi-clip storyboards** — Agent default is to generate a "3 panels = 3 scenes" image per clip. WRONG. For a multi-clip narrative with shared character + setting, each storyboard is a 12-panel *sequence* (4×3 grid, P01-P12) of the SAME scene with progressive beats. 1 clip = 1 storyboard = 12 panels of one room + close-ups. See `references/storyboard-style-monochrome-4x3.md` for the validated monochrome 4×3 12-panel style used in 5-clip "16 Putaran" project.

**1b. Don't loop director profile for batch image generation** — Director profile is for prompt CRAFTING (1 call per prompt). After prompt is crafted, generate directly via `image_generate` tool. Director profile adds 2-3 min per call vs ~30s direct, and times out at 5min on long prompts. For multi-clip batches (5-7 storyboards), the workflow is: write prompt once → `image_generate` × N.

**1c. Motion prompt must follow the generated storyboard, not the older draft** — if Notion contains an earlier prompt draft and a later generated storyboard establishes the canonical hook/composition, treat the generated storyboard as the source of truth. Rebuild the Seedance motion prompt from that actual panel order before generating video.

**1d. Notion prompt hygiene — keep only one current storyboard prompt and one current motion prompt** — when a review loop produces a better canonical version, delete or archive the stale blocks in Notion before appending the new one. Otherwise the page drifts and future agents will copy the wrong draft.

**1e. Hook-first storyboards need a dedicated hook-brainstorming pass** — don't jump straight to a 12-panel storyboard when the user hasn't locked the opening. Use `references/hook-brainstorming-social-issue.md` to generate tiers of hooks, evaluate against the 6 criteria (Clarity in 3s, Visual AI-ability, Relevance, Emotional hit, Uniqueness, Continuity), and lock a tagline + 3-frame visual before expanding to 12 panels. This prevents the common failure mode of a weak first 3 seconds that the rest of the clip cannot fix.

**2. Skipping reference image generation** — without `@[character ref]` or `@[product ref]`, Seedance hallucinates faces/environments. Always generate the ref.

**3. One-axis emotion ("make it playful")** — collapses to flat mood. Always split into Valence + Arousal in the motion prompt.

**4. Music baked into generation** — locks pacing, makes re-edits hard. Default to silent + diegetic foley. Add music in post (CapCut, DaVinci).

**5. Forgetting screen direction in location** — without explicit screen direction (window left, oven right), Seedance flips geometry between shots. Always include screen direction in LOCATION.

**6. Text inside grid cells** — Seedance + Pixazo hallucinate text (random letters, Arabic-looking glyphs, misspellings). Never put text labels in any AI-generated frame except the closing line / hashtag in the end card. Use visual iconography + Indonesian context words instead. See `references/competition-deliverable-blueprint.md` § "NO TEXT IN GRID CELLS" for the validated translation table.

### Second-Tier (6-12)

**7. Attachment ambiguity** — if multiple files are attached but roles are unspecified, camera/style/action signals bleed into each other. Bind each attachment to a single job. See `references/seedance-reference-syntax.md` + `references/seedance-asset-binding.md`.

**8. Using the wrong mode for existing-video tasks** — extend/edit/fuse requests should keep the same 5-part spine, but switch Step 3 language to the correct mode. See `references/seedance-pattern-library.md` + `/s2s compose-pattern`.

**9. Two-layer style system confusion** — storyboard image style (Layer 1, monochrome planning doc) ≠ motion/video output style (Layer 2, cinematic photorealistic). User says "cinematic" → Layer 2.

**10. Writing motion prompts without generating storyboard + refs first** — skipping Steps 1-2 = hallucination risk (face drift, environment drift, geography flip). Even if drafting motion prompt for approval, mark as DRAFT and regenerate final after Steps 1-2.

**11. Generating cinematic-variations WITHOUT character ref first** — multi-image sweep with human = every image has different face. Correct order: `character-ref → cinematic-variations → storyboard → motion`. See pitfall #1 ordering.

**12. Motion prompt clip count ≠ script clip count** — always verify every script clip has corresponding motion prompt clip before finalizing. Add to QC: count clips, verify match, identify missing (often climax + aftermath).

---

## Cost & Time Reference

| Capability                  | Typical Cost (USD) | Wall Time       | Backend                    |
|-----------------------------|--------------------|-----------------|----------------------------|
| Storyboard image (1)        | $0.02-0.067        | 30s-3min        | Codex / Pixazo GPT Image 2 / Pixazo Flux Schnell |
| Character ref (1)           | $0.02-0.067        | 30s-3min        | Same                       |
| Product ref (1)             | $0.02-0.10         | 30s-3min        | Same                       |
| Cinematic variations (10)   | $0.20-0.67         | 5-10min         | Same                       |
| Motion prompt (1, 8-15s)    | $0.50-0.75         | 5-15min         | Seedance 2.0 / Veo 3.1 / Kling 3.0 |
| Reverse analysis (1 video)  | $0.05-0.10 (LLM)   | 2-5min          | Local LLM                  |
| Full multi-clip (7 clips)   | $3.66-5.41         | 2-3 hours       | All combined               |

**Bundle cost** = sum of capabilities invoked. NOT a fixed pipeline cost.

---

## Sensitive Content Quick Reference

For Indonesian PSA / cyberbullying / sensitive topics, use the **6-point Sensitive Content Safety Guardrails** (full text above). Quick template:

```text
CRITICAL: Hand only. DO NOT show face, body, full posture, or method of [harm type].
DO NOT show victim in frame beyond hand/partial body. [Environment] intact,
[symbol] stopped, [symbol] on wall. Bedroom preserved. Implied framing only.
End card: 119 ext 8 (Into The Light) / @janganbunuhdiri / Yayasan Pulih.
```

For full POV / hands-only workflow without character ref, see `references/seedance-no-character-ref-pov-workflow.md`.

---

## Cross-Platform Install

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

---

## Related References

In the parent `ai-video-production` skill:

- `SKILL.md` section 2.7 (First+Last Frame) — simpler alternative for <8s clips
- `SKILL.md` section 2.9 (Metamorphosis 4-step) — alternative storyboard method
- `references/seedance-2-best-practices-2026.md` — broader Seedance context
- `references/seedance-best-practices.md` — general Seedance best practices
- `references/tiktok-analyzer-system-prompt.md` — for reverse-engineering competitor videos
- `references/seedance-no-character-ref-pov-workflow.md` — no-character-reference POV workflow for Seedance/Dreamina when human reference is disabled; includes cyberbullying PSA structure, safety guardrails, and Arga review cadence.

In this skill:

- `references/dexhunter-patterns-ads.md` — **12-pattern library from dexhunter for ads** (Product Showcase / Beat-Sync / FX Replication / Multi-Cut Assembly)
- `references/creative-brief-intake.md` — **vague idea → structured brief** (5 core fields + 7 extended, 3 intake modes, Indonesian defaults)
- `references/seedance-voice-consistency.md` — **`@audio1/2/3` voice reference for multi-clip series** (4 patterns, validated from James Sismanes Brooklyn gelato workflow)
- `references/seedance-reference-syntax.md` — **`@` reference system + role binding** (canonical)
- `references/seedance-camera-language.md` — **camera moves, shot sizes, advanced techniques**
- `references/seedance-motion-vocabulary.md` — **action verbs, body parts, object interaction, rhythm, anti-slop lexicon**
- `references/seedance-troubleshooting.md` — **failure-mode taxonomy + repair patterns**
- `references/seedance-retake-protocol.md` — **keep/fix/edit/reroll/rewrite triage + one-variable retake rule**
- `references/seedance-model-mechanics.md` — **8-mechanism diagnosis model for root-cause prompt repair**
- `references/seedance-failure-atlas.md` — **sequence/continuation failure table with primary repair variable**
- `references/storyboard-style-monochrome-4x3.md` — monochrome graphite + amber/sepia 4×3 12-panel storyboard style used for the "16 Putaran" project. Single source of truth for the monochrome style.
- `references/notion-prompt-alignment.md` — checklist for keeping one current storyboard prompt and one current motion prompt on the page; delete stale drafts after review.
- `references/koda-ivanna-patterns-2026-06.md` — 4 high-value patterns (Director Strip augmented, Spatial Continuity Lock, HARD CUT marker, NEGATIVE PROMPT block) reverse-engineered from published Koda `@aimikoda` + Ivanna `@ivanka_humeniuk` prompts.
- `references/competition-deliverable-blueprint.md` — full Kreafest 2026 "16 Putaran" case study (7×15s, 16-fate grid, Indonesian context, $5 budget) PLUS v2 patches.
- `references/hook-brainstorming-social-issue.md` — hook generation workflow for social-issue / competition AI videos.
- `references/cinematic-variations-script-mode.md` — script-mode variant of `/s2s cinematic-variations` + character-consistency ordering rule.

---

## Version History

- **1.12.0** (2026-06-30) — **/s2s troubleshoot retake triage + model-mechanics diagnosis**
  - **NEW**: `references/seedance-retake-protocol.md` — adopted from `Emily2040/seedance-2.0` (`retake-protocol.md`, MIT, commit `7659cbd`). Adds five verdicts: Keep / Fix in post / Edit / Re-roll / Rewrite, one-variable rule, attempt budget, shot log, and sequence canon.
  - **NEW**: `references/seedance-model-mechanics.md` — adopted from `Emily2040/seedance-2.0` (`model-mechanics.md`, MIT, commit `7659cbd`). Adds eight practical mechanisms: attention budget, familiar prior, negation, trajectory, compounding, reference overlap, detail capacity, joint audio-video.
  - **NEW**: `references/seedance-failure-atlas.md` — adopted from `Emily2040/seedance-2.0` (`failure-atlas.md`, MIT, commit `7659cbd`). Adds sequence/continuation-specific repair table.
  - **UPDATED**: `commands/troubleshoot.md` now triages before regenerating, maps symptom → mechanism → one-variable repair, and outputs a shot log + stop condition.
  - **UPDATED**: Capability Router points `/s2s troubleshoot` at all four troubleshoot references.
  - **UPDATED**: Triggers expanded +5: `retake`, `reroll`, `fix in post`, `keep or regenerate`, `continuation failed`.
  - **GOAL**: stop wasteful blind regenerations. Diagnose first, change one variable, and know when to keep, post-fix, edit, reroll, rewrite, or stop.

- **1.11.0** (2026-06-30) — **/s2s vo-v3 command + ElevenLabs v3 inline audio-tagged VO**
  - **NEW**: `commands/vo-v3.md` — `/s2s vo-v3` capability (Eleven v3 plain-text VO scripts with inline `[lowercase_tags]`, ready to paste into ElevenLabs Studio v3 input or POST to `/v1/text-to-speech` with `model_id: "eleven_v3"`)
  - **NEW**: `references/elevenlabs-vo-v3-tags.md` — verified v3 audio tag list (emotions, delivery, reactions, pacing/cognitive) + v2 SSML→v3 migration table. Verified against official sources: `elevenlabs.io/blog/v3-audiotags`, `blog/eleven-v3-audio-tags-expressing-emotional-context-in-ai-speech`, `blog/eleven-v3-audio-tags-precision-delivery-control-for-ai-speech`, `blog/eleven-v3`, `help.elevenlabs.io/hc/en-us/articles/35869142561297`
  - **NEW**: `assets/vo-script-template-v3.txt` — blank plain-text template (4-segment UGC arc pre-tagged)
  - **NEW**: `slash-commands/s2s-vo-v3.md` — `/s2s vo-v3` slash command entry
  - **UPDATED**: Capability Router adds "VO v3" row after Ads
  - **UPDATED**: Reference Library adds "Voiceover / ElevenLabs v3 References" subsection
  - **UPDATED**: Commands table adds `/s2s vo-v3` entry
  - **UPDATED**: Triggers expanded +10 keywords: `elevenlabs v3`, `eleven v3`, `v3 audio tags`, `v3 voice`, `v3 pause`, `expressive voice v3`, `elevenlabs v3 script`, `voice acting v3`, `v3 inline tags`, `bikin script eleven v3`
  - **UPDATED**: SKILL frontmatter description adds ElevenLabs v3 to backend list + `/s2s vo-v3` to commands list
  - **GOAL**: complete the audio side of the production loop. `/s2s motion` covers video; `/s2s ads` covers ad motion; `/s2s vo-v3` covers Eleven v3 voiceover. Pairs with `/s2s bundle` to ship complete ad package.
  - **WHY v3-only**: PVC optimization pending, IVC/Voice Design preferred per official blog. v3 is the most expressive model — `[whispers]`, `[laughs]`, `[sighs]`, `[pause]`, `[emphasized]`, `[short pause]`, `[long pause]` etc. enable voice-acting quality that v2 SSML cannot reach. Tested with sub-agent worker against 3 tone variants (casual mom / hype UGC / calm expert) — all valid, all pass QC, ~40 spoken words per 15s script.

- **1.10.0** (2026-06-18) — **/s2s ads command + dexhunter-patterns-ads.md reference**
  - **NEW**: `commands/ads.md` — `/s2s ads` capability (product/brand/UGC/e-commerce motion prompts, embeds dexhunter's 12-pattern library)
  - **NEW**: `references/dexhunter-patterns-ads.md` — full 12-pattern spec annotated for ads (Pattern 9 E-commerce default, Pattern 3 FX Replication, Pattern 6 Beat-Sync, Pattern 12 Multi-Cut Assembly)
  - **UPDATED**: Capability Router adds "Ads" row
  - **UPDATED**: Reference Library adds "Ad Patterns" subsection
  - **UPDATED**: Commands table adds `/s2s ads` entry
  - **UPDATED**: Triggers expanded +13 keywords: `iklan`, `product video`, `produk video`, `brand content`, `e-commerce`, `showcase`, `promo`, `campaign video`, `UGC ad`, `TikTok shop`, `Shopee`, `Tokopedia`
  - **GOAL**: when user asks for product/brand/e-commerce ad, agent auto-loads dexhunter's quick-prompt patterns instead of generic motion template. Default to Pattern 9 (Product Showcase), escalate to Pattern 6/3/12 when user wants dynamic style.

- **1.9.0** (2026-06-18) — **Voice consistency + 2-3s beat grid + Seam-lock extend pattern**
  - **NEW**: `references/seedance-voice-consistency.md` — `@audio1/2/3` voice reference pattern for multi-clip series with same speaker. 4 patterns (Dialogue Series, Narration, Singing, Accent-Only Carry). Validated from James Sismanes (@JamesSismanes) Jun 2026 Brooklyn gelato truck workflow using `Use @audio2 to reference [Character]'s established voice and broken English accent`.
  - **UPDATED**: `references/seedance-pattern-library.md` § Pattern 2 Extend — added **Hard Frame Match — Seam-Lock Extension** subpattern (first frame of new clip = last frame of @video1 EXACTLY) + **Audio Carry-Over Specification** (3 layers: BGM/dialogue/foley). Validated from same James Sismanes workflow.
  - **UPDATED**: `references/seedance-motion-vocabulary.md` § Block Sizes — added **Fine-Grain Beat Grid (2-3s segments)** option alongside existing 5s default. For scripted comedy, dialogue, character performance. Documented when-to-use matrix.
  - **GOAL**: incorporate 3 non-trivial techniques from real production workflows. Voice consistency enables series-quality continuity; seam-lock extend enables seamless multi-clip narrative; 2-3s beat grid enables comedic timing precision.

- **1.8.0** (2026-06-18) — **Creative brief intake capability (interview)**
  - **NEW**: `commands/interview.md` — `/s2s interview` command (vague idea → structured brief)
  - **NEW**: `references/creative-brief-intake.md` — 5 core fields (concept/character/location/duration/energy) + 7 extended fields, 3 intake modes (Question-First / Brief-First / Hybrid), Indonesian PSA defaults, OAK workflow defaults, sensitive content guardrails at intake stage
  - **UPDATED**: Capability Router adds "Interview" row at top
  - **UPDATED**: Decision Flowchart routes vague input → `/s2s interview` first
  - **UPDATED**: Reference Library adds "Intake Reference" subsection
  - **UPDATED**: Commands table adds `/s2s interview` entry
  - **UPDATED**: Triggers expanded with 16 new keywords: `bikin video AI`, `bantuin bikin video`, `bikinin video`, `bikinin sesuatu`, `you decide`, `kamu yang tentukan`, `bebas`, `terserah kamu`, `creative brief`, `brief intake`, `vague idea`, `interview video`, `wawancara video`, `PSA kompetisi`, `tugas sekolah video`
  - **GOAL**: adopt Emily's `seedance-interview` sub-skill as first-class capability in s2s. Activates when user has incomplete brief — bridges to other capabilities after intake.

- **1.7.0** (2026-06-18) — **Library restructure: pipeline → capability router**
  - **BREAKING (mental model only, not file structure)**: skill is no longer framed as a 3-step pipeline. New **Capability Router** section maps user intent → references → commands. Each capability is independently invocable.
  - **NEW**: `references/seedance-reference-syntax.md` — adopted from `dexhunter/seedance2-skill` (MIT) — canonical `@`-role binding system with s2s semantic layer (`@[character ref]`, `@[storyboard ref]`, `@[camera ref video]`, etc.)
  - **NEW**: `references/seedance-camera-language.md` — adopted from `dexhunter/seedance2-skill` + `Emily2040/seedance-2.0` v5.5.2 — basic + advanced camera moves, shot sizes, lens vocabulary, POV rules, one-take patterns, time-segmented camera direction, failure modes, cross-model compatibility.
  - **NEW**: `references/seedance-motion-vocabulary.md` — adopted from `Emily2040/seedance-2.0` v5.5.2 — body-part action verbs, object interaction patterns (phone/door/light/wallet), rhythm + beat vocabulary, escalation curves, valence + arousal, cinematic imperfect realism texture pack, anti-slop lexicon, continuity lock vocabulary.
  - **NEW**: `references/seedance-troubleshooting.md` — adopted from `Emily2040/seedance-2.0` v5.5.2 (`seedance-troubleshoot` + `model-mechanics` + `retake-protocol` sub-skills) — 10-category failure-mode taxonomy (identity/camera/action/scene/audio/style/backend/safety/continuity), repair patterns, one-variable retake protocol.
  - **UPDATED**: SKILL.md description now reads "Modular AI video production skill library" instead of "3-step procedural workflow".
  - **UPDATED**: description + triggers in frontmatter expanded to expose new entry points (`/s2s hook`, `/s2s troubleshoot`, `/s2s compose-pattern`, `/s2s bundle`).
  - **UPDATED**: "When to Use" table replaced with full Capability Router + Routing Questions + Decision Flowchart.
  - **BACKWARD COMPAT**: `/s2s pipeline` still works as legacy chained mode (explicit user request only). All existing commands + references unchanged.

- **1.6.5** (2026-06-16) — Sensitive content guardrails + Codex quota + A/B hook pattern
  - NEW section: "Sensitive Content Safety Guardrails" — 6-point production standard for self-harm / suicide / cyberbullying / graphic violence motion prompts.
  - NEW section: "Codex Backend Quota Pitfall" — `gpt-image-2-medium` soft hourly quota, NOT 429. Symptom + 4-step recovery.
  - NEW section: "A/B Hook Variant Pattern" — generate 3 frozen-first-3-seconds storyboard images (one per hook strategy) before committing to motion generation.
  - Learning source: 16 Jun 2026 Layar Terakhir + 16 Putaran A/B hook sessions.

- **1.6.3** (2026-06-15) — Character consistency ordering + script-mode cinematic variations + composite script
  - NEW: Pitfall #11 — generating cinematic-variations images WITHOUT character ref first = every image has a different face.
  - NEW: `references/cinematic-variations-script-mode.md`.
  - NEW: `scripts/storyboard_composite.py`.

- **1.6.2** (2026-06-15) — Two-layer style system clarification + script-to-storyboard workflow
  - NEW: Pitfall #9 — two-layer style system confusion.
  - NEW: Pitfall #10 — writing motion prompts without generating Steps 1-2 first.
  - NEW: Script-to-Storyboard Workflow section.

- **1.6.1** (2026-06-14) — Notion prompt alignment + current/final hygiene.

- **1.6.0** (2026-06-14) — Monochrome 4×3 12-panel storyboard style validated.

- **1.5.0** (2026-06-13) — 2026-06-13 v2 patches from Kreafest validation.

- **1.4.0** (2026-06-13) — Multi-clip storyboards + competition deliverable pattern.

- **1.3.0** (2026-06-11) — Koda + Ivanna pattern adoption.

- **1.2.0** (2026-06-08) — Video reverse-engineering + Edge cases & safety + Product sheet variant.

- **1.2.0** (2026-06-07) — Edge cases & safety.

- **1.1.0** (2026-06-07) — Cinematic composition vocabulary.

- **1.0.0** (2026-06-07) — Initial release.

---

## License

MIT — see [LICENSE](LICENSE) file. Anonymized methodology — no creator attribution in skill naming or frontmatter description.