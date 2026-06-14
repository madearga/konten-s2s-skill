# Banana Bread Worked Example — 12-Section Storyboard + Director Strip

**Source:** A 2026-06-05 X thread by a verified creative technologist (originally posted on X, mid-2026)
**Video:** 2-clip sequence, 1920×2160 vertical, banana bread cooking montage + ravenous eating loop
**Engagement:** 207 likes / 143 bookmarks / 12 RTs / 10.9K views in ~24h
**Stack:** GPT Image 2 (character + 2 storyboards) → Seedance 2.0 (2 video generations)

---

## Why This Case Matters

The Banana Bread case is the most **structurally complete** public storyboard methodology for Seedance 2.0 as of June 2026. Compared to the Metamorphosis 4-step (section 2.9 of SKILL.md) and the 9-panel alternative method, this case introduces:

1. **12-section GPT Image 2 storyboard template** (vs. 9-panel bare grids)
2. **Director Strip 7-track animatic board** with explicit bracket options
3. **Emotional Guidance 2-axis** (Valence + Arousal)
4. **Master Shot Rule + Spatial Continuity Lock** (anti-drift)
5. **Modular 2-storyboard strategy** for sequence + loop
6. **Audio strategy** — generate silent, mix in post
7. **Multiple cuts > continuous shot** for >1 minute edits

This is the most rigorous publicly-documented Seedance 2.0 workflow. Bookmark it.

---

## 5-Step Pipeline (Actual Workflow from the Source)

```
Step 1: GPT Image 2 → character reference (1 portrait)
Step 2: GPT Image 2 → storyboard #1 (16:9, 16 panels, 4×4 grid)
Step 3: Seedance 2.0 → video #1 (@[character ref] + @[storyboard ref])
Step 4: GPT Image 2 → storyboard #2 (16:9, 14 panels, 2×7 strip)
Step 5: Seedance 2.0 → video #2 (loop, same refs)
```

**Difference from Metamorphosis 4-step:** Two separate storyboards for two video outputs. Modular = independent re-rolls of each clip. Cost adds ~$0.07-0.10 for the second GPT Image 2.

**Cap reuse strategy:** If a storyboard fails, regenerate only that storyboard, not the character reference. Saves ~$0.10 per re-roll.

---

## 12-Section Storyboard Prompt Template

This is the actual structure used inside GPT Image 2. Fill-in-the-blank version in `storyboard-prompt-template.md`.

### 1. PROJECT CARD
- **TITLE** — short, punchy
- **META LINE** — one-line vibe (e.g., "warm kitchen / high-rhythm smash-cut food loop")
- **PRIORITY** — bullet list of must-haves (e.g., "readable banana bread process, tasteful flirtatious opening")
- **MICRO BRIEF** — 1-sentence story arc (e.g., "C1 turns banana bread prep into a compact kitchen dance, starting with a camera kiss and ending on a warm loaf reveal")

### 2. CONTINUITY HEADER
- **SEQUENCE ID** — unique tag (e.g., `BANANA-BREAD-KITCHEN-DANCE-16P`)
- **REFERENCE PRIORITY** — explicit split: "Provided image controls [X]; this storyboard controls [Y]"

### 3. SCENE PACKET
- **PREMISE** — what happens in plain prose
- **LOCATION** — geography with **screen direction** (window left, oven right, sink left)
- **START → END** — narrative arrow
- **ACTION CHAIN** — comma-separated beats (e.g., "camera approach → kiss toss → turn to counter → single banana peel")
- **PROP / EFFECT STATE** — full prop inventory including state changes
- **MUST READ** — tone/POV notes that override defaults (e.g., "sensuality is playful and tasteful, not explicit")

### 4. CHARACTER SANITIZATION
- Single paragraph defining C1
- Always include: age, hair, build, outfit, posture, movement quality
- Always close with: "Remove contradictory traits, invisible psychology, excessive costume detail, and backstory that cannot appear in a panel."

### 5. IDENTITY CONSISTENCY
- Restate what the character ref controls vs what storyboard controls
- Anti-modification list: "Do not redesign, age-shift, beautify, duplicate, merge, or add another character."

### 6. STORYBOARD PURITY (Critical)
- **Panel images:** visual-only low-detail monochrome light-gray rough sketches
- **Text/labels:** OUTSIDE panel, in header strip
- **Banned inside panels:** color, labels, arrows, captions, subtitles, logos, watermarks, timing marks, diagrams, UI, ghost poses, duplicate bodies, technical overlays

**This is the key gotcha.** The storyboard image is a low-res signal at panel level (each panel ends up ~30px when downsampled for video gen). Keep it visually clean. The real signal is the **text** that gets copy-pasted to Seedance.

