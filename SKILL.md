---
name: storyboard-to-seedance-suite
description: "3-step procedural workflow for AI video production: (1) GPT Image 2 storyboard prompt using 12-Section template, (2) GPT Image 2 character OR product reference prompt (separate commands), (3) Seedance 2.0 motion prompt. Slash commands: /s2s storyboard, /s2s character-ref, /s2s product-ref, /s2s motion, /s2s pipeline. Use when creating storyboards for video, generating reference images for consistency, or building motion prompts for Seedance-class models."
version: 1.0.0
author: Hermes Agent
license: Internal
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
  - "character sheet"
  - "product sheet"
  - "product reference"
  - "character reference"
  - "buat storyboard"
  - "bikinin prompt video"
  - "bikin video AI"
  - "AI video pipeline"
  - "Seedance 2.0 prompt"
---

# storyboard-to-seedance-suite

A **3-step procedural skill** for AI video production. Turns a brief into three copy-paste-ready prompts (storyboard, reference, motion), with checkpoints for review and a master pipeline command for end-to-end runs.

Part of the `ai-video-production` umbrella skill. Tuned for **Seedance 2.0** as the video generator, with template structure generic enough to adapt to other Seedance-class models.

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

**Do NOT use for:**
- First+Last frame simple videos (use `ai-video-production` section 2.7 instead)
- Real human face videos (Seedance face-blocks — use Kling 3.0)
- 60-second continuous shots (split into 4-6 short clips)

---

## The 3 Steps (Overview)

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

## Quick Start

One-liner for the full workflow:

```
/s2s pipeline Indonesian girl in kitchen making banana bread, 15s, high-rhythm smash cuts
```

The skill will:
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
| `/s2s storyboard` | 1 | Need storyboard image | 12-section prompt → storyboard.png |
| `/s2s character-ref` | 2a | Human in video | 3-angle sheet → character.png |
| `/s2s product-ref` | 2b | Product in video | 3 variants → product.png |
| `/s2s motion` | 3 | Have storyboard + ref, need motion prompt | 5-part spine → video.mp4 |
| `/s2s pipeline` | 1+2+3 | Have brief, want full workflow | All 3 prompts + bundle |

Each subcommand has a dedicated spec in `commands/`. The pipeline command chains them with checkpoints.

---

## Decision Tree (Which Command to Use)

```
User Intent Detected
   ↓
Q: Has brief for single video?
├─ YES → /s2s pipeline  (master, runs all 3 steps)
│
└─ NO, has storyboard image already?
   ├─ YES → /s2s motion  (Step 3 only)
   │
   └─ NO, needs reference image first?
      ├─ Has human character?
      │  ├─ YES → /s2s character-ref  (Step 2a)
      │  └─ NO  → /s2s product-ref   (Step 2b)
      │
      └─ Just needs storyboard?
         └─ /s2s storyboard  (Step 1 only)
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
| Hermes | `/s2s pipeline <brief>` | Slash command parser reads `commands/*.md` |
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

- **1.0.0** (2026-06-07) — Initial release
  - 3-step procedural workflow
  - 5 slash commands (storyboard, character-ref, product-ref, motion, pipeline)
  - 6 reference files (template + 3 ref + motion + director-strip + worked-example)
  - 5 manual test cases
  - Source attribution anonymized per Arga's instruction (no personal names in skill/file naming)

---

## License

MIT — see [LICENSE](LICENSE) file. Anonymized methodology — no creator attribution in skill naming or frontmatter description.
