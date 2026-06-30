# storyboard-to-seedance-suite

A **3-step procedural workflow** for AI video production. Turns a brief into three copy-paste-ready prompts (storyboard, reference image, motion) for **Seedance 2.0** + **GPT Image 2**.

v1.3.0 adds a **non-breaking Step 3 enhancement layer**:
- optional **asset-role binding** (`@`-style attachment roles)
- optional **pattern modes** for extend/edit/fuse/beat-sync/dialogue/one-take tasks

## What's new in v1.3.0

- keep the existing **storyboard → ref → motion** pipeline unchanged
- add optional **asset-role binding** for mixed attachments
- add optional Step 3 **mode overrides** for existing-video scenarios
- ship the repo with all referenced local companion docs intact

## What it does

```
Brief (free text)
   ↓
Step 1: Storyboard     → 12-section GPT Image 2 prompt → storyboard.png
Step 2: Reference      → 3-angle character sheet OR 3-variant product ref → character.png / product.png
Step 3: Motion         → 5-part spine Seedance 2.0 prompt → video.mp4 (8-15s)
   ↓
Bundle file: 3 prompts + QC summary, ~$0.54-0.89 per video
```

Also supports the reverse direction:

```text
Existing video → /s2s analyze → reverse-engineered brief/prompt → optional /s2s pipeline
```

## Slash commands

| Command | Step | When to use |
|---------|------|-------------|
| `/s2s help` | guide | Explain commands + route to the right capability |
| `/s2s storyboard` | 1 | Need storyboard image |
| `/s2s character-ref` | 2a | Human in video, need identity sheet |
| `/s2s product-ref` | 2b | Product in video (FMCG, beauty, etc.) |
| `/s2s motion` | 3 | Have storyboard + reference, need motion prompt |
| `/s2s pipeline` | 1+2+3 | Have brief, want full workflow |
| `/s2s cinematic-variations` | pre | Explore 10 composition options first |
| `/s2s analyze` | 0 | Reverse-engineer existing video into prompts |
| `/s2s ads` | ad | Product/brand/UGC/e-commerce ad prompt |
| `/s2s troubleshoot` | repair | Diagnose failed output + one-variable retake repair |
| `/s2s vo-v3` | audio | ElevenLabs v3 plain-text VO script with `[tags]` |
| `/s2s bundle` | package | Combine artifacts into one deliverable |

Notes:
- `/s2s motion` is still the only Step 3 command
- extend/edit/fuse/beat-sync/dialogue/one-take are **modes**, not new commands

## Cross-platform install

The same `SKILL.md` works in **Hermes Agent**, **Claude Code**, **OpenCode**, **Codex CLI**, and **Pi** — they all share the SKILL.md standard.

```bash
# From the suite directory (auto-detects its own location as canonical):
git clone https://github.com/madearga/konten-s2s-skill.git
cd konten-s2s-skill
./install.sh            # links skill bundle + slash commands into all platforms
./install.sh --check    # verify install status
./install.sh --remove   # remove all symlinks (keeps canonical source)
```

### What gets linked

| Target | Path | Purpose |
|---|---|---|
| Skill bundle (all platforms) | `~/.{claude,opencode,codex,pi}/skills/<name>` | SKILL.md + references/ + commands/ |
| Pi slash commands | `~/.pi/agent/prompts/s2s-*.md` | `/s2s-*` in pi autocomplete |
| OpenCode slash commands | `~/.config/opencode/command/s2s-*.md` | `/s2s-*` in opencode slash menu |

### Platform notes

- **Hermes / Claude Code / Cursor / Codex** — auto-discover `commands/*.md`, so `/s2s <capability>` works natively.
- **Pi** — does NOT auto-discover `commands/`. The `slash-commands/` folder provides portable `/s2s-*` wrappers (filename = command). Load the full skill via `/skill:storyboard-to-seedance-suite`.
- **OpenCode** — does NOT auto-discover `commands/`. Same portable wrappers are linked into `~/.config/opencode/command/`.

Why symlinks? **One source of truth.** Edit SKILL.md or commands/ once → every platform sees the update. No drift. The `slash-commands/` wrappers reference the skill by name (not hardcoded paths), so they work on any machine that ran `install.sh`.

## File structure

