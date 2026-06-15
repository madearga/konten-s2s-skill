---
name: storyboard-to-seedance-suite
description: "3-step procedural workflow for AI video production: (1) GPT Image 2 storyboard prompt using 12-Section template, (2) GPT Image 2 character OR product reference prompt (separate commands), (3) Seedance 2.0 motion prompt. Slash commands: /s2s storyboard, /s2s character-ref, /s2s product-ref, /s2s motion, /s2s pipeline. Use when creating storyboards for video, generating reference images for consistency, or building motion prompts for Seedance-class models."
version: 1.6.0
author: Hermes Agent
license: MIT
triggers:
  - "storyboard prompt"
  - "12-section storyboard"
  - "seedance prompt"
  - "video motion prompt"
  - "product reference image"
  - "character reference image"
  - "image to video pipeline"
  - "storyboard to seedance"
  - "video prompt suite"
  - "s2s storyboard"
  - "s2s character-ref"
  - "s2s product-ref"
  - "s2s motion"
  - "s2s pipeline"
  - "s2s cinematic-variations"
  - "character sheet"
  - "product sheet"
  - "product reference"
  - "character reference"
  - "buat storyboard"
  - "bikinin prompt video"
  - "bikin video AI"
  - "AI video pipeline"
  - "Seedance 2.0 prompt"
  - "cinematic composition"
  - "cinematic variations"
  - "10 compositions"
  - "pre-visualization"
  - "film still"
  - "cinematic realism"
  - "analyze video"
  - "reverse engineer video"
  - "video analysis"
  - "extract prompt from video"
  - "analisa video"
  - "bikin prompt dari video"
  - "s2s analyze"
  - "competitor analysis"
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
  - "video extend"
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
  - "asset binding"
  - "@ reference"
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
---
# storyboard-to-seedance-suite

A **3-step procedural skill** for AI video production. Turns a brief into three copy-paste-ready prompts (storyboard, reference, motion), with checkpoints for review and a master pipeline command for end-to-end runs.

Part of the `ai-video-production` umbrella skill. Tuned for **Seedance 2.0** as the video generator, with template structure generic enough to adapt to other Seedance-class models.

# storyboard-to-seedance-suite

A **3-step procedural skill** for AI video production. Turns a brief into three copy-paste-ready prompts (storyboard, reference, motion), with checkpoints for review and a master pipeline command for end-to-end runs.

Part of the `ai-video-production` umbrella skill. Tuned for **Seedance 2.0** as the video generator, with template structure generic enough to adapt to other Seedance-class models.

**v1.3.0 is additive only:** the existing 3-step workflow, reverse-engineering flow, and command surface stay the same. The enhancement adds an optional **asset-role binding layer** (`@`-style attachment roles) plus a **pattern library** for extend/edit/fuse/beat-sync/dialogue/one-take scenarios.

---

## When to Use

| Trigger | Auto or Manual | Command |
|---------|----------------|---------|
| User says "storyboard" / "12-section storyboard" | Auto | `/s2s storyboard` |
| User says "character sheet" / "character reference" | Auto | `/s2s character-ref` |
| User says "product reference" / "product sheet" | Auto | `/s2s product-ref` |
| User says "video motion prompt" / "Seedance prompt" | Auto (if refs present) | `/s2s motion` |
| User says "full video pipeline" / "storyboard to seedance" | Auto | `/s2s pipeline` |
| User wants 1 step only | Manual | Subcommand (`/s2s storyboard`, etc.) |
| User wants all 3 steps with checkpoints | Manual | `/s2s pipeline` |
| User says "analyze video" / "reverse engineer" / "extract prompt" | Auto | `/s2s analyze` |
| User uploads a video file | Auto | `/s2s analyze` |
| User wants to extend / edit / merge existing clips | Auto | `/s2s analyze` → `/s2s motion` with pattern-library mode |
| User has many mixed assets and asks what each should do | Auto | `/s2s motion` with asset-role binding layer |

**Do NOT use for:**
- First+Last frame simple videos (use `ai-video-production` section 2.7 instead)
- Real human face videos (Seedance face-blocks — use Kling 3.0)
- 60-second continuous shots (split into 4-6 short clips)

---

## The 3 Steps + Reverse-Engineering

The skill supports **two directions**:

### Forward: Brief → Video (3 steps)
Create new video from a text brief.

### Reverse: Video → Brief (1 step)
Analyze existing video, extract prompts, optionally feed back into forward pipeline.

