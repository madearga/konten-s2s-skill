# Companion: kuka-worldbuilder

`/s2s worldbuild` is a thin routing command. The actual worldbuilding work — poetic world name, 2-3 sentence world concept, and 9 cinematic still-image prompts (Inhabitants, Animals, Architecture, Landscapes, Daily Life, Travel or Motion, Sound or Culture, Power or Intensity, Portrait) — is performed by the **kuka-worldbuilder** skill, a separate Hermes Agent skill that lives in the local skills library.

## Why a companion skill, not built into s2s

s2s is a **motion pipeline** — its outputs feed into Seedance / Veo / Kling video generation. The 9-aspect worldbuilding process is a **still-image pre-step** that lives one level upstream: it produces a world bible that *other* s2s commands (storyboard, character-ref, motion) can later pull from. Keeping it as a separate skill means:

- worldbuilding stays usable on its own (pitch decks, moodboards, world bibles) without forcing a video commitment
- s2s stays focused on the motion pipeline, no scope creep
- the worldbuilding skill can evolve independently of the video stack

## Install

kuka-worldbuilder is a single-file SKILL.md, no dependencies, MIT licensed.

**Hermes Agent (default install):**

```bash
mkdir -p ~/.hermes/skills/kuka-worldbuilder
# then drop the SKILL.md into that directory
```

**Cross-platform** (Claude Code, OpenCode, Codex CLI, Pi) — same file works, just point the platform's skills directory at it:

- `~/.claude/skills/kuka-worldbuilder/SKILL.md`
- `~/.config/opencode/skill/kuka-worldbuilder/SKILL.md`
- `~/.codex/skills/kuka-worldbuilder/SKILL.md`
- `~/.pi/agent/skills/kuka-worldbuilder/SKILL.md`

## When the skill is missing

If `/s2s worldbuild` runs and `kuka-worldbuilder` is not in the local skills library, the command does **not** fail. It prints the install hint above and asks the user to install the skill, or to fall back to a one-shot manual worldbuilding output.

## Output contract

The skill returns 9 aspects in a fixed order, each with:
- a one-sentence **World-Building Note** that captures the visual purpose of the aspect
- a full **cinematic visual prompt** — one paragraph covering subject placement, environment, body covering, materials, lighting, weather, camera distance, and cinematic realism

Every visual prompt ends with the standard negative add-on:

```
no clean digital sharpness, no CGI look, no poster composition, no centered portrait, no black bars
```

`/s2s worldbuild` wraps this output verbatim and appends a hand-off block pointing to `/s2s storyboard` and `/s2s motion`. No transformation, no reformatting.

## Pipeline position

```
/s2s worldbuild  →  /s2s storyboard (per chosen aspect)  →  /s2s character-ref  →  /s2s motion
       │                    │                                    │                  │
   kuka-worldbuilder    s2s                s2s                  s2s
   (companion skill)
```

`/s2s worldbuild` is upstream only. It never runs after storyboard/character-ref/motion — those have already locked a scene, and worldbuilding is the thing that comes *before* the lock.

## License

kuka-worldbuilder: MIT. Compatible with s2s MIT license.