```
storyboard-to-seedance-suite/
├── SKILL.md                          # entry point (frontmatter + body)
├── install.sh                        # cross-platform symlink installer
├── README.md                         # this file
├── LICENSE                           # MIT
├── references/
│   ├── storyboard-prompt-template.md  # 12-Section fill-in template
│   ├── character-ref-prompt.md        # 3-angle character sheet template
│   ├── product-ref-prompt.md          # 3 variants: hero, multi-angle, lifestyle
│   ├── seedance-motion-prompt.md      # 5-part spine + worked example
│   ├── seedance-2-best-practices-2026.md # broader local Seedance companion
│   ├── seedance-asset-binding.md      # optional attachment role system
│   ├── seedance-best-practices.md     # concise general prompt guidance
│   ├── seedance-pattern-library.md    # optional extend/edit/fuse/dialogue/beat-sync modes
│   ├── director-strip-7-track.md      # RHYTHM + ESCALATION vocabulary
│   ├── banana-bread-worked-example.md # anonymized real-world case study
│   ├── cinematic-composition-vocabulary.md # 19 composition styles + textures
│   ├── tiktok-analyzer-system-prompt.md # reverse-engineering companion note
│   └── video-analysis-template.md     # reverse-engineering template
├── commands/
│   ├── help.md                        # /s2s help
│   ├── storyboard.md                  # /s2s storyboard
│   ├── character-ref.md               # /s2s character-ref
│   ├── product-ref.md                 # /s2s product-ref
│   ├── motion.md                      # /s2s motion
│   ├── pipeline.md                    # /s2s pipeline (master)
│   ├── cinematic-variations.md        # /s2s cinematic-variations
│   ├── analyze.md                     # /s2s analyze
│   └── ... (ads, bundle, compose-pattern, hook, interview, troubleshoot)
├── slash-commands/                    # portable /s2s-* wrappers (pi + opencode)
│   ├── s2s-storyboard.md
│   ├── s2s-ads.md
│   └── ... (one per capability; symlinked into ~/.pi/agent/prompts and ~/.config/opencode/command)
└── tests/
    └── test-cases.md                  # 7 grouped test cases (TC1-TC7)
```

## Cost & time

| Step | Model | Cost | Time |
|------|-------|------|------|
| 1. Storyboard prompt | (skill, no API) | free | 5 min |
| 1. GPT Image 2 gen | GPT Image 2 | $0.07 | 30s |
| 2. Ref prompt | (skill, no API) | free | 2-5 min |
| 2. GPT Image 2 gen | GPT Image 2 | $0.07 | 30s |
| 3. Motion prompt | (skill, no API) | free | 5 min |
| 3. Seedance gen | Seedance 2.0 | $0.40-0.75 | 2-3 min |
| **Total per video** | | **~$0.54-0.89** | **~15-20 min** |

For 100 ads batch: ~$54-89 at Fast tier.

## Quick start

```bash
# 1. Install (one time)
git clone https://github.com/madearga/konten-s2s-skill.git
cd konten-s2s-skill
./install.sh

# 2. Use (in your agent of choice)
# Hermes:      /s2s help
# Hermes:      /s2s pipeline Indonesian girl in kitchen making banana bread, 15s
# Claude Code: "use storyboard-to-seedance-suite to make a banana bread video"
# OpenCode:    same as Claude Code — natural language trigger
# Reverse:     /s2s analyze competitor-video.mp4
```

## Optional Step 3 power-ups

These are additive. Ignore them if you only want the standard flow.

- **Asset-role binding** — specify what each attachment controls
  - identity
  - product continuity
  - camera behavior
  - action choreography
  - FX grammar
  - rhythm / BGM
- **Pattern modes** — switch Step 3 wording for:
  - extend
  - edit
  - fuse
  - beat-sync
  - dialogue
  - one-take

## Pitfalls (top 7)

1. **Storyboard image is documentation, not the signal** — copy director strip text + panel beats into the motion prompt (the image downsamples to ~30px/panel, unreadable)
2. **Skip reference image = hallucinated faces/environments** — always generate the @[character ref] or @[product ref]
3. **One-axis emotion ("playful") = flat mood** — split into Valence + Arousal
4. **Music baked into generation = locked pacing** — default to silent + diegetic foley, add music in post
5. **Forgetting screen direction in location** — Seedance flips geometry between shots without explicit screen direction
6. **Many attachments with no role labels** — explicitly bind first-frame / camera / action / rhythm assets when using mixed media
7. **Using new-generation wording for edit/extend/fuse tasks** — switch Step 3 to the right pattern mode

## New optional references in v1.3.0

- `references/seedance-2-best-practices-2026.md` — broader local Seedance companion for this repo
- `references/seedance-asset-binding.md` — learn how to assign one clear job to each attachment
- `references/seedance-best-practices.md` — concise general prompt guidance
- `references/seedance-pattern-library.md` — adapt the same motion step for extend/edit/fuse/beat-sync/dialogue/one-take requests
- `references/tiktok-analyzer-system-prompt.md` — reverse-engineering companion for competitor analysis

## Anonymization

Source methodology is anonymized. No creator handles, personal names, or brand attribution in skill naming, file names, or frontmatter. The worked example references "a verified creative technologist" without naming the source.

## License

MIT — see [LICENSE](LICENSE).