```
Existing video (competitor / reference)
   ↓
/s2s analyze [video-path]
   → Output: 10-section analysis + reverse-engineered prompt
   → Auto-detect: can this feed into /s2s pipeline?
   ↓ (if yes)
Auto-generated brief → /s2s pipeline "[brief]"
   → Standard 3-step workflow
```

---

## The 3 Steps (Forward Direction)

```
Brief (free text)
   ↓
Step 1: /s2s storyboard
   → Output: 12-section GPT Image 2 prompt
   → Generates: storyboard.png (monochrome panel grid + director strip)
   ↓ checkpoint
Step 2a: /s2s character-ref  (if human in video)
   → Output: 3-angle character sheet prompt
   → Generates: character.png (identity sheet)
   OR
Step 2b: /s2s product-ref  (if product in video)
   → Output: hero / multi-angle / lifestyle prompt
   → Generates: product.png (reference image)
   ↓ checkpoint
Step 3: /s2s motion
   → Output: Seedance 2.0 motion prompt with 5-part spine
   → Requires: storyboard.png + character.png / product.png
   → Generates: video.mp4 (8-15s)
   ↓
Bundle file: s2s-bundle-YYYYMMDD-HHMMSS.md
```

**Total cost: ~$0.54-0.89 per video. Wall time: ~15-20 min.**

---

## Optional v1.3.0 Enhancements (Non-Breaking)

These upgrades sit **on top of** the existing pipeline. If the user does not need them, the skill behaves exactly like v1.2.0.

### 1. Asset-Role Binding Layer

When the user has 3+ assets, bind each one to a specific role instead of treating all attachments as generic references.

Examples:
- `@[storyboard ref]` — director-approved panel plan
- `@[character ref]` — identity lock
- `@[product ref]` — product continuity lock
- `@[first frame ref]` / `@[last frame ref]` — hard opening or landing frame
- `@[camera ref video]` — camera behavior only
- `@[action ref video]` — movement choreography only
- `@[fx ref video]` — transition/effect language only
- `@[rhythm ref video]` / `@[bgm ref audio]` — beat map only

See: `references/seedance-asset-binding.md`

### 2. Pattern Library Layer

Use the same pipeline, but swap the Step 3 motion wording to match the scenario:
- **Standard new generation**
- **Extend** an existing clip forward/backward
- **Edit** an existing clip while preserving most of it
- **Fuse** multiple clips into one continuous sequence
- **Beat-sync** montage / music-driven cuts
- **Dialogue / talk-to-camera** delivery
- **One-take / single-take** choreography

See: `references/seedance-pattern-library.md`

---

## Quick Start

### Forward (create new video):

```
/s2s pipeline Indonesian girl in kitchen making banana bread, 15s, high-rhythm smash cuts
```

### Reverse (analyze existing video):

```
/s2s analyze competitor-video.mp4
/s2s analyze --seedance reference-ugc.mp4
/s2s analyze --quick viral-tiktok.mp4
```

### Forward workflow (what happens):
1. Ask 1-3 clarifying Qs (concept, character, location, duration, energy)
2. Run Step 1 → pause for review
3. Run Step 2 → pause for review
4. Run Step 3 → pause for review
5. Save bundle file with all 3 prompts

**Or run steps individually** if you already have an image:

```
/s2s motion
  (with storyboard.png + character.png paths)
```

---

## Slash Commands Reference

| Command | Step | When to Use | Output |
|---------|------|-------------|--------|
| `/s2s cinematic-variations` | pre | Want to explore 10 composition options for a key moment | 10 single-image prompts (different compositions) |
| `/s2s storyboard` | 1 | Need storyboard image | 12-section prompt → storyboard.png |
| `/s2s character-ref` | 2a | Human in video | 3-angle sheet → character.png |
| `/s2s product-ref` | 2b | Product in video | 3 variants → product.png |
| `/s2s motion` | 3 | Have storyboard + ref, need motion prompt | 5-part spine → video.mp4 |
| `/s2s pipeline` | 1+2+3 | Have brief, want full workflow | All 3 prompts + bundle |
| `/s2s analyze` | 0 (reverse) | Have video, want to reverse-engineer | 10-section analysis + prompts |
| `/s2s analyze --quick` | 0 (reverse) | Fast triage of competitor video | Classification + beat list |
| `/s2s analyze --seedance` | 0 (reverse) | Analyze + generate Seedance motion | Analysis + R2V prompt |

Each subcommand has a dedicated spec in `commands/`. The pipeline command chains them with checkpoints.

**v1.3.0 note:** `/s2s motion` now has optional branches for asset-role binding and pattern-library modes, but it remains the same Step 3 command.

---

## Decision Tree (Which Command to Use)

