# storyboard-to-seedance-suite

A **3-step procedural workflow** for AI video production. Turns a brief into three copy-paste-ready prompts (storyboard, reference image, motion) for **Seedance 2.0** + **GPT Image 2**.

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

## Slash commands (5)

| Command | Step | When to use |
|---------|------|-------------|
| `/s2s storyboard` | 1 | Need storyboard image |
| `/s2s character-ref` | 2a | Human in video, need identity sheet |
| `/s2s product-ref` | 2b | Product in video (FMCG, beauty, etc.) |
| `/s2s motion` | 3 | Have storyboard + reference, need motion prompt |
| `/s2s pipeline` | 1+2+3 | Have brief, want full workflow |

## Cross-platform install

The same `SKILL.md` works in **Hermes Agent**, **Claude Code**, **OpenCode**, and **Codex CLI** — they all share the SKILL.md standard.

```bash
# From the suite directory:
./install.sh            # creates symlinks in ~/.claude/skills/, ~/.opencode/skills/, ~/.codex/skills/
./install.sh --check    # verify install status
./install.sh --remove   # remove symlinks (keeps canonical source)
```

Why symlinks? **One source of truth.** Edit SKILL.md once → all platforms see the update. No drift.

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
│   ├── director-strip-7-track.md      # RHYTHM + ESCALATION vocabulary
│   └── banana-bread-worked-example.md # anonymized real-world case study
├── commands/
│   ├── storyboard.md                  # /s2s storyboard
│   ├── character-ref.md               # /s2s character-ref
│   ├── product-ref.md                 # /s2s product-ref
│   ├── motion.md                      # /s2s motion
│   └── pipeline.md                    # /s2s pipeline (master)
└── tests/
    └── test-cases.md                  # 5 test cases (TC1-TC5)
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
git clone https://github.com/madearga/storyboard-to-seedance-suite.git
cd storyboard-to-seedance-suite
./install.sh

# 2. Use (in your agent of choice)
# Hermes:      /s2s pipeline Indonesian girl in kitchen making banana bread, 15s
# Claude Code: "use storyboard-to-seedance-suite to make a banana bread video"
# OpenCode:    same as Claude Code — natural language trigger
```

## Pitfalls (top 5)

1. **Storyboard image is documentation, not the signal** — copy director strip text + panel beats into the motion prompt (the image downsamples to ~30px/panel, unreadable)
2. **Skip reference image = hallucinated faces/environments** — always generate the @[character ref] or @[product ref]
3. **One-axis emotion ("playful") = flat mood** — split into Valence + Arousal
4. **Music baked into generation = locked pacing** — default to silent + diegetic foley, add music in post
5. **Forgetting screen direction in location** — Seedance flips geometry between shots without explicit screen direction

## Anonymization

Source methodology is anonymized. No creator handles, personal names, or brand attribution in skill naming, file names, or frontmatter. The worked example references "a verified creative technologist" without naming the source.

## License

MIT — see [LICENSE](LICENSE).