### 7. MASTER SHOT RULE
- P02 (or P02-equivalent) **must show full playable geography**
- Defines spatial anchor: window left, island center, sink left, oven right
- All other panels reference this geography even when close-up

**Why this matters:** Without a master shot, Seedance hallucinates new locations. Drift protection.

### 8. EMOTIONAL ARC
- Arrow notation: "Playful invitation → focused groove → tactile cooking satisfaction → quick heat anticipation → proud reveal"
- Translation cue: "shown through camera distance, over-shoulder glances, shoulder rolls, hand precision, hip-step rhythm, careful oven handling, steam pause, and final slice pull."

### 9. STYLE LOCKS (Three Separate Locks)
- **STYLE LOCK** — visual style: "clean monochrome rough-sketch panels on off-white paper, light-gray gesture lines"
- **EFFECT LOCK** — effects inside panels: "flour dust, steam, crumbs, batter ribbons are simple monochrome shapes only"
- **ENVIRONMENT LOCK** — set dressing: "large window screen left, stone counter island foreground, teal cabinets rear/right"

### 10. SPATIAL CONTINUITY LOCK
- List which panels share the same kitchen layout
- Define allowed changes per panel: camera distance, height, pose, gaze, ingredient state, steam, crumb state, loaf position
- Define forbidden changes: new locations, redesigned rooms, prop teleportation

### 11. DIRECTOR STRIP (7 tracks — see below)
- Full animatic board
- Critical for getting rhythm right

### 12. SEQUENCE
- Final grid spec: "Grid: 16 panels in a compact 4×4 cinematic storyboard sheet"

---

## Director Strip — 7-Track Animatic Board

The most novel part of this method. Each track is a column-aligned visual chip strip.

### Track Definitions

| Track | Format | What It Does |
|-------|--------|--------------|
| **BEAT LINE** | One-word labels per panel | Pure narrative (smile, mash, oven) |
| **CAMERA PATH** | Shot chips, thin lines | Visual camera movement markers |
| **ACTION PATH** | Thin lines + 1-3 word labels | Physical body movement |
| **RHYTHM TRACK** | Bracket syntax (see below) | Musical/pacing direction |
| **ESCALATION MAP** | Bracket syntax (see below) | Emotional intensity L1-L5 |
| **STATE TRACK** | One-phrase state per panel | Prop/condition changes |
| **STYLE TRACK** | 1-3 word visual signature | Visual anchor (e.g., "smile chip", "crumb macro") |

### RHYTHM TRACK Format (CRITICAL)

```
RHY P##: [hold|slow reveal|build|burst|impact|pause|recover|final hit] /
         [short block|medium block|long block] /
         [clean beat|match beat|smash beat|held beat|whip beat]
```

**Always use the brackets.** GPT Image interprets the option list as the legal vocabulary. Without brackets, the model invents ad-hoc terms.

**Example from this case:**
- P01: burst / short block / clean beat
- P07: pause / medium block / held beat
- P15: final hit / long block / held beat

### ESCALATION MAP Format (CRITICAL)

```
ESC P##: [L1 calm|L2 tension|L3 rise|L4 surge|L5 peak] /
         [flat|rise|spike|drop|release|unresolved]
```

**Emotional intensity curve.** L1 = resting state, L5 = climax.

**Arc in the source case:**
- P01 ESC: L3 rise / spike (hook)
- P02 ESC: L1 calm / flat (master shot settles)
- P15 ESC: L5 peak / release (loaf reveal climax)
- P16 ESC: L4 surge / release (slice finale)

This is a **musical cue curve** for the editor. Map it to music drop in post.

---

## Emotional Guidance 2-Axis (Source's Innovation)

The source splits emotion into two axes for Seedance prompt:

**Valence** (positive/negative tone):
- "playful, warm, teasing, proud" *(high-energy default)*
- "playful, warm, ravenous, satisfied" *(loop version)*
- **"peaceful, content, settled, contemplative, soft, gentle"** *(v1.2.0, calm UGC)*
- **"serene, mindful, unhurried, present, restful"** *(v1.2.0, calm UGC)*

**Arousal** (intensity curve):
- "quick hook to steady groove, tactile prep surges, brief pause, satisfying release through body rhythm, over-shoulder glances, hand precision, steam, crumbs, and food texture" *(high-energy default)*
- "quick hook to steady groove, tactile prep surges, brief pause, satisfying release through body rhythm" *(loop version)*
- **"soft opening, gentle build, contemplative middle, peaceful resolution through stillness, breath, and natural pauses"** *(v1.2.0, calm UGC)*
- **"slow arrival, unhurried settling, sustained present-moment, soft landing through micro-gestures and breath"** *(v1.2.0, calm UGC)*