```
User Intent Detected
   ↓
Q: Has a VIDEO FILE to analyze?
├─ YES → /s2s analyze [video-path]
│        ├─ Quick triage? → /s2s analyze --quick
│        ├─ Want Seedance prompt? → /s2s analyze --seedance
│        └─ After analysis → auto-feeds brief into /s2s pipeline if possible
│
└─ NO, has text BRIEF for new video?
   ├─ YES → /s2s pipeline  (master, runs all 3 steps)
   │
   └─ NO, wants to explore visual language first?
      ├─ YES → /s2s cinematic-variations  (10 composition sweep)
      │        → pick winner → /s2s storyboard (or /s2s pipeline)
      │
      └─ NO, needs reference image(s) first?
         │
         ├─ Brief has BOTH human + product?  ← v1.2.0 fix
         │  → /s2s character-ref  (Step 2a, parallel)
         │  + /s2s product-ref    (Step 2b, parallel)
         │
         ├─ Has human only?
         │  → /s2s character-ref  (Step 2a)
         │
         ├─ Has product only?
         │  → /s2s product-ref   (Step 2b, --type=hero|multi-angle|lifestyle|in-use|sheet)
         │
         └─ No human, no product (landscape/abstract)?
            → skip Step 2, go directly to Step 3
```

---

## Bundled Output

At the end of `/s2s pipeline`, user gets:

1. **3 copy-paste prompts** (markdown code blocks, ready to send to GPT Image 2 / Seedance 2.0)
2. **3 generated images** (storyboard.png, character.png OR product.png)
3. **1 final video** (video.mp4, 8-15s)
4. **1 bundle file** (`s2s-bundle-YYYYMMDD-HHMMSS.md`) with:
   - All 3 prompts preserved
   - Aggregated QC summary
   - Cost + time summary
   - Resume capability (`/s2s pipeline resume --from=step2`)

---

## Pitfalls (Top 6 Mistakes to Avoid)

1. **Treating storyboard image as the signal** — the image is documentation. The text in the motion prompt (director strip + panel beats) is the contract. Always include the text, not just the image attachment.

**1a. (NEW 2026-06-14) Triptych/3-panel default for multi-clip storyboards** — Agent default is to generate a "3 panels = 3 scenes" image per clip. WRONG. For a multi-clip narrative with shared character + setting, each storyboard is a 12-panel *sequence* (4×3 grid, P01-P12) of the SAME scene with progressive beats. 1 clip = 1 storyboard = 12 panels of one room + close-ups. See `references/storyboard-style-monochrome-4x3.md` for the validated monochrome 4×3 12-panel style used in 5-clip "16 Putaran" project.

**1b. (NEW 2026-06-14) Don't loop director profile for batch image generation** — Director profile is for prompt CRAFTING (1 call per prompt). After prompt is crafted, generate directly via `image_generate` tool. Director profile adds 2-3 min per call vs ~30s direct, and times out at 5min on long prompts. For multi-clip batches (5-7 storyboards), the workflow is: write prompt once → `image_generate` × N.

**1c. (NEW 2026-06-14) Motion prompt must follow the generated storyboard, not the older draft** — if Notion contains an earlier prompt draft and a later generated storyboard establishes the canonical hook/composition, treat the generated storyboard as the source of truth. Rebuild the Seedance motion prompt from that actual panel order before generating video.

- **1d. (NEW 2026-06-14) Notion prompt hygiene — keep only one current storyboard prompt and one current motion prompt** — when a review loop produces a better canonical version, delete or archive the stale blocks in Notion before appending the new one. Otherwise the page drifts and future agents will copy the wrong draft.

- **1e. (NEW 2026-06-14) Hook-first storyboards need a dedicated hook-brainstorming pass** — don't jump straight to a 12-panel storyboard when the user hasn't locked the opening. Use `references/hook-brainstorming-social-issue.md` to generate tiers of hooks, evaluate against the 6 criteria (Clarity in 3s, Visual AI-ability, Relevance, Emotional hit, Uniqueness, Continuity), and lock a tagline + 3-frame visual before expanding to 12 panels. This prevents the common failure mode of a weak first 3 seconds that the rest of the clip cannot fix.

2. **Skipping reference image generation** — without `@[character ref]` or `@[product ref]`, Seedance hallucinates faces/environments. Always generate the ref.

3. **One-axis emotion ("make it playful")** — collapses to flat mood. Always split into Valence + Arousal in the motion prompt.

4. **Music baked into generation** — locks pacing, makes re-edits hard. Default to silent + diegetic foley. Add music in post (CapCut, DaVinci).

