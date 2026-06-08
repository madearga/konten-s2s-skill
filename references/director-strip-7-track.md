# Director Strip — 7-Track Animatic Board Vocabulary

The 7-track director strip is the **control surface** for the Seedance 2.0 motion prompt. Each track answers a different question about the panel. The **text in these tracks** (not the storyboard image) is the actual signal Seedance uses.

---

## Track Definitions

| # | Track | Format | What It Does |
|---|-------|--------|--------------|
| 1 | **BEAT LINE** | One-word labels per panel | Pure narrative (smile, mash, oven) |
| 2 | **CAMERA PATH** | Shot chips, thin lines | Visual camera movement markers |
| 3 | **ACTION PATH** | Thin lines + 1-3 word labels | Physical body movement |
| 4 | **RHYTHM TRACK** | Bracket syntax (see below) | Musical/pacing direction |
| 5 | **ESCALATION MAP** | Bracket syntax (see below) | Emotional intensity L1-L5 |
| 6 | **STATE TRACK** | One-phrase state per panel | Prop/condition changes |
| 7 | **STYLE TRACK** | 1-3 word visual signature | Visual anchor |

---

## RHYTHM TRACK Format (CRITICAL)

**Always use the brackets.** GPT Image interprets the option list as the legal vocabulary. Without brackets, the model invents ad-hoc terms.

```
RHY P##: [hold|slow reveal|build|burst|impact|pause|recover|final hit|settle|breathe|soft land|ease|drift|float] /
         [short block|medium block|long block|micro block|macro block] /
         [clean beat|match beat|smash beat|held beat|whip beat|gentle beat|rest beat|drift beat|breath beat]
```

### Three-Slot Vocabulary

**Slot 1 — Energy direction (pick one):**
- `hold` — sustain, no change
- `slow reveal` — gradual emergence
- `build` — gradual increase
- `burst` — sudden spike
- `impact` — collision/landing
- `pause` — silence/breath
- `recover` — come back from impact
- `final hit` — climax marker
- **`settle`** *(v1.2.0, calm UGC)* — calm descent, return to baseline
- **`breathe`** *(v1.2.0, calm UGC)* — natural pause, organic rhythm
- **`soft land`** *(v1.2.0, calm UGC)* — gentle finish, cushioned, no jolt
- **`ease`** *(v1.2.0, calm UGC)* — slow release, no tension
- **`drift`** *(v1.2.0, calm UGC)* — float-like, unfocused movement
- **`float`** *(v1.2.0, calm UGC)* — suspended, weightless, contemplative

**Slot 2 — Block length (pick one):**
- `short block` — quick, ~0.3-0.5s
- `medium block` — ~0.6-1.0s
- `long block` — ~1.0-1.5s
- **`micro block`** *(v1.2.0, calm UGC)* — ~0.1-0.3s (subliminal, breathing room)
- **`macro block`** *(v1.2.0, calm UGC)* — ~1.5-2.5s (long holds, slow build)

**Slot 3 — Beat type (pick one):**
- `clean beat` — distinct, separable
- `match beat` — matches action cut
- `smash beat` — overlapping, chaotic
- `held beat` — sustained through transition
- `whip beat` — fast whip-pan energy
- **`gentle beat`** *(v1.2.0, calm UGC)* — soft, no impact, no punctuation
- **`rest beat`** *(v1.2.0, calm UGC)* — full stop, no motion, no sound
- **`drift beat`** *(v1.2.0, calm UGC)* — continuous, no punctuation, ambient
- **`breath beat`** *(v1.2.0, calm UGC)* — natural rhythm, organic, no sync

### Examples (high-energy — default)

```
RHY P01: burst / short block / clean beat
RHY P07: pause / medium block / held beat
RHY P15: final hit / long block / held beat
RHY P03: slow reveal / medium block / match beat
RHY P10: build / short block / whip beat
```

### Examples (calm UGC — v1.2.0)

```
RHY P01: slow reveal / micro block / gentle beat
RHY P03: settle / long block / breath beat
RHY P07: breathe / medium block / drift beat
RHY P10: ease / macro block / rest beat
RHY P15: soft land / long block / held beat
RHY P20: float / macro block / gentle beat
```

---

## ESCALATION MAP Format (CRITICAL)

Emotional intensity curve. **L1 = resting state, L5 = climax.** Map to music drop in post.

```
ESC P##: [L1 calm|L2 tension|L3 rise|L4 surge|L5 peak] /
         [flat|rise|spike|drop|release|unresolved]
```

### Two-Slot Vocabulary

**Slot 1 — Intensity level (pick one):**
- `L1 calm` — neutral baseline
- `L2 tension` — anticipation, slight unease
- `L3 rise` — building energy
- `L4 surge` — strong, near-climax
- `L5 peak` — climax

**Slot 2 — Curve direction (pick one):**
- `flat` — sustained level
- `rise` — climbing
- `spike` — sharp jump
- `drop` — sudden decrease
- `release` — let go
- `unresolved` — no closure (use for loops)

### Examples

```
ESC P01: L3 rise / spike   (hook)
ESC P02: L1 calm / flat    (master shot settles)
ESC P07: L2 tension / rise (anticipation)
ESC P10: L3 rise / spike   (action builds)
ESC P15: L5 peak / release (loaf reveal climax)
ESC P16: L4 surge / release (slice finale)
ESC P14: L4 surge / unresolved  (loop endpoint = same as P01)
```