**Why two axes:** One-axis prompts ("make it playful") collapse to a single mood. Two-axis lets the model modulate **intensity over time** while holding tone. Result: a video that *breathes* instead of staying flat.

**Drop-in template for video prompt:**
```
EMOTIONAL GUIDANCE: Valence: [3-5 adjectives]. Arousal: [arc in arrow notation].
```

---

## Panel Header Convention (Cinematic Per-Panel Spec)

The source tags every panel in the storyboard with a triple header:

```
P## / [focal length]mm [shot type] / [beat name]
```

**Example from the sequence:**
- P01 / 35mm close / Kiss approach
- P02 / 24mm wide / Kitchen master
- P04 / overhead 35mm / Single banana peel
- P06 / macro insert / Egg crack
- P12 / 35mm track / Oven slide
- P13 / 85mm tight / Timer glance
- P15 / 50mm counter / Loaf reveal
- P16 / macro insert / Slice pull

**Why this works:** Gives the Seedance prompt a concrete per-panel camera plan. No more "dynamic camera" vagueness.

**Drop-in panel beat format for video prompt:**
```
P##: [shot description with motion + camera move + foley]. [emotional beat]. [audio cue].
```

Source example:
> P01: Handheld close as C1 steps toward camera, smiles, and blows a kiss; soft breath and fabric rustle.

---

## Storyboard Image: Weak Signal in Seedance (Technical Critique)

**Technical critic (verified X user) in reply thread 2062938222183809430:**
> "interesting thing that storyboard picture is way too dense and low dimensional for any model to really read it. it's like 30 pixels for the shot there. im not even talking about all the text rendered. but the fun part it doesnt matter. its never read by seedance. you can just skip this storyboard part and get the same result just from the prompt. yeah, I tested it."

**Original poster's reply 2062942422942761277:**
> "[Critic] It's because, seedance prompt is detailed. Storyboards have other advantages too. And It will be better in the next versions of Seedance. Check this one please." [link to improved version]

**Implication:**
- The **storyboard image** itself is a low-priority signal at panel resolution (~30px)
- The **director strip text + panel beats** are the actual control signal
- Storyboard image still useful for: human handoff to editors, iteration visual reference, prompt review
- When uploading to Seedance, **always include the director strip text + panel beats in the prompt**, not just the image

**Action update:** In section 2.9 of SKILL.md, the "Storyboard = visual guide, NOT frame-by-frame blueprint" note should be reinforced with this technical reality. The image is documentation. The text is the contract.

---

## Audio Strategy (Post-Production Rule)

From the source reply to tihomirVR (2062869501880717720) about extending to 1 minute:
> "I also recommend generating scenes without music first and adding the music during editing. That makes it much easier to adjust pacing, reorder shots and connect separate generations into a longer sequence without fighting the model's timing."

**Rules:**
- Generate scenes **silent** (or with diegetic audio only — foley, ambience, impacts)
- Add music in post (CapCut, DaVinci, Premiere)
- Lets you reorder shots to match beat changes
- Lets you swap music without re-generating

**For loopable clips:** The second storyboard explicitly bans "background music or score" and demands "diegetic ambience, foley, impacts, texture, and silence." This is why loops feel tactile — no competing music layer.

---

## Multiple Cuts > Continuous Shot (Anti-Pattern for Long Videos)

The source's reply on extending to 1 minute:
> "If you don't want to use the extend feature, I've often found it's better to reuse the same character and environment references rather than relying only on the last frame. The way you design the sequence matters too. I wouldn't think of the whole minute as one continuous shot. Breaking it into multiple cuts usually gives you much more flexibility while keeping consistency."

**Implications:**
- **Avoid extend feature** for >15s videos — last frame drift
- **Multiple short cuts** (4-8s each) > one long continuous
- Reuse `@[character ref]` + `@[environment ref]` across all cuts
- Re-rolls are cheaper per cut

**Update to SKILL.md section 2.10 (Iteration Strategy):** For >15s narratives, plan as 3-4 short clips, not 1 long clip. Total cost may be similar but success rate is much higher.

---

## Modular 2-Storyboard Strategy (Sequence + Loop)

The Banana Bread output is **two separate clips**:
1. **16-panel storyboard** → 12-15s cooking sequence (kiss → bake → reveal)
2. **14-panel storyboard** → 6-10s ravenous eating loop (face/mouth close-ups, smash cuts)

**Why two storyboards:**
- Different rhythm (sequence = build, loop = high-energy smash)
- Different framing (sequence = master + over-shoulder, loop = no master, close-ups only)
- Different panel counts (16 = narrative, 14 = loop)
- Independent re-roll (loop fails → only re-roll loop, not the bake)