5. **Forgetting screen direction in location** — without explicit screen direction (window left, oven right), Seedance flips geometry between shots. Always include screen direction in LOCATION.

**6. (v1.3.0+) Attachment ambiguity** — if multiple files are attached but roles are unspecified, camera/style/action signals bleed into each other. Bind each attachment to a single job (storyboard / identity / product / first-frame / camera / action / FX / rhythm / audio). See `references/seedance-asset-binding.md` for the explicit `@`-style role binding pattern.

**6. (v1.5.0) Text inside grid cells** — Seedance + Pixazo hallucinate text (random letters, Arabic-looking glyphs, misspellings). Never put text labels in any AI-generated frame except the closing line / hashtag in the end card. Use visual iconography + Indonesian context words instead. See `references/competition-deliverable-blueprint.md` § "NO TEXT IN GRID CELLS" for the validated translation table.

**7. (v1.3.0+) Attachment ambiguity** — if multiple files are attached but roles are unspecified, camera/style/action signals bleed into each other. Bind each attachment to a single job (storyboard / identity / product / first-frame / camera / action / FX / rhythm / audio). See `references/seedance-asset-binding.md` for the explicit `@`-style role binding pattern.

**8. (v1.3.0+) Using the wrong mode for existing-video tasks** — extend/edit/fuse requests should keep the same 5-part spine, but switch Step 3 language to the correct mode. See `references/seedance-pattern-library.md` for extend, edit, fuse, beat-sync, dialogue, one-take patterns.

## Style Lock: Monochrome Sepia/Amber (Validated 2026-06-14, "16 Putaran" Rizky)

> Full style DNA, cell narrative map, and validated pitfalls: see `references/monochrome-storyboard-style.md`

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

**Reference style anchor:** See `references/monochrome-storyboard-style.md` for the validated reference image and full style DNA.

**Pitfall (validated 2026-06-14):** User rejected photorealistic triptych / 4-panel output in favor of monochrome 4x3 grid. If brief says "monochrome", "sepia", "amber", "hand-drawn", "sketched", or references a grayscale/monochrome anchor image, **do NOT generate photorealistic triptych**. Use the 4x3 12-panel grid pattern from this section.

## Multi-Clip Storyboards (Narrative-Arc Videos > 30s)

For competition submissions, social-impact PSAs, or any video longer than 15s, the single-storyboard approach breaks down. Split into N clips of 8-15s each, each with its own storyboard image and motion prompt. Composite in post (CapCut / DaVinci).

**When to use multi-clip mode:**
- Target duration > 30s (lomba, social campaign, narrative arcs)
- Story has discrete beats (hook → buildup → climax → resolution)
- Single storyboard image would exceed 9 panels (drift risk, illegible)

**Validated structure: 7×15s = 1:45 (Kreafest 2026 "16 Putaran" template)**

| Clip | Detik | Role | Beat |
|------|-------|------|------|
| 1 | 0:00-0:15 | Hook | Repetitive gesture, world state introduced |
| 2-5 | 0:15-1:15 | Buildup | 4 fates per clip, 16 total in grid |
| 6 | 1:15-1:30 | Climax | Chaos / glitch / freeze |
| 7 | 1:30-1:45 | Resolution | End card, text only, total silence |

**Key rules:**

1. **Same `@[character ref]` in every clip's motion prompt** — prevents face drift. Generate ref ONCE in Step 2, paste the same ref ID into all 7 motion prompts.
2. **Spatial Continuity Lock MUST carry across clips** — same room, same geography, same screen direction. Allowed changes: lighting, brightness, character posture, prop state. Forbidden: flipping screen direction, relocating anchor geography.
3. **Director strip RHYTHM TRACK escalates monotonically** — `hold` → `pause` → `build` → `burst` → `pause` (climax drop) → `rest`. Don't reset between clips.
4. **Audio bed is a SINGLE layer in post** — generate each clip with diegetic foley only (no music), then build the rhythm in CapCut/DaVinci by adjusting tap/tempo per clip section. See `references/competition-deliverable-blueprint.md` for the full composite recipe.
5. **End card (final clip) gets typography exception** — Clip 7 in the Kreafest pattern is the only place text on screen is permitted, since it carries the closing line and hashtag. Mark it explicitly in the CONSTRAINTS section ("The ONLY on-screen elements allowed are the two text strings").
6. **For 4x4 grid scenes: lock "upper-center, fixed position"** — Seedance-class models drift the grid between clips unless the spatial lock is heavy. State it in every clip's MOTION prompt LOCATION and add a NEGATIVE PROMPT line: "split-screen beyond the 4x4, contact sheet, picture-in-picture".
7. **Cost scales linearly with clip count** — 7 clips × $0.50-0.75 = $3.50-5.25 motion. Add $0.14 for 7 storyboard images. Character ref is a one-time $0.02. Total: ~$3.66-5.41 per 1:45 video.
8. **(v1.5.0) Hook retention = 3-second visual question + smash cut + second hook at 11s** — vertical short-form audiences swipe away in <3s if the first frame is black. See `references/competition-deliverable-blueprint.md` § "Hook Retention Pattern" for the validated 12-panel v2 structure.
9. **(v1.5.0) P09 (or any "hold" frame) highlights ONE new cell only** — no double-lighting previously-activated cells. The viewer reads progress from cell count, not from multi-light. See `references/competition-deliverable-blueprint.md` § "Per-Clip P09 Rule".
- **(v1.5.0) Indonesian context in cell scenes** — generic "home loss" / "family loss" reads as Asian-generic. Anchor each cell with specific Indonesian props (cermin, warung tenda, meja kayu, puskesmas, sel tahanan). See `references/competition-deliverable-blueprint.md` § "NO TEXT IN GRID CELLS" for the validated translation table.

