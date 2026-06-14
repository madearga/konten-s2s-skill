---
name: storyboard-to-seedance-suite
description: "3-step procedural workflow for AI video production: (1) GPT Image 2 storyboard prompt using 12-Section template, (2) GPT Image 2 character OR product reference prompt (separate commands), (3) Seedance 2.0 motion prompt. Slash commands: /s2s storyboard, /s2s character-ref, /s2s product-ref, /s2s motion, /s2s pipeline. Use when creating storyboards for video, generating reference images for consistency, or building motion prompts for Seedance-class models."
version: 1.3.0
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
---

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

## Pitfalls (Top 5 Mistakes to Avoid)

1. **Treating storyboard image as the signal** — the image is documentation. The text in the motion prompt (director strip + panel beats) is the contract. Always include the text, not just the image attachment.

2. **Skipping reference image generation** — without `@[character ref]` or `@[product ref]`, Seedance hallucinates faces/environments. Always generate the ref.

3. **One-axis emotion ("make it playful")** — collapses to flat mood. Always split into Valence + Arousal in the motion prompt.

4. **Music baked into generation** — locks pacing, makes re-edits hard. Default to silent + diegetic foley. Add music in post (CapCut, DaVinci).

5. **Forgetting screen direction in location** — without explicit screen direction (window left, oven right), Seedance flips geometry between shots. Always include screen direction in LOCATION.

6. **Attachment ambiguity** — if multiple files are attached but roles are unspecified, camera/style/action signals bleed into each other. Bind each attachment to a single job.

7. **Using the wrong mode for existing-video tasks** — extend/edit/fuse requests should keep the same 5-part spine, but switch Step 3 language to the correct mode.

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
│   ├── cinematic-composition-vocabulary.md  # 19 cinematic styles + texture pack
│   └── banana-bread-worked-example.md # anonymized real-world case study
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
- **Easy rollback** — `install.sh --remove` cleans up

### Why this works (format compatibility)

| Field | Hermes | Claude Code | OpenCode | Codex |
|-------|--------|-------------|----------|-------|
| `name` | required | required | required | required |
| `description` | required (auto-trigger) | required (auto-trigger) | required (auto-trigger) | required (auto-trigger) |
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
  - **FIX #2**: Calm UGC vocabulary — 6 new RHYTHM energy words (settle/breathe/soft land/ease/drift/float), 2 new block lengths (micro/macro), 4 new beat types (gentle/rest/drift/breath) + calm Valence/Arousal templates
  - **FIX #3**: Pregnancy safety auto-template — detects bumil/hamil/pregnant keywords, auto-injects 10-point safety checklist into CONSTRAINTS + 4 motion-prompt overrides + medical disclaimer
  - **FIX #4**: 4th product variant `in-use` (product being actively used) — separate from lifestyle (static in setting) + auto-detection logic from usage verbs
  - Future expansion placeholders: pet safety, child safety, medical claims, financial claims
  - NEW triggers: analyze video, reverse engineer, competitor analysis, pregnancy safe, maternal content, bumil, hamil, in-use shot, calm UGC, soft pacing, human plus product
- **1.1.0** (2026-06-07) — Cinematic composition vocabulary
  - NEW: `references/cinematic-composition-vocabulary.md` (19 styles + texture pack + base style)
  - NEW: `commands/cinematic-variations.md` (`/s2s cinematic-variations` — 10-composition sweep)
  - UPDATED: `seedance-motion-prompt.md` — added imperfect realism texture pack + cinematic negatives
  - UPDATED: `commands/storyboard.md` — added cinematic-variations as optional pre-step
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
