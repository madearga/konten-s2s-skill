# /s2s compose-pattern — Pattern-Based Motion Prompt Construction

Constructs a Seedance / Veo / Kling motion prompt using one of 6 specialized patterns: extend / edit / fuse / beat-sync / dialogue / one-take. Each pattern has its own template structure while preserving the canonical 5-part spine.

**Capability:** Pattern (motion variant)
**Trigger:** `/s2s compose-pattern [extend|edit|fuse|beat-sync|dialogue|one-take] [args]`

---

## When to Use

- User wants to **extend** an existing clip forward or backward in time
- User wants to **edit** an existing clip while preserving most of it (change one layer)
- User wants to **fuse** multiple clips into one continuous sequence
- User wants a **beat-sync** / music-driven cut montage
- User wants **dialogue** / voice-over / talk-to-camera content
- User wants a **one-take** / continuous-shot scene with no internal cuts

---

## Pattern Catalog

### Pattern 1: extend

**Use case:** Add seconds before or after an existing clip.

**Trigger phrases:** "extend video", "video extension", "extend by X seconds", "continue this clip", "what happens next"

**Template structure:**
```text
[ANCHOR: @Video1 is the source clip, ends at last frame]

[EXTEND DIRECTION: forward / backward by N seconds]
[DURATION: N seconds, set generation duration to N]

[TIME SEGMENTS:]
1-Ns: [opening of new content, anchored to last frame of source]
... beat progression ...

[CONSTRAINTS:]
- Preserve [Video1]'s identity, scene, color palette, pacing
- Change ONLY [the new content layer]
- (HARD CUT TO BLACK) at end if this is the final extension
```

**Example:**
```text
ANCHOR: @Video1 is the source clip (woman stirring coffee, ends with spoon mid-twirl)

EXTEND forward by 8 seconds.
1-3s: spoon completes the twirl, sets down on saucer
3-6s: woman lifts cup to lips, takes sip, eyes close briefly
6-8s: cup returns to saucer, steam continues rising, (HARD CUT TO BLACK)

CONSTRAINTS:
- preserve @Video1's identity, kitchen setting, warm color palette
- diegetic foley only (ceramic on ceramic, soft sip, ambient room tone)
- do not introduce new characters, props, or scene changes
```

**Reference:** `references/seedance-pattern-library.md` § "Pattern 1: Extend"

---

### Pattern 2: edit

**Use case:** Modify specific elements of an existing clip while preserving the rest.

**Trigger phrases:** "edit video", "edit existing video", "change [X] in this clip", "subvert the plot", "replace [character/object]"

**Template structure:**
```text
[ANCHOR: @Video1 is the source clip]

[EDIT SPECIFICATION:]
- Change ONLY: [the single layer to modify]
- Preserve: [all other layers — identity, scene, camera, action, audio, style]

[BEFORE/AFTER:]
- Before: [what was in @Video1]
- After: [what should replace it]

[CONSTRAINTS:]
- DO NOT modify [preserved layers]
- DO NOT change [forbidden changes]
```

**Example:**
```text
ANCHOR: @Video1 is the source clip (couple on bridge, romantic tone)

EDIT SPECIFICATION:
- Change ONLY: emotional tone + character expression
- Preserve: location, camera work, costumes, time of day, audio bed

BEFORE: romantic, soft smiles, warm light
AFTER: tense, the man's expression shifts from tenderness to icy cruelty

3-6s: in an unguarded moment, he shoves her off the bridge — implied framing only (no impact, no splash)
6-10s: her hand reaches up from below frame, fingers grasping air, cut to black

CONSTRAINTS:
- DO NOT show splash, injury, or aftermath
- DO NOT change costumes, location, or camera
- help-line CTA appears in end card
```

**Reference:** `references/seedance-pattern-library.md` § "Pattern 2: Edit"

---

### Pattern 3: fuse

**Use case:** Merge multiple clips into one continuous sequence.

**Trigger phrases:** "merge videos", "video fusion", "combine clips", "transition from [A] to [B]", "continuity between clips"

**Template structure:**
```text
[SOURCES:]
- @Video1: [description + role]
- @Video2: [description + role]
- @Video3: [description + role, if applicable]

[TRANSITION TYPE:]
- Particle transformation
- Match cut (object/state/shape)
- Whip pan
- Continuous motion
- Fade to white/black between

[SEQUENCE:]
0-Ns: [content from Video1]
... transition ...
... content from Video2 ...
... transition ...
... content from Video3 ...

[CONSTRAINTS:]
- continuity of [what stays constant across clips]
- no abrupt discontinuities in lighting, color, or scale
```

