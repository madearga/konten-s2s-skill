# Troubleshooting Taxonomy — Seedance 2.0 / Veo / Kling Failure Modes

**Source:** s2s internal accumulated pitfalls + earlier material adapted from `Emily2040/seedance-2.0` v5.5.2 (MIT). In v1.12.0, retake triage, model mechanics, and sequence failure atlas live in separate references: `seedance-retake-protocol.md`, `seedance-model-mechanics.md`, and `seedance-failure-atlas.md`.

Use this when a generated video comes out wrong. Diagnose from symptom → likely cause → repair pattern.

---

## How to Use This File

1. **Symptom first** — what does the output look/sound/feel like wrong?
2. **Match to failure mode** — find the closest pattern below.
3. **Apply repair** — copy the repair pattern into your next prompt attempt.
4. **Verify** — regenerate. If still wrong, check pitfall table in SKILL.md.

---

## Category 1: Identity / Face Drift

### Symptom: Faces Look Different Between Clips

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Multiple reference images, no role binding | Use `@[character ref]` ONCE, lock character description verbatim in every prompt |
| No character ref at all                   | Generate `/s2s character-ref` first, then re-run motion                     |
| Character ref shows different angles only  | Add `front-facing portrait, neutral expression` to ref request               |
| Prompt contradicts character description   | Move character description to start of prompt, before any action             |
| Backstory description overrides identity  | Move backstory to CONSTRAINTS, keep identity at top                          |

### Symptom: Face Is Waxy / Plastic / AI-Telltale

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No realism texture pack                   | Add "Cinematic Imperfect Realism" pack from `seedance-motion-vocabulary.md` |
| Lighting too perfect                      | Specify `motivated practical lighting, no studio`                            |
| Background too clean                      | Add `lived-in environment, asymmetric details, dust, wear`                  |
| Skin too smooth                           | Specify `visible skin texture, pores, micro-imperfections`                   |
| Eyes too symmetric                        | Specify `natural asymmetric features, not mannequin-perfect`                 |

### Symptom: Hands / Fingers Warped

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Hand is small in frame                    | Pull hand into ECU, specify `hand fills 40% of frame`                       |
| Hand is in motion (blur)                  | Specify `hand at rest, fingers extended, palm flat`                         |
| Hand interacting with object              | Specify object grip explicitly: `grips phone base with 4 fingers, thumb rests on screen edge` |
| Multiple hands visible                    | State exact count: `only one hand visible, screen-right`                    |

---

## Category 2: Camera / Composition Failure

### Symptom: Camera Drifts Between Shots

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No Spatial Continuity Lock                | Add `references/spatial-continuity-lock.md` block, lock geography verbatim   |
| Anchor geography not stated               | Specify `window screen-left, door screen-right, bed center-frame` per clip   |
| Screen direction flips                    | Restate `character faces camera-right throughout, never flips`              |

### Symptom: Camera Dissolves Shots Together

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No HARD CUT marker                        | End every shot with `(HARD CUT)`                                            |
| Last shot doesn't fence end               | Last shot ends with `(HARD CUT TO BLACK)` or `(MATCH CUT TO {next})`        |
| Multi-shot in one generation              | Reduce to 1-2 shots, use separate generations                              |

### Symptom: Extra Camera Moves Beyond What You Asked

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Multiple verbs in camera line             | ONE primary move only, with endpoint                                        |
| Adjectives preceding verb                 | Move adjectives AFTER verb: `slowly pushes in` not `slow, gentle, careful push-in` |
| No `locked` qualifier                     | Add `camera locked, no additional movement` to CONSTRAINTS                  |

### Symptom: Whip Pan / Shake Without Request

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Action verb implies motion                | Use `handheld — smooth, controlled` qualifier                              |
| Energy level too high                     | Reduce RHYTHM escalation, specify `Level 2: Drift` instead of `Burst`        |

---

## Category 3: Action / Motion Failure

### Symptom: Motion Feels Too Fast or Too Slow

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No duration segmented                     | Add time-segmented action: `0-3s: [X], 3-6s: [Y], 6-10s: [Z]`               |
| Single motion verb for full duration      | Break into micro-blocks per the RHYTHM track                                |
| Pacing conflict between action + camera   | Reduce camera move OR reduce subject action, never both at peak             |

### Symptom: Subject Freezes Mid-Action

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No endpoint specified                     | Add explicit end state: `ends with phone face-down, hand flat on table`     |
| Too many actions in one clip              | Reduce to ONE visible beat + ONE endpoint                                   |
| Conflicting verbs                         | Pick one verb family, not two: `lifts` not `lifts and rotates`              |

