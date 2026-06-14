# Seedance 2.0 Motion Prompt Template

The **5-part spine** for generating motion prompts. Used in Step 3 of the suite.

---

## Why This Exists

A motion prompt for Seedance 2.0 is NOT the same as a storyboard prompt. Different vocabulary, different structure, different goal:
- **Storyboard prompt** → tells GPT Image 2 to render a static, monochrome, panel-grid reference
- **Motion prompt** → tells Seedance 2.0 to interpolate motion between first/last frames, with director-strip text as the real signal

The motion prompt needs to:
1. Reference the **storyboard image** as `@[storyboard ref]` (visual anchor)
2. Reference the **character or product image** as `@[character ref]` or `@[product ref]` (identity anchor)
3. **Copy director strip text from Step 1** — NOT just upload the image (technical reality: storyboard image downsamples to ~30px/panel, useless for direct reading)
4. Optionally add **ASSET ROLE BINDING** when multiple assets serve different jobs
5. Optionally add **MODE OVERRIDE** when the task is extend / edit / fuse / beat-sync / dialogue / one-take
6. Define **5-part spine**: Subject → Action → Camera → Style → Constraints
7. Add **emotional guidance 2-axis** (Valence + Arousal) so the video "breathes"
8. Specify **audio strategy** (default: silent, diegetic foley only — add music in post)

---

## The Template (Drop Into Seedance 2.0)

```
Use @[storyboard ref] as the authoritative director-approved storyboard blueprint for the sequence.
Treat every storyboard panel as a consecutive shot within a single cinematic sequence.
Follow panel order exactly and do not invent alternative coverage.
Do not render the storyboard sheet itself.
[Exclude: panel borders, headers, text, labels, project card, director strip, style swatches, page layout]
Preserve camera placement, framing, lens intent, shot scale, character staging, screen direction, environmental geography, prop placement, action choreography, continuity, and emotional escalation shown by the storyboard.
The storyboard is the primary source of truth for visual storytelling.
Recreate the filmed sequence implied by the panels rather than the physical storyboard artwork.

Use @[character ref] as the authoritative C1 character reference.
[OR: Use @[product ref] as the authoritative product reference.]
[OR: Use both @[character ref] and @[product ref] for character+product videos.]

[ASSET ROLE BINDING — optional but strongly recommended when 3+ assets are attached]
[Use @[first frame ref] to lock the opening frame only.]
[Use @[last frame ref] to lock the landing frame only.]
[Use @[camera ref video] for camera behavior only; ignore subject and environment.]
[Use @[action ref video] for choreography only; ignore lens and grade.]
[Use @[fx ref video] for transition/VFX grammar only.]
[Use @[rhythm ref video] for cut cadence only.]
[Use @[bgm ref audio] for tempo/mood only.]

[MODE OVERRIDE — optional]
[Standard generation]
[OR: Extend existing clip forward/backward while preserving continuity state.]
[OR: Edit an existing clip while preserving environment and shot order, replacing only the specified variable.]
[OR: Fuse multiple source clips into one continuous sequence with explicit transition logic.]
[OR: Beat-sync montage mode.]
[OR: Dialogue / talk-to-camera mode.]
[OR: One-take / no-cut mode.]

[SUBJECT — 1-2 sentences]
C1: [brief identity, e.g., "Maya, 25, Indonesian woman, dark brown wavy hair, cream linen shirt"].
[OR: Product: "blue minimalist sneakers, mesh upper, white midsole".]
[OR: "Maya holding the blue sneakers" if both.]

[ACTION — the actual story, 2-4 sentences]
[What happens, in plain prose. E.g., "C1 walks toward camera, blows a kiss, turns to kitchen counter, picks up a banana, peels it in a single ribbon, drops it in a bowl. She mashes, cracks eggs, folds batter, slides pan into oven, glances at timer, pulls out golden loaf, slices it."]
[Use the ACTION CHAIN from your storyboard SCENE PACKET — translate arrow notation into prose.]

[CAMERA — shot-by-shot direction, 1 paragraph]
[P## / focal length / shot type / beat name -> P## / ... ]
[Camera moves: P## push-in -> P## handheld -> P## static -> P## whip-pan -> ...]
[Pulled from your PANEL HEADERS + CAMERA + LENS PLAN sections.]

[STYLE — visual signature, 1-2 sentences]
[Visual style: "warm cinematic, golden hour, shallow depth of field"]
[Final-video intent: "soft daylight bloom, soft steam, glossy batter folds, appetizing close-ups"]
[Imperfect realism textures — pick 1-2: film grain, haze, soft focus falloff, motion blur, natural lighting, practical light sources, weather, dust motes, reflections on wet surface, shadows with character, environmental texture]

[CONSTRAINTS — what to AVOID]
No music. No logo. No text on screen. No watermark. No frame numbers.
[Add: "No human faces" if Seedance face-blocking applies and you're using a stylized character.]
[Add: "No drift between cuts" if multi-cut sequence.]
[Add: "Preserve all non-targeted variables" if using edit mode.]
[Add: "Generate only the new continuation segment" if using extend mode.]

[EMOTIONAL GUIDANCE — 2-axis, critical]
Valence: [3-5 adjectives, e.g., "playful, warm, teasing, proud, satisfied" (high-energy) OR "peaceful, content, settled, contemplative, soft, gentle" (calm UGC)].
Arousal: [arc in arrow notation, e.g., "quick hook to steady groove -> tactile prep surges -> brief pause -> satisfying release through body rhythm" (high-energy) OR "soft opening -> gentle build -> contemplative middle -> peaceful resolution through stillness and breath" (calm UGC)].

[AUDIO — explicit strategy]
No background music or score. Use only diegetic ambience, foley, impacts, texture, and silence.
[OR if music preferred in generation:]
Music: [genre, e.g., "lo-fi hip hop"] with [BPM, e.g., "85 BPM"]; diegetic foley for [key actions, e.g., "egg crack, oven timer, knife on board"]; peak at P##, drop at P##.

[PANEL BEATS — per-panel script, copied from your Director Strip]
P01: [Shot description with motion + camera move + foley]. [emotional beat]. [audio cue].
P02: [Same structure].
P03: [Same structure].
...
P##: [Final shot]. [Loop match if applicable: "the new crumb lands near her lip like P01 for a hard loop."]

[NEGATIVE PROMPTS]
No music. No logo. No text on screen. No watermark. No frame numbers. No subtitles. No voiceover.
[Cinematic negatives: no clean digital sharpness, no CGI look, no poster composition, no centered portrait, no black bars]
```