**Cost:** 2× GPT Image 2 calls (~$0.14 total) + 2× Seedance (~$1.50-2.42 each at Fast 720p).
**Versus 1 long storyboard:** Easier to keep consistent, easier to edit, easier to swap hook clip.

**For Babypapaya-style content:** Use this exact pattern. Sequence = product showcase, Loop = viral hook ending.

---

## Loop Continuity Technique (P14 Matches P01)

The second storyboard (Ravenous Loop) explicitly engineers a **visual loop**:
- P14 last bite → lands "a matching crumb near her lip like P01 for a hard loop"

**Technical requirement:** Define the loop endpoint **before** defining the start. The SPATIAL CONTINUITY LOCK says:
> "P14 mouth close-up, she bites the torn piece; the new crumb lands near her lip like P01 for a hard loop."

**Drop-in loop planning rule:**
- Define endpoint = startpoint before writing middle panels
- Specify matching visual element (crumb, hand position, gaze, breath)
- Audio: final breath matches opening breath

---

## Storyboard Sizing Reference (From This Case)

| Clip Type | Panels | Duration | Grid | Beat Density |
|-----------|--------|----------|------|--------------|
| Cooking sequence (mid-rhythm) | 16 | ~12-15s | 4×4 | ~0.8-1.0s/panel |
| High-rhythm loop (smash cuts) | 14 | ~6-10s | 2×7 strip | ~0.4-0.7s/panel |
| Slow cinematic (master + beauty) | 9 | ~8-12s | 3×3 | ~1.0-1.3s/panel |

**For Seedance 2.0:** Stay in 8-15s per clip. 5-9 panel rhythm matches that. 16-panel stories compress well to 12-15s.

---

## 12-Section vs 9-Panel — When to Use Which

| Use Case | Best Method | Why |
|----------|-------------|-----|
| Cinematic single character beat | 9-panel | Simpler, cheaper, faster |
| Cooking montage with dance | 12-section | Multiple camera angles, screen direction lock |
| Loopable food content | 12-section | Loop continuity requires endpoint planning |
| Product reveal (single shot) | 9-panel or First+Last | No need for full board |
| Multi-clip narrative | 12-section | Modular re-rolls per clip |
| Quick UGC ad | 9-panel | Fastest path |

---

## Quick-Start Checklist for 12-Section Method

Use this when building a new storyboard from scratch:

- [ ] Step 1: Write PROJECT CARD (title, meta, priority, brief) FIRST
- [ ] Step 2: Write SCENE PACKET (premise, location with screen directions, action chain, must read)
- [ ] Step 3: Write CHARACTER SANITIZATION + IDENTITY CONSISTENCY
- [ ] Step 4: Lock MASTER SHOT in panel 2 — define full geography
- [ ] Step 5: Lock ENVIRONMENT LOCK + SPATIAL CONTINUITY
- [ ] Step 6: Define EMOTIONAL ARC + 2-axis guidance
- [ ] Step 7: Plan panel count by clip duration (see sizing table)
- [ ] Step 8: Write DIRECTOR STRIP for all 7 tracks
- [ ] Step 9: For loops, define endpoint = startpoint visual match
- [ ] Step 10: Drop entire template into GPT Image 2 prompt
- [ ] Step 11: Generate, review monochrome purity
- [ ] Step 12: Copy director strip text + panel beats into Seedance prompt
- [ ] Step 13: Generate video with `@[character ref]` + `@[storyboard ref]`
- [ ] Step 14: Review for drift, re-roll only the failed clip

---

## Metrics & Validation

Banana Bread thread (24h after post):
- **Likes:** 207
- **Bookmarks:** 143 (69% of likes — extremely high save rate = methodology value)
- **Retweets:** 12
- **Views:** 10,886
- **Replies:** 30 (mostly engagement, some Q&A)
- **Notable RT:** @knightama 2062657126959632574 explicitly pointing to workflow

**Bookmark rate (69%) is the smoking gun.** Users saved the workflow, not just the video. This is the strongest signal that the 12-section method has real practitioner demand. Use this case as proof when selling the methodology internally.

---

## Related References

- `storyboard-prompt-template.md` — fill-in-the-blank template
- `seedance-best-practices.md` — broader Seedance 2.0 best practices
- `tiktok-analyzer-system-prompt.md` — for reverse-engineering competitor videos
- SKILL.md section 2.7 (First+Last Frame) and 2.9 (Metamorphosis 4-step) — simpler alternatives for shorter content

---

## Source

- Original X thread (anonymized, archived): 2026-06-05, public post by a verified creative technologist
- Methodology only — not the creator's brand or identity