## Image Backend for Storyboard Panels (Jun 2026 update)

For the **storyboard.png** step (Step 1, 12-section GPT Image 2 prompt) the `image_generate` native tool is now the preferred path when ChatGPT plan is active:

```python
# Inside the s2s storyboard command, replace manual Pixazo call with:
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

**Competition submission deadline pattern (validated 2026-06):**

- T-7 days: brief + 3 concept options + ranking
- T-5 days: lock concept, generate 1 char ref for QC
- T-3 days: batch-generate 7 storyboard images, QC each
- T-2 days: generate 7 motion clips (parallel where possible)
- T-1 day: composite in CapCut, color grade, captions
- T-0: upload to submission form + IG/TikTok with required hashtags

See `references/competition-deliverable-blueprint.md` for the full Kreafest 2026 "16 Putaran" case study (16 fate grid, Indonesian context, 1:45 duration, $5 budget, 2-3 hour execution), including the validated 2026-06-13 v2 patches: hook retention, no-text rule, single-cell P09, Indonesian visual context, predicted-comments QC, and v2 patch checklist.

---

## File Structure

```
storyboard-to-seedance-suite/
├── SKILL.md                          # this file (entry point)
├── install.sh                        # cross-platform symlink installer
├── references/
│   ├── storyboard-prompt-template.md  # 12-Section fill-in template
│   ├── character-ref-prompt.md        # 3-angle character sheet template
│   ├── product-ref-prompt.md          # 3 variants: hero, multi-angle, lifestyle
│   ├── seedance-motion-prompt.md      # 5-part spine + worked example
│   ├── seedance-asset-binding.md      # optional @-style attachment role system
│   ├── seedance-pattern-library.md    # optional extend/edit/fuse/dialogue/beat-sync modes
│   ├── director-strip-7-track.md      # RHYTHM + ESCALATION vocabulary
│   ├── storyboard-motion-prompt-review-notes.md # storyboard vs motion prompt review notes; realism lock; source-of-truth rule
│   ├── notion-prompt-alignment.md          # clean-up checklist for canonical storyboard vs motion prompts in Notion
│   ├── koda-ivanna-patterns-2026-06.md # 4 patterns from published Koda + Ivanna prompts
│   ├── banana-bread-worked-example.md # anonymized real-world case study
│   ├── cinematic-composition-vocabulary.md  # 19 cinematic styles + texture pack
│   ├── competition-deliverable-blueprint.md # competition case study + 2026-06-13 v2 patches
│   ├── storyboard-style-monochrome-4x3.md   # monochrome graphite+amber 4x3 12-panel DNA (16 Putaran)
│   ├── hook-brainstorming-social-issue.md   # hook generation for social-issue/competition AI videos
│   ├── storyboard-motion-prompt-review-notes.md # review checklist, realism-lock phrases
│   └── video-analysis-template.md     # 10-section fill-in template for /s2s analyze
├── commands/
│   ├── storyboard.md                  # /s2s storyboard
│   ├── character-ref.md               # /s2s character-ref
│   ├── product-ref.md                 # /s2s product-ref
│   ├── motion.md                      # /s2s motion
│   ├── pipeline.md                    # /s2s pipeline (master)
│   ├── cinematic-variations.md        # /s2s cinematic-variations (pre-vis)
│   └── analyze.md                     # /s2s analyze (reverse-engineer video)
└── tests/
    └── test-cases.md                  # 7 grouped test cases including additive Step 3 modes