---

## Fill-In Example (Banana Bread, Sequence + Loop)

```
Use @[storyboard ref] as the authoritative director-approved storyboard blueprint for the sequence.
Treat every storyboard panel as a consecutive shot within a single cinematic sequence.
Follow panel order exactly and do not invent alternative coverage.
Do not render the storyboard sheet itself.
[Exclude: panel borders, headers, text, labels, project card, director strip, style swatches, page layout]
Preserve camera placement, framing, lens intent, shot scale, character staging, screen direction, environmental geography, prop placement, action choreography, continuity, and emotional escalation shown by the storyboard.

Use @[character ref] as the authoritative C1 character reference.

[SUBJECT]
C1: Maya, 25, Indonesian woman, dark brown shoulder-length wavy hair, warm tan skin, small mole below right eye, cream linen shirt, dark jeans.

[ACTION]
C1 walks toward camera, smiles, and blows a kiss. She turns to the kitchen counter, picks up a single banana, peels it in one long ribbon, drops it into a bowl. She mashes with a fork, cracks an egg with one hand, folds batter, slides a pan into the oven, glances at the timer. After a beat, she pulls out a golden loaf, sets it on a board, and slices it. Camera kiss at the end, smile.

[CAMERA]
P01 / 35mm close / Kiss approach
P02 / 24mm wide / Kitchen master (full geography: window screen-left, island center, sink left, oven screen-right)
P03 / 50mm medium / Banana lift
P04 / overhead 35mm / Single banana peel
P05 / 35mm medium / Mash
P06 / macro insert / Egg crack
P07 / 50mm medium / Fold
P08 / 50mm medium / Slide into oven
P09 / 35mm track / Oven slide
P10 / 35mm medium / Timer glance
P11 / 50mm medium / Wait beat
P12 / 50mm medium / Loaf reveal
P13 / 50mm medium / Slice pull
P14 / 85mm tight / Slice pull close
P15 / 50mm counter / Loaf reveal
P16 / macro insert / Slice finale

Camera moves: P01 push-in -> P02 static (master) -> P03 handheld -> P04 overhead -> P05-P07 close static -> P08-P09 track right -> P10 static -> P11 static -> P12 handheld -> P13-P14 close -> P15 pull-back -> P16 macro static.

[STYLE]
Warm cinematic, golden hour, shallow depth of field, soft daylight bloom, soft steam, glossy batter folds, appetizing close-ups. Handheld intimacy on action panels, static stability on reaction panels.

[CONSTRAINTS]
No music. No logo. No text on screen. No watermark. No frame numbers. No drift between cuts.

[EMOTIONAL GUIDANCE]
Valence: playful, warm, teasing, proud, satisfied.
Arousal: quick hook to steady groove -> tactile prep surges -> brief pause -> satisfying release through body rhythm, over-shoulder glances, hand precision, steam, crumbs, and food texture.

(For calm UGC variant, see: `banana-bread-worked-example.md` Emotional Guidance section.)

[AUDIO]
No background music or score. Use only diegetic ambience, foley, impacts, texture, and silence.
- P01: soft breath, fabric rustle
- P04: peel snap
- P06: egg crack, wet shell hit bowl
- P08: oven door creak, pan slide
- P10: timer beep
- P12: oven door open, steam hiss
- P13-P14: knife on wood, soft crumb crunch

[PANEL BEATS]
P01: Handheld close as C1 steps toward camera, smiles, and blows a kiss; soft breath and fabric rustle. Playful invitation. Soft breath cue.
P02: Static wide showing full kitchen — window left, island center, C1 at counter. Calm setup. Silence.
P03: 50mm medium, C1 picks up banana, lifts it. Focus beat. Cloth rustle.
P04: Overhead 35mm, single banana peel curls into bowl. Tactile beat. Peel snap.
P05: 35mm medium, C1 mashes banana with fork. Groove beat. Wet mash thud.
P06: Macro insert, egg crack in one hand. Precision beat. Egg crack + shell hit.
P07: 50mm medium, batter fold with spatula. Flow beat. Soft batter slosh.
P08: 50mm medium, C1 slides pan into oven. Action beat. Oven door creak.
P09: 35mm track right, pan slides deeper into oven. Camera follows. Heat beat. Sizzle start.
P10: 35mm medium, C1 glances at timer. Reaction beat. Timer beep.
P11: 50mm medium, C1 waits, slight hip shift. Anticipation beat. Silence.
P12: 50mm medium, C1 pulls out golden loaf, steam rises. Reveal beat. Oven door + steam hiss.
P13: 50mm medium, C1 sets loaf on board, picks up knife. Setup beat. Knife on wood.
P14: 85mm tight, knife cuts first slice. Precision beat. Soft crumb crunch.
P15: 50mm counter, C1 lifts slice toward camera. Showcase beat. Steam wisp.
P16: Macro insert, slice pull, crumbs scatter. Final beat. Crumb tap.

[NEGATIVE PROMPTS]
No music. No logo. No text on screen. No watermark. No frame numbers. No subtitles. No voiceover.
```

