---
name: storyboard-to-seedance-suite
description: "AI video production router for Seedance/Veo/Kling/GPT Image 2/ElevenLabs v3. Use for brief intake, storyboard prompts, depth-map storyboards, character/product refs, cinematic variations, motion prompts, asset binding, troubleshooting/retake triage, video analysis, hooks, product/UGC ads, VO scripts, and extend/edit/fuse/beat-sync/dialogue/one-take modes. Companion: kuka-worldbuilder handles upstream worldbuilding. Commands: /s2s help, interview, worldbuild, storyboard, depth-map, character-ref, product-ref, cinematic-variations, motion, compose-pattern, analyze, hook, troubleshoot, bundle, ads, vo-v3."
version: 1.15.0
author: Hermes Agent
license: MIT
triggers:
  # Entry points / slash commands
  - "/s2s interview"
  - "/s2s worldbuild"
  - "/s2s storyboard"
  - "/s2s depth-map"
  - "/s2s depth-storyboard"
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
  - "/s2s help"
  - "/s2s vo-v3"
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
  - "s2s help"
  - "s2s commands"
  - "fungsi s2s"
  - "cara pakai s2s"
  - "command apa"
  # Capability keywords
  - "storyboard prompt"
  - "12-section storyboard"
  - "depth map storyboard"
  - "depth storyboard"
  - "convert storyboard to depth"
  - "composition-first storyboard"
  - "separate style from composition"
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
  - "public safety video"
  - "Indonesian public service"
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
| Need command guide or routing                     | Help              | `/s2s help`              | `commands/help.md`                                    |
| Have a vague idea, need a structured brief       | Interview         | `/s2s interview`         | `creative-brief-intake.md`                                |
| Have a spark/place/mood, want a 9-still world bible | Worldbuild      | `/s2s worldbuild`        | companion: `kuka-worldbuilder` (Hermes skill) → see `references/companion-worldbuilder.md` |
| Have a brief, want storyboard image               | Storyboard        | `/s2s storyboard`        | `storyboard-prompt-template.md` + `cinematic-composition-vocabulary.md` |
| Have a normal storyboard, want composition-only spatial control | Depth Map Storyboard | `/s2s depth-map` | `depth-map-storyboard.md` + `depth-map-user-flow.md` |
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

---

## Routing Questions

When intent is ambiguous, ask the user the **minimum disambiguating questions**:

| Question                                            | Branches                                                       |
|-----------------------------------------------------|----------------------------------------------------------------|
| Do you have a video to analyze, or a brief for new? | `analyze` (have video) ↔ `storyboard` / `motion` (have brief)  |
| Is there a human in the video?                      | Yes → `character-ref` first; No → skip                          |
| Is there a product?                                 | Yes → `product-ref` first; No → skip                            |
| Do you already have a storyboard image?             | Yes → skip `storyboard`, go to `motion`                         |
| Do you want composition decoupled from visual style? | Yes → normal `storyboard` first, then `depth-map`                |
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
| `depth-map-storyboard.md`                         | Normal-storyboard-first depth conversion, role binding, and QC |
| `depth-map-user-flow.md`                          | Reproducible `/s2s depth-map` interaction and failure flows |
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
| `storyboard-style-monochrome-4x3.md`              | Monochrome graphite+amber 4×3 12-panel DNA (validated for multi-clip PSA workflows) |
| `director-strip-7-track.md`                       | RHYTHM + ESCALATION vocabulary (7 tracks)            |
| `koda-ivanna-patterns-2026-06.md`                 | 4 patterns reverse-engineered from Koda + Ivanna prompts |
| `seedance-no-character-ref-pov-workflow.md`       | No-character-reference POV workflow + cyberbullying safety |

### Continuity & Pattern References

| File                                              | Use                                                   |
|---------------------------------------------------|-------------------------------------------------------|
| `seedance-asset-binding.md`                       | Legacy `@`-style role binding (still supported)        |
| `seedance-pattern-library.md`                     | 6 patterns: extend / edit / fuse / beat-sync / dialogue / one-take |
| `notion-prompt-alignment.md`                      | Canonical storyboard vs motion prompt hygiene in Notion |
| `hook-brainstorming-social-issue.md`              | Hook brainstorming for social-issue / competition videos |

### Validation / Worked Examples

| File                                              | Use                                                   |
|---------------------------------------------------|-------------------------------------------------------|
| `banana-bread-worked-example.md`                  | Anonymized real-world case study                       |
| `storyboard-motion-prompt-review-notes.md`        | Review checklist + realism-lock phrases                |
| `seedance-2-best-practices-2026.md`               | Broader Seedance research (June 2026)                  |
| `seedance-best-practices.md`                      | General Seedance best practices                        |
| `tiktok-analyzer-system-prompt.md`                | Reverse-engineering competitor videos                  |

---

## Commands

Each command in `commands/` is a **single capability spec** — invocable independently, not chained by default.

| Command                       | Capability        | Spec File                  |
|-------------------------------|-------------------|----------------------------|
| `/s2s interview`              | Interview (intake)| `commands/interview.md`    |
| `/s2s worldbuild`             | Worldbuild        | `commands/worldbuild.md` (companion: kuka-worldbuilder) |
| `/s2s help`                   | Help              | `commands/help.md`         |
| `/s2s storyboard`             | Storyboard        | `commands/storyboard.md`   |
| `/s2s depth-map`              | Depth Map Storyboard | `commands/depth-map.md` |
| `/s2s character-ref`          | Character Ref     | `commands/character-ref.md` |
| `/s2s product-ref`            | Product Ref       | `commands/product-ref.md`  |
| `/s2s cinematic-variations`   | Pre-visualization | `commands/cinematic-variations.md` |
| `/s2s motion`                 | Motion            | `commands/motion.md`       |
| `/s2s compose-pattern`        | Pattern (extend/edit/fuse/beat-sync/dialogue/one-take) | `commands/compose-pattern.md` |
| `/s2s analyze`                | Analyze           | `commands/analyze.md`      |
| `/s2s hook`                   | Hook              | `commands/hook.md` |
| `/s2s troubleshoot`           | Troubleshoot      | `commands/troubleshoot.md` + retake/model/failure refs |
| `/s2s bundle`                 | Bundle            | `commands/bundle.md` |
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
  │    ├─ Want composition separated from visual style?
  │    │   └─ Normal storyboard approved → /s2s depth-map
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