---

## How to Use the Tracks Together

Each track answers a question:

- **BEAT LINE** → What is the narrative beat? (smile, mash, oven, reveal)
- **CAMERA PATH** → How is the camera moving? (push-in, static, track, whip)
- **ACTION PATH** → What is the body doing? (step, lift, peel, fold)
- **RHYTHM TRACK** → How long is this shot and how does it land? (burst/short/clean, etc.)
- **ESCALATION MAP** → How intense is the emotion right now? (L1-L5 + curve)
- **STATE TRACK** → What prop is in what state? (whole banana, peeled banana, mashed banana)
- **STYLE TRACK** → What's the visual signature? (smile chip, crumb macro, steam wisp)

**Together, the 7 tracks tell Seedance exactly what to do for every panel, second, and beat.**

---

## Worked Example (Banana Bread Sequence)

| P## | BEAT | CAMERA | ACTION | RHYTHM | ESCALATION | STATE | STYLE |
|-----|------|--------|--------|--------|------------|-------|-------|
| P01 | Kiss approach | Push-in | Walk + kiss | burst / short / clean | L3 rise / spike | Whole banana on counter | smile chip |
| P02 | Kitchen master | Static wide | Stand at counter | hold / long / held | L1 calm / flat | Same banana visible | wide anchor |
| P03 | Banana lift | Handheld | Lift banana | slow reveal / medium / match | L2 tension / rise | Banana in hand | focus beat |
| P04 | Banana peel | Overhead 35mm | Peel in ribbon | burst / short / smash | L3 rise / spike | Peeled banana + ribbon | overhead macro |
| P05 | Mash | Static close | Mash with fork | build / medium / clean | L3 rise / flat | Mashed banana | texture close |
| P06 | Egg crack | Macro insert | One-hand crack | burst / short / clean | L4 surge / spike | Egg cracked into bowl | wet snap |
| P07 | Fold | Static medium | Fold batter | build / medium / held | L3 rise / rise | Batter mixed | flow gesture |
| P08 | Pan slide | Medium | Slide into oven | impact / medium / held | L3 rise / rise | Pan in oven | oven open |
| P09 | Oven slide | Track right | Pan goes deep | build / short / whip | L2 tension / rise | Pan deeper | heat sizzle |
| P10 | Timer glance | Static | Look at timer | hold / short / clean | L2 tension / flat | Timer running | reaction chip |
| P11 | Wait | Static medium | Slight hip shift | pause / medium / held | L1 calm / flat | Same scene | silence beat |
| P12 | Loaf reveal | Handheld | Pull out loaf | burst / long / held | L5 peak / release | Golden loaf + steam | steam wisp |
| P13 | Setup slice | Medium | Set on board | slow reveal / medium / clean | L4 surge / flat | Loaf on board | kitchen anchor |
| P14 | Slice cut | 85mm tight | Cut first slice | impact / short / held | L4 surge / spike | First slice cut | crumb macro |
| P15 | Lift slice | Counter 50mm | Lift to camera | final hit / long / held | L5 peak / release | Slice held up | showcase chip |
| P16 | Slice finale | Macro insert | Pull slice, crumbs | burst / short / smash | L4 surge / release | Crumbs scattered | crumb finale |

---

## Panel Beat Format (For Motion Prompt)

Each panel becomes ONE line in the motion prompt's PANEL BEATS section:

```
P##: [shot description with motion + camera move + foley]. [emotional beat]. [audio cue].
```

**Example:**
```
P04: Overhead 35mm, C1 peels banana in a single long ribbon into bowl. Tactile beat. Peel snap.
```

**Structure:**
- Shot description (camera + framing)
- Motion (what the body does)
- Foley (what we hear)
- Emotional beat (the feeling)
- Audio cue (the sound trigger)

---

## Quick-Reference Copy-Paste

```
RHYTHM TRACK
- hold / slow reveal / build / burst / impact / pause / recover / final hit
- short block / medium block / long block
- clean beat / match beat / smash beat / held beat / whip beat

ESCALATION MAP
- L1 calm / L2 tension / L3 rise / L4 surge / L5 peak
- flat / rise / spike / drop / release / unresolved

PANEL HEADER
- P## / [focal length]mm [shot type] / [beat name]

PANEL BEAT
- P##: [shot + motion + foley]. [emotional beat]. [audio cue].
```

---

## Why This Works

**The storyboard image is documentation. The text is the contract.**

When the storyboard image is uploaded to Seedance, it gets downsampled to ~30px per panel — essentially unreadable. GPT Image 2 may render the storyboard visually nicely, but Seedance doesn't actually parse those tiny panels.

What Seedance DOES parse:
- The `@[storyboard ref]` and `@[character ref]` attachments (high-level visual anchors)
- The text in your motion prompt (the actual control signal)

So the **director strip text + panel beats in the motion prompt are what really drive the video.** The storyboard image is for:
- Human handoff (showing the editor the visual plan)
- Iteration review (comparing what was intended vs. what came out)
- Prompt review (sanity-checking before sending to Seedance)

Don't skip writing the panel beats. The storyboard image alone won't carry the video.

---

## Related References

- `references/storyboard-prompt-template.md` — where these tracks live in the 12-section structure
- `references/seedance-motion-prompt.md` — how tracks become PANEL BEATS
- `references/banana-bread-worked-example.md` — full worked example with all 7 tracks filled