### Symptom: Object Floats / Doesn't React to Physics

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No gravity / weight qualifier             | Specify `weight visible, object settles under gravity`                      |
| Cloth doesn't react                       | Specify `fabric responds to movement, settles after motion stops`           |
| Liquid moves unnaturally                  | Specify `liquid obeys gravity, surface tension, viscosity`                  |

---

## Category 4: Scene / Environment Failure

### Symptom: Background Hallucinates Details

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No `@[storyboard ref]` or scene description | Specify scene in detail: `small Indonesian kitchen, single window screen-left, gas stove, wooden counter, calendar on wall` |
| Random props appear                       | Specify what NOT to include in CONSTRAINTS                                  |
| Setting is too generic                    | Add specific Indonesian / cultural anchors (warung, cermin, batu bata, etc.) |

### Symptom: Lighting Inconsistent Between Clips

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No lighting spec per shot                 | Specify `practical key from [direction], ambient [level], no studio` per clip |
| Time of day drifts                        | Lock `time of day: golden hour / night / overcast noon` across clips        |
| Color temperature shifts                  | Lock `color temp: 3200K warm tungsten / 5600K daylight` across clips        |

### Symptom: Geography Flips Between Clips

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No Spatial Continuity Lock                | Add spatial lock section, restate anchor geography per clip                 |
| Camera angle reverses                     | Lock `camera always at 2 o'clock from character, never crosses to 10 o'clock` |
| Screen direction undefined                | Lock `window always screen-left, door always screen-right`                  |

---

## Category 5: Audio / Dialogue Failure

### Symptom: No Audio / Silent Output

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Generation duration too short             | Seedance audio needs ≥ 6s minimum for ambient bed                            |
| No audio cue in prompt                    | Add explicit `Sound:` line: `Sound: low room tone, distant traffic, soft hum` |
| Backend has no audio support              | Switch to Seedance 2.0 native audio OR post-process with foley              |

### Symptom: Dialogue Lip-Sync Off

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Face is visible during dialogue           | Reduce to extreme close-up of mouth OR cut away before dialogue starts     |
| Multiple characters speak                 | One speaker per clip, generate separately                                    |
| Long dialogue line                        | Keep under 8 words per clip                                                  |

### Symptom: Music Too Loud / Overpowers

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Music baked into generation               | Specify `diegetic foley only, no music` in audio line                        |
| Music tempo doesn't match cuts            | Specify `audio bed layered in post, not generated`                          |

---

## Category 6: Style / Aesthetic Failure

### Symptom: Output Looks "AI Generic"

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No style anchors in prompt                | Add 3-5 style anchors: `cinematic realism, 35mm grain, muted palette, motivated lighting` |
| No negative prompt block                  | Add anti-slop lexicon from `seedance-motion-vocabulary.md`                  |
| Style is too broad ("cinematic")          | Specify sub-style: `documentary realism / UGC handheld / commercial / film-noir` |

### Symptom: Color Palette Wrong

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No color spec                             | Specify palette: `desaturated teals and ambers, lifted blacks, no neon`      |
| Mood conflicts with palette               | Mood ≠ palette: state BOTH                                                  |
| Skin tone not specified                   | Specify skin tone range: `Indonesian sawo matang skin, warm undertones`      |

### Symptom: Aspect Ratio / Resolution Wrong

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Requested portrait, got landscape         | Explicit `9:16 vertical, 1080x1920, mobile-first composition`              |
| Resolution too low                        | Specify `720p minimum, prefer 1080p if backend supports`                     |

---

## Category 7: Model Backend Failure

### Symptom: CodeX Backend Returns Empty (No 429)

**Symptom detail:** `Codex response contained no image_generation_call result` — model loads but doesn't trigger tool_use. NOT a hard failure.

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Soft hourly quota exhausted               | Recovery order: (1) wait 30-60 min, (2) Pixazo Flux Schnell free, (3) Pixazo GPT Image 2 pay, (4) ASCII fallback |
| First call OK, 2+ fail                    | Switch backend before retrying                                               |

See SKILL.md "Codex Backend Quota Pitfall" for full recovery sequence.

### Symptom: Veo 3.1 Lite Hallucinates Faces

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Veo is more lenient than Seedance          | Apply tighter constraints, add realism pack                                  |
| Long prompt confused model                | Compress to under 1500 chars, lead with subject                             |