```

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
| Hermes | `/s2s pipeline <brief>` | Slash command parser reads markdown specs under `commands/` |
| Claude Code | `/s2s-pipeline <brief>` | One file per slash command, named after file |
| OpenCode | `/s2s-pipeline <brief>` | Same as Claude Code |
| Codex CLI | `/s2s-pipeline <brief>` | Same as Claude Code |

In Claude Code / OpenCode / Codex, the slash commands aren't auto-registered like Hermes. To invoke, either:
1. Reference the skill by name in natural language: "use the storyboard-to-seedance-suite skill to make a banana bread video"
2. The agent will auto-load it when trigger keywords appear (e.g., "storyboard prompt", "video motion prompt")

For Hermes users, the explicit `/s2s pipeline` slash commands work as documented in `commands/`.

---

## Related References

In the parent `ai-video-production` skill:
- `SKILL.md` section 2.7 (First+Last Frame) — simpler alternative for <8s clips
- `SKILL.md` section 2.9 (Metamorphosis 4-step) — alternative storyboard method
- `references/seedance-2-best-practices-2026.md` — broader Seedance context
- `references/seedance-best-practices.md` — general Seedance best practices
- `references/tiktok-analyzer-system-prompt.md` — for reverse-engineering competitor videos
In this skill:

- `references/storyboard-style-monochrome-4x3.md` — **NEW (2026-06-14)** validated monochrome graphite + amber 4×3 12-panel storyboard style. Used end-to-end for 5-clip "16 Putaran" project. Includes known-good prompt template, pitfall list, production workflow. Use this when the brief asks for a multi-clip narrative with shared character + setting, NOT a single 8-15s UGC ad.
- `references/notion-prompt-alignment.md` — checklist for keeping one current storyboard prompt and one current motion prompt on the page; delete stale drafts after review.
- `references/koda-ivanna-patterns-2026-06.md` — 4 high-value patterns (Director Strip augmented, Spatial Continuity Lock, HARD CUT marker, NEGATIVE PROMPT block) reverse-engineered from published Koda `@aimikoda` + Ivanna `@ivanka_humeniuk` prompts on 2026-06-11. Adopt these into motion + storyboard templates; they generalize to Veo 3.1 Lite and Kling 3.0 even though we don't ship Seedance 2.0 in our pipeline.
- `references/competition-deliverable-blueprint.md` — full Kreafest 2026 "16 Putaran" case study (7×15s, 16-fate grid, Indonesian context, $5 budget) PLUS 2026-06-13 v2 patches: hook retention pattern, NO TEXT IN GRID CELLS, per-clip P09 single-cell rule, predicted-comments QC, v2 patch checklist, score self-assessment matrix.
- `references/hook-brainstorming-social-issue.md` — **NEW (2026-06-14)** hook generation workflow for social-issue / competition AI videos. Includes 5 hook tiers, 6 evaluation criteria, research-backed phrasing, common pitfalls, and a worked example from the "16 Putaran" anti-judi-online review session. Use whenever the user asks for "hook yang engaging", "alternatif hook", or wants to integrate Indonesian statistics into the opening.

---

## Version History

- **1.3.0** (2026-06-14) — Non-breaking Step 3 enhancement layer
  - **NEW**: `references/seedance-asset-binding.md` (explicit `@`-style role binding for storyboard / identity / product / first-frame / camera / action / FX / rhythm / audio inputs)
  - **NEW**: `references/seedance-pattern-library.md` (extend, edit, fuse, beat-sync, dialogue, one-take patterns)
  - **UPDATED**: `commands/motion.md` — optional asset-role intake + Step 3 mode switching while preserving the same command
  - **UPDATED**: `references/seedance-motion-prompt.md` — optional `ASSET ROLE BINDING` and `MODE OVERRIDE` blocks
  - **UPDATED**: README / tests / pipeline docs for additive Step 3 behaviors
  - **GOAL**: learn from direct Seedance prompting patterns without breaking the existing storyboard → ref → motion workflow

- **1.2.0** (2026-06-08) — Video reverse-engineering + Edge cases & safety + Product sheet variant
  - **NEW**: `commands/analyze.md` (`/s2s analyze` — reverse-engineer existing videos)
  - **NEW**: `references/video-analysis-template.md` (10-section fill-in template)
  - **NEW**: 3 analyze modes — full analysis, quick scan, seedance-ready
  - **NEW**: Auto-pipeline detection — analysis can auto-feed into `/s2s pipeline`
  - **NEW**: UGC Indonesia context (Section 8) — audience, setting, skin tone, cultural cues
  - **NEW**: Product continuity lock — track product appearance consistency across beats
  - **NEW**: Pipeline recommendation engine — auto-detect Kling vs Seedance vs Veo based on content
  - **NEW**: Product-ref variant #5 `sheet` (6-panel 21:9 comprehensive reference — all angles in 1 generation)
  - **FIX #1**: Pipeline auto-detect human + product (run both refs in parallel, default to both for FMCG/UGC)

- **1.6.1** (2026-06-14) — Notion prompt alignment + current/final hygiene
  - NEW: `references/notion-prompt-alignment.md` — canonical storyboard vs motion prompt checklist for pages that drift during review
  - UPDATED: Pitfall #1c clarified that the generated storyboard is the source of truth for the motion prompt
  - NEW: Pitfall #1d — keep only one current storyboard prompt and one current motion prompt visible; delete/archive stale drafts before appending the final version
  - Practical lesson from the hook-first review flow: if the user asks for a more engaging opening, the storyboard and motion prompts should be re-centered on the hook-first canonical sequence, not the older story arc

- **1.6.0** (2026-06-14) — Monochrome 4×3 12-panel storyboard style validated
  - NEW: `references/storyboard-style-monochrome-4x3.md` — full style spec, known-good prompt template, 5 pitfalls, production workflow
  - Pitfall #1a: triptych/3-panel default for multi-clip storyboards (each storyboard is 12 panels of one scene, not 3 scenes)
  - Pitfall #1b: don't loop director profile for batch image generation (use `image_generate` directly after prompt is crafted, saves 2-3 min per call)
  - 3 new triggers: "monochrome storyboard", "12-panel storyboard", "4x3 grid storyboard"
  - NEW: `references/storyboard-motion-prompt-review-notes.md` — lightweight review checklist for the common failure mode where an older draft lingers in Notion after a newer storyboard becomes canonical; includes realism-lock phrases for "looks like AI" feedback
  - Pitfall #1c: Motion prompt must follow the generated storyboard, not the older draft (rebuild from actual panel order before generating video)

- **1.5.0** (2026-06-13) — 2026-06-13 v2 patches from Kreafest validation
  - NEW: 5 additions to `references/competition-deliverable-blueprint.md`:
    1. **Hook Retention Pattern** — validated 12-panel v2 structure (0.3s grid flash + 0.3s smash-cut-to-black + content + 11s second hook) with retention math (~75% at 3s vs ~60% without, ~45% completion vs ~25%)
    2. **NO TEXT IN GRID CELLS** — validated pitfall + translation table (16 concepts text→visual iconography) + Indonesian context word bank
    3. **Per-Clip P09 Rule** — single-cell highlight only, no double-lighting
    4. **Predicted-Comments QC Pattern** — write 20 comments (8 positive + 7 critical + 5 questions) BEFORE generating video, surface ambiguity in prompt
    5. **v2 Patch Checklist + Score Self-Assessment Matrix** — 5-dimension scoring (hook/cadence/specificity/continuity/pacing) with weights
  - UPDATED SKILL.md:
    - Pitfall #6 added: text inside grid cells
    - Multi-clip rule #8: hook retention pattern
    - Multi-clip rule #9: P09 single-cell rule
    - Multi-clip rule #10: Indonesian context in cell scenes
  - Trigger: short-form retention, hook pattern, 3-second hook, smash cut, double hook, text in cells, predicted comments, v2 patch
  - Validated end-to-end on KreafestPoldaJatim 2026 "16 Putaran" — 4/5 clips re-patched to v2, pushed to user Notion

- **1.4.0** (2026-06-13) — Multi-clip storyboards + competition deliverable pattern
  - NEW: `references/competition-deliverable-blueprint.md` — full Kreafest 2026 "16 Putaran" case study (7×15s structure, 4 fates per clip, 1:45 total, $5 budget). Reusable for any competition submission: swap the 16 fates, keep the structure.
  - NEW: Multi-Clip Storyboards section in SKILL.md — 7 rules for narrative-arc videos > 30s:
    1. Same `@[character ref]` in every clip's motion prompt (prevents face drift)
    2. Spatial Continuity Lock must carry across clips (same geography, same screen direction)
    3. RHYTHM TRACK escalation is monotonic (don't reset between clips)
    4. Single audio bed, layered in post (no music baked into generation)
    5. End card clip gets typography exception (only place text on screen is allowed)
    6. 4x4 grid scenes need heavy "upper-center, fixed position" lock + anti-contact-sheet negatives
    7. Cost: ~$3.66-5.41 per 1:45 video (1 ref + 7 storyboards + 7 motions)
  - NEW triggers: competition submission, lomba AI video, Kreafest, public safety video, Polda Jatim, AI for public safety, Indonesian public service, 16 Putaran, social impact video, grid fate video, split fate video, multi-clip storyboard, narrative split video
  - Validated end-to-end on KreafestPoldaJatim 2026 "16 Putaran" — full prompt stack pushed to user Notion in single session

- **1.3.0** (2026-06-11) — Koda + Ivanna pattern adoption
  - NEW: `references/koda-ivanna-patterns-2026-06.md` — 4 patterns reverse-engineered from published prompts
    1. **Director Strip 7-Track augmented** — pin RHYTHM/ESCALATION vocab to Koda's published 9 verbs / 3 block sizes / 5 beat types / 5 escalation levels / 6 curves; Panel Header format `P## / {lens}mm {shot_type} / {beat_name}` lives OUTSIDE the image (storyboard purity rule)
    2. **Spatial Continuity Lock** — new `[SPATIAL CONTINUITY LOCK]` section in storyboard template, sits between IDENTITY CONSISTENCY and STORYBOARD PURITY. Lists panels sharing world-space, anchor geography, panels-that-look-new-but-aren't, and explicit ALLOWED/FORBIDDEN changes between locked panels
    3. **HARD CUT marker** — every shot in motion prompt ends with `(HARD CUT)`; final shot gets `(HARD CUT TO BLACK)` or `(MATCH CUT TO {next})` to fence the sequence end and prevent Seedance dissolving shots together
    4. **NEGATIVE PROMPT block** — comprehensive anti-pattern list (static grid, split-screen, contact sheet, picture-in-picture, plastic/waxy skin, extra fingers, etc.) added to motion prompt template; style-specific overrides (e.g. `western realism, photoreal face, deep shadow` for anime)
  - These 4 patterns generalize beyond Seedance 2.0 — Veo 3.1 Lite and Kling 3.0 have the same multi-shot dissolve + geometry flip + contact-sheet hallucination failure modes. Apply to all 3 model families in our pipeline.
  - Source verification: Koda "The Wind Calls" tweet 2065389969430954445; Ivanna haute cuisine b-roll tweets 2064182754560934025 + 2064182757845020941; Ivanna Renaissance Grand Prix 2063824412038639972