**Example:**
```text
SOURCES:
- @Video1: horse made of particles, galloping
- @Video2: solid horse galloping
- @Video3: horse dispersing back into particles

TRANSITION: particle transformation, smooth dissolve

SEQUENCE:
0-3s: @Video1 horse galloping, particles beginning to condense
3-6s: particles fully condensed into solid horse (@Video2 takes over)
6-9s: solid horse gallops through field
9-12s: horse begins to disperse, particles separating
12-15s: fully dispersed back into particles (@Video3), (HARD CUT TO BLACK)

CONSTRAINTS:
- audio: galloping hooves throughout + particle shimmer texture
- visual style: consistent palette and lighting
- no abrupt discontinuities
```

**Reference:** `references/seedance-pattern-library.md` § "Pattern 3: Fuse"

---

### Pattern 4: beat-sync

**Use case:** Music-driven montage with cuts synced to beat.

**Trigger phrases:** "beat sync", "music sync", "music video", "rhythm cut", "dance video"

**Template structure:**
```text
[AUDIO: @Audio1 or @Video1's audio]
[BPM: if known, include]
[KEY FRAMES: count and timing if known]

@Image1 @Image2 @Image3 ... match the keyframe positions and overall rhythm
of @Video1 for beat-synced cuts.

[CUT FREQUENCY:]
- High-energy: cut every 1-2 beats
- Medium: cut every 4 beats
- Low: cut every 8 beats

[VISUAL VARIATIONS PER CUT:]
- Subject position / pose
- Camera angle
- Lighting color shift
- Depth of field change

[CONSTRAINTS:]
- Audio is the master clock, visuals follow
- Use @Video1's beat positions, not your own interpretation
- Keep one subject consistent across cuts (for character work)
```

**Example:**
```text
AUDIO: @Audio1, 128 BPM electronic track
KEY FRAMES: 8 cuts at positions 0s, 0.94s, 1.88s, 2.81s, 3.75s, 4.69s, 5.63s, 6.56s

@Image1 @Image2 @Image3 @Image4 @Image5 @Image6 — match keyframe positions of @Audio1 for beat-synced cuts.

CUT FREQUENCY: every 1 beat (high-energy)

VISUAL VARIATIONS PER CUT:
- Subject rotates 45° between cuts
- Lighting shifts hue with beat (cool → warm → cool)
- Camera angle orbits 30° between cuts
- Shallow depth of field on cuts 1, 3, 5, 7; deep on 2, 4, 6, 8

CONSTRAINTS:
- audio master clock
- character @Image1 visible in every cut (consistent identity)
- @Audio1 audible throughout
```

**Reference:** `references/seedance-pattern-library.md` § "Pattern 4: Beat-Sync"

---

### Pattern 5: dialogue

**Use case:** Character speaking — voice-over, monologue, talk-to-camera, or two-character conversation.

**Trigger phrases:** "dialogue video", "voice-over", "narration", "talk to camera", "monologue", "two-character scene"

**Template structure:**
```text
[SPEAKER(S):]
- @Image1: [speaker 1 description, position]
- @Image2: [speaker 2 description, if applicable]

[SHOT TYPE:]
- Single character: locked medium close-up, minimal camera movement
- Two characters: alternating OTS (over-the-shoulder)
- Voice-over (no visible speaker): scene visuals + VO audio

[DIALOGUE: line by line with delivery direction]
[Speaker 1]: "[exact line]" — [tone, pace, gesture]
[Speaker 2]: "[exact line]" — [tone, pace, gesture]

[CONSTRAINTS:]
- Lip movement must align with dialogue (avoid wide shots during speech)
- Cut between speakers on line breaks (two-character)
- Keep each line under 8 words for sync reliability
- VO can be longer, but pair with B-roll visuals
```

**Example:**
```text
SPEAKERS:
- @Image1: woman, mid-30s, journalist, sitting at desk
- @Image2: man, mid-40s, expert, sitting across

SHOT: two-character alternating OTS

DIALOGUE:
[Woman]: "Tapi buktinya ada di data BPS." — confident, slight forward lean, hands on desk
[Man]: "Data itu konteksnya beda." — measured, gestures once with right hand
[Woman]: "Konteks nggak nutupin fakta." — sharp, slight head tilt, eyebrow raise
[Man]: "[long pause]" — looks away, hand to chin, 1.5s breath

CONSTRAINTS:
- OTS cuts on speaker change, no overlap
- each line under 8 words
- audio: room tone + voice, no music
- locked frames, no camera movement during speech
```