### Symptom: Kling 3.0 Over-Smooths Motion

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Too few action verbs                      | Add micro-gestures: `slight finger twitch, breath visible, eyelid micro-movement` |
| Pacing too fast                           | Slow time-segmented action, extend duration to 15s                          |

---

## Category 8: Content Policy / Safety Block

### Symptom: Generation Blocked for "Realistic Human Face"

**Symptom detail:** Seedance 2.0 blocks uploads with realistic human faces in @Image1.

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Character ref shows realistic face         | Switch to illustrated / anime / silhouette character ref                    |
| Brief requires real human                 | Pivot to POV / hands-only / silhouette / blurred face                       |
| Face needed but blocked                   | Use Kling 3.0 (more lenient on faces)                                       |

### Symptom: Sensitive Content Blocked (PSA / Cyberbullying)

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Prompt mentions self-harm / suicide       | Apply 6-point Sensitive Content Safety Guardrails (see SKILL.md)             |
| Method shown in image                     | Specify `implied framing only, no method visible`                          |
| Victim shown in full body                 | Specify `hand/partial body only, no face, no full posture`                  |

See SKILL.md "Sensitive Content Safety Guardrails" + `references/seedance-no-character-ref-pov-workflow.md`.

---

## Category 9: Continuity / Multi-Clip Failure

### Symptom: Character Wardrobe Changes Between Clips

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Wardrobe not locked across clips          | Specify identical wardrobe verbatim in every prompt                          |
| Wardrobe described differently             | Use SAME phrase: `plain wrinkled gray t-shirt, dark blue jeans, bare feet`   |

### Symptom: Prop State Inconsistent (Phone, Wallet, etc.)

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| No prop state tracking                    | Add `prop state: [description]` to CONTINUITY section per clip               |
| Phone on table in clip 1, missing clip 2  | Specify `phone remains on table screen-right throughout`                     |

### Symptom: Lighting / Mood Drift Across Clips

| Likely Cause                              | Repair Pattern                                                              |
|--------------------------------------------|-----------------------------------------------------------------------------|
| Each clip specifies own lighting          | Lock `lighting: [single description]` across all clips                      |
| Escalation affects lighting               | Specify allowed escalation: `lighting brightens 1 stop from clip 3 → clip 5` only |

---

## Category 10: Repair Strategy (Order of Operations)

When output is wrong, repair in this order:

1. **Fix the prompt first.** Most failures are prompt-induced, not backend bugs.
2. **Lock ONE variable at a time.** Don't change character + camera + lighting at once.
3. **Reduce scope.** Shorter clip (4-6s) with ONE shot is easier to fix than 15s with 5 shots.
4. **Switch reference roles.** If `@[character ref]` drifts, swap to `@[style ref]` and bake description verbatim.
5. **Switch backend.** Pixazo Flux Schnell for speed, Seedance native for quality, Kling for face tolerance.
6. **Post-process.** Color grade, audio mix, and trim in CapCut/DaVinci before declaring failed.
7. **Ask user.** If 3+ repairs fail, surface to user before burning budget.

---

## One-Variable Retake Protocol

From Emily's `retake-protocol` sub-skill:

> A draft is a conversation, not a restart. Inherit all previous story decisions and change ONLY what the user's reaction requested.

| User Reaction                              | What to Change                                        | What to KEEP                          |
|--------------------------------------------|-------------------------------------------------------|---------------------------------------|
| "Face is wrong"                             | Character description + ref image                     | All camera, scene, action             |
| "Camera moves too much"                     | Camera language section                               | All action, scene, character          |
| "Scene is wrong"                            | Scene description + scene ref                         | All character, camera, action         |
| "Pacing is too fast"                        | Time-segmented action, RHYTHM track                   | All camera, scene, character          |
| "Mood is off"                               | Valence + Arousal phrasing                            | All action, camera, scene             |
| "Color is wrong"                            | Color spec                                            | All other layers                      |
| "Audio is wrong"                            | Sound line                                            | All other layers                      |

Don't change multiple variables in one retake. The model collapses to mean-of-all-variables when you change 3+ things.

---

## Reference

- Emily2040/seedance-2.0 — v5.5.2 — `references/seedance-troubleshoot.md` + `references/model-mechanics.md` + `references/retake-protocol.md`
- s2s internal — SKILL.md "Pitfalls" section (12 accumulated)
- s2s internal — SKILL.md "Sensitive Content Safety Guardrails"
- s2s internal — SKILL.md "Codex Backend Quota Pitfall"
- s2s internal — `references/seedance-no-character-ref-pov-workflow.md`