- **1.2.0** (2026-06-07) — Edge cases & safety
  - **FIX #1**: Pipeline auto-detect human + product (run both refs in parallel, default to both for FMCG/UGC)
  - **FIX #2**: Calm UGC vocabulary — 6 new RHYTHM energy words (settle/breathe/soft land/ease/drift/float), 2 new block lengths (micro/macro), 4 new beat types (gentle/rest/drift/breath) + calm Valence/Arousal templates
  - **FIX #3**: Pregnancy safety auto-template — detects bumil/hamil/pregnant keywords, auto-injects 10-point safety checklist into CONSTRAINTS + 4 motion-prompt overrides + medical disclaimer
  - **FIX #4**: 4th product variant `in-use` (product being actively used) — separate from lifestyle (static in setting) + auto-detection logic from usage verbs
  - Future expansion placeholders: pet safety, child safety, medical claims, financial claims
  - NEW triggers: analyze video, reverse engineer, competitor analysis, pregnancy safe, maternal content, bumil, hamil, in-use shot, calm UGC, soft pacing, human plus product
- **1.1.0** (2026-06-07) — Cinematic composition vocabulary
  - NEW: `references/cinematic-composition-vocabulary.md` (19 styles + texture pack + base style)
  - NEW: `commands/cinematic-variations.md` (`/s2s cinematic-variations` — 10-composition sweep)
  - UPDATED: `seedance-motion-prompt.md` — added imperfect realism texture pack + cinematic negatives
  - UPDATED: `commands/character-ref.md` + `product-ref.md` — added cinematic-composition-vocabulary references
  - UPDATED: `tests/test-cases.md` — added TC6 for cinematic-variations
  - NEW triggers: cinematic composition, cinematic variations, 10 compositions, pre-visualization, film still, cinematic realism

- **1.0.0** (2026-06-07) — Initial release
  - 3-step procedural workflow
  - 5 slash commands (storyboard, character-ref, product-ref, motion, pipeline)
  - 6 reference files (template + 3 ref + motion + director-strip + worked-example)
  - 5 manual test cases
  - Source attribution anonymized per Arga's instruction (no personal names in skill/file naming)

---

## License

MIT — see [LICENSE](LICENSE) file. Anonymized methodology — no creator attribution in skill naming or frontmatter description.