**Reference:** `references/seedance-pattern-library.md` § "Pattern 5: Dialogue"

---

### Pattern 6: one-take / oner

**Use case:** Continuous shot with no internal cuts, traveling through space or time.

**Trigger phrases:** "one take", "single take", "oner", "continuous shot", "long take", "no cuts"

**Template structure:**
```text
[SHOT TYPE: ONE-TAKE / ONER — NO CUTS — DO NOT DISSOLVE]

[DURATION: full 15s or specified]

[CAMERA MOVEMENT:]
- Track subject from [A] to [B]
- Pass through [C], [D], [E]
- One continuous move, no reset

[SPATIAL LOCK:]
- Geography stays consistent: [room/street/building description]
- Screen direction: locked [left/right/forward]
- Anchor points: [specific landmark references]

[TIME PROGRESSION (optional):]
- 0-5s: [state A]
- 5-10s: [state B, transformed from A]
- 10-15s: [state C, transformed from B]

[CONSTRAINTS:]
- DO NOT cut or dissolve between segments
- DO NOT reset camera position
- DO NOT change screen direction
- (HARD CUT TO BLACK) only at final frame
```

**Example:**
```text
SHOT TYPE: ONE-TAKE, NO CUTS, 15s

DURATION: 15s continuous

CAMERA MOVEMENT:
- Steadicam follows character from street entrance
- Through narrow alley (wet walls, passing tungsten practicals)
- Up 2 flights of stairs
- Across rooftop
- Final reveal: city skyline at golden hour

SPATIAL LOCK:
- geography: old Jakarta quarter, Betawi architecture
- screen direction: character always moving screen-right (relative to camera)
- anchor points: warung at entrance, broken tile on stair landing, water tank on rooftop

TIME PROGRESSION:
- 0-5s: street level, daytime, warm
- 5-10s: alley, dim, cooler
- 10-15s: rooftop, golden hour, wide

CONSTRAINTS:
- DO NOT cut or dissolve
- DO NOT reset camera
- DO NOT flip screen direction
- (HARD CUT TO BLACK) at end
```

**Reference:** `references/seedance-pattern-library.md` § "Pattern 6: One-Take"

---

## Inputs to Gather

Ask until **2 of 3** fields are filled:

| Field             | Example                                                  | Required?     |
|-------------------|----------------------------------------------------------|---------------|
| Pattern           | "extend forward by 8 seconds" / "fuse 2 clips"           | Required      |
| Source asset(s)   | `@Video1.mp4`, `@Video2.mp4`, etc.                       | Required      |
| Edit/extend spec  | "Change only the character's expression"                 | Required      |

If user gives full brief, fill all directly.

---

## Output Format

```markdown
# /s2s compose-pattern — [pattern name]

## Pattern
[extend | edit | fuse | beat-sync | dialogue | one-take]

## Sources
- @[asset]: [role]

## Specification
[pattern-specific template filled in]

## Full Motion Prompt
[complete copy-paste-ready prompt]

## Generation Settings
- Backend: [Seedance 2.0 / Veo 3.1 / Kling 3.0]
- Duration: [N seconds, must match pattern requirement]
- References attached: [list]

## QC Checklist
- [ ] Pattern template fully filled
- [ ] Anchor / source assets specified
- [ ] Time segments sum to total duration
- [ ] HARD CUT marker at end (if applicable)
- [ ] Continuity constraints stated
```

---

## Cross-Reference

- `references/seedance-pattern-library.md` — canonical 6-pattern library with worked examples
- `references/seedance-reference-syntax.md` — `@`-role binding for multi-asset scenarios
- `references/seedance-camera-language.md` — camera language for one-take (advanced moves)
- `references/seedance-motion-vocabulary.md` — action verbs + body-part vocabulary for dialogue / edit
- `references/seedance-troubleshooting.md` — if output wrong, run `/s2s troubleshoot`
- `commands/motion.md` — the canonical `/s2s motion` (general) command for non-pattern motion prompts

---

## Related Commands

- `/s2s motion` — general motion prompt (use when not a specific pattern)
- `/s2s analyze` — reverse-engineer an existing video before composing a pattern (edit / fuse / extend)
- `/s2s troubleshoot` — if pattern output is wrong, diagnose + repair