- SKILL.md sections below: "Multi-Clip Storyboards", "Style Lock: Monochrome Sepia/Amber", "Script-to-Storyboard Workflow"

Validated structure: **7×15s = 1:45**

| Clip | Detik | Role     | Beat                          |
|------|-------|----------|-------------------------------|
| 1    | 0:00-0:15 | Hook  | Repetitive gesture, world state |
| 2-5  | 0:15-1:15 | Buildup | 4 fates per clip, 16 total  |
| 6    | 1:15-1:30 | Climax | Chaos / glitch / freeze        |
| 7    | 1:30-1:45 | Resolution | End card, text only, silence |

1. Same `@[character ref]` in every clip's motion prompt (prevents face drift)
2. Spatial Continuity Lock MUST carry across clips (same room, geography, screen direction)
3. Director strip RHYTHM TRACK escalates monotonically (`hold` → `pause` → `build` → `burst` → `pause` → `rest`)
4. Audio bed is a SINGLE layer in post (generate each clip with diegetic foley only)
5. End card (final clip) gets typography exception (only place text on screen is permitted)
6. For 4x4 grid scenes: lock "upper-center, fixed position" + add anti-contact-sheet negatives
7. Cost scales linearly: 7 clips × $0.50-0.75 motion + $0.14 storyboards + $0.02 char ref ≈ $3.66-5.41

---

## Style Lock: Monochrome Sepia/Amber

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

This pattern was developed and tested on the sensitive-content PSA workflow — 7 motion prompts + 7 storyboards, all passed downstream review for an Indonesian public-service film brief.

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

**1a. Triptych/3-panel default for multi-clip storyboards** — Agent default is to generate a "3 panels = 3 scenes" image per clip. WRONG. For a multi-clip narrative with shared character + setting, each storyboard is a 12-panel *sequence* (4×3 grid, P01-P12) of the SAME scene with progressive beats. 1 clip = 1 storyboard = 12 panels of one room + close-ups. See `references/storyboard-style-monochrome-4x3.md` for the reusable monochrome 4×3 12-panel style.

**1b. Don't loop director profile for batch image generation** — Director profile is for prompt CRAFTING (1 call per prompt). After prompt is crafted, generate directly via `image_generate` tool. Director profile adds 2-3 min per call vs ~30s direct, and times out at 5min on long prompts. For multi-clip batches (5-7 storyboards), the workflow is: write prompt once → `image_generate` × N.

**1c. Motion prompt must follow the generated storyboard, not the older draft** — if Notion contains an earlier prompt draft and a later generated storyboard establishes the canonical hook/composition, treat the generated storyboard as the source of truth. Rebuild the Seedance motion prompt from that actual panel order before generating video.

**1d. Notion prompt hygiene — keep only one current storyboard prompt and one current motion prompt** — when a review loop produces a better canonical version, delete or archive the stale blocks in Notion before appending the new one. Otherwise the page drifts and future agents will copy the wrong draft.

**1e. Hook-first storyboards need a dedicated hook-brainstorming pass** — don't jump straight to a 12-panel storyboard when the user hasn't locked the opening. Use `references/hook-brainstorming-social-issue.md` to generate tiers of hooks, evaluate against the 6 criteria (Clarity in 3s, Visual AI-ability, Relevance, Emotional hit, Uniqueness, Continuity), and lock a tagline + 3-frame visual before expanding to 12 panels. This prevents the common failure mode of a weak first 3 seconds that the rest of the clip cannot fix.

**2. Skipping reference image generation** — without `@[character ref]` or `@[product ref]`, Seedance hallucinates faces/environments. Always generate the ref.

**3. One-axis emotion ("make it playful")** — collapses to flat mood. Always split into Valence + Arousal in the motion prompt.

**4. Music baked into generation** — locks pacing, makes re-edits hard. Default to silent + diegetic foley. Add music in post (CapCut, DaVinci).

**5. Forgetting screen direction in location** — without explicit screen direction (window left, oven right), Seedance flips geometry between shots. Always include screen direction in LOCATION.


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

See `references/cross-platform-install.md`.

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
- `references/storyboard-style-monochrome-4x3.md` — monochrome graphite + amber/sepia 4×3 12-panel storyboard style used for multi-clip PSA workflows. Single source of truth for the monochrome style.
- `references/notion-prompt-alignment.md` — checklist for keeping one current storyboard prompt and one current motion prompt on the page; delete stale drafts after review.
- `references/koda-ivanna-patterns-2026-06.md` — 4 high-value patterns (Director Strip augmented, Spatial Continuity Lock, HARD CUT marker, NEGATIVE PROMPT block) reverse-engineered from published Koda `@aimikoda` + Ivanna `@ivanka_humeniuk` prompts.
- `references/hook-brainstorming-social-issue.md` — hook generation workflow for social-issue / competition AI videos.
- `references/cinematic-variations-script-mode.md` — script-mode variant of `/s2s cinematic-variations` + character-consistency ordering rule.

---

## Version History

See `references/version-history.md`.

---

## License

MIT — see [LICENSE](LICENSE) file. Anonymized methodology — no creator attribution in skill naming or frontmatter description.