---

## QC Checklist Before Sending to Seedance 2.0

- [ ] `@[storyboard ref]` referenced at top
- [ ] `@[character ref]` or `@[product ref]` referenced
- [ ] Subject line (1-2 sentences) — identity
- [ ] Action line (2-4 sentences) — story in prose
- [ ] Camera line — per-panel P## / focal length / shot type / [composition style]
- [ ] Style line — visual signature + **imperfect realism textures** (1-2 from texture pack)
- [ ] Constraints line — what to avoid
- [ ] **Emotional Guidance 2-axis** (Valence + Arousal) — match energy level to brief (high-energy vs calm UGC)
- [ ] Audio strategy explicit (silent/diegetic OR music+specs)
- [ ] **Panel beats per P##** with shot + motion + foley + emotional beat + audio cue
- [ ] Negative prompts: no music, no logo, no text, no watermark, no frame numbers
- [ ] **Cinematic negatives:** no clean digital sharpness, no CGI look, no poster composition, no centered portrait, no black bars

---

## Pitfalls

1. **Forgetting director strip text** — the image is documentation. The text is the contract. Always include PANEL BEATS in the prompt.
2. **Skipping `@[refs]`** — without refs, Seedance hallucinates faces/environments.
3. **One-axis emotion ("make it playful")** — collapses to flat mood. Always split into Valence + Arousal.
4. **Music in the generation** — locks pacing, makes re-edits hard. Default to silent + diegetic foley. Add music in post.
5. **Vague camera direction** — "dynamic camera" = random. Use `P## / focal length / shot type / beat name` per panel.
6. **Forgetting screen direction in prose** — "she walks to the oven" is bad. "She walks screen-right toward the oven (which is screen-right of the sink)" is good.
7. **Too many panels** — 16 panels in 12-15s = ~0.8s/panel = OK. 24 panels in 12s = 0.5s/panel = rushed, drift risk.
8. **No negative prompts** — Seedance defaults to "add music + logo." Always specify "No music. No logo. No text."
9. **Extra assets with no role binding** — mixed signals create identity/style/action drift.
10. **Wrong mode wording** — extension/edit/fuse tasks need different constraint language than greenfield generation.

---

## Audio Strategy Decision Tree

```
Q: Do you want to edit pacing in post?
├─ YES → Generate silent (diegetic foley only)
│        → Add music in CapCut/DaVinci/Premiere
│        → Reorder shots to match beat changes
│        → Swap music without re-generating
│
└─ NO, want music baked in
   ├─ Have specific track in mind? → Bake it: "Music: lo-fi, 85 BPM; peak at P##"
   └─ Just want vibe? → Specify genre + BPM, leave peaks to model
```

**Default: silent.** Music-in-post is the only way to keep iteration speed high.

---

## Related References

- `storyboard-prompt-template.md` — Step 1 (storyboard image)
- `character-ref-prompt.md` — Step 2a (character ref)
- `product-ref-prompt.md` — Step 2b (product ref)
- `director-strip-7-track.md` — vocabulary
- `cinematic-composition-vocabulary.md` — 19 cinematic styles + texture pack
- `seedance-asset-binding.md` — optional attachment role system
- `seedance-pattern-library.md` — optional mode library
- `../commands/motion.md` — slash command spec
