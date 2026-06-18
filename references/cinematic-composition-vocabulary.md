# Cinematic Composition Vocabulary

A **vocabulary library of 19 cinematic composition styles** for image-prompt engineering, plus an **imperfect-realism texture pack** and a **default base-style snippet**. Use these in storyboard panels, character sheets, product references, and key-frame pre-visualization to make every image feel like a captured moment from a real film scene rather than a staged photoshoot or generic concept art.

---

## Default Base Style

Pin this into every prompt unless the user overrides:

```
cinematic realism, film stock grain, film still
```

Three components:
- **cinematic realism** — anchor: not anime, not CGI, not illustration
- **film stock grain** — texture: implies analog film, not clean digital
- **film still** — frame: implies mid-movie moment, not poster, not portrait

---

## 19 Cinematic Composition Styles

Each style = a specific camera position + subject placement. Pick a different one per panel/variation to **sweep the visual language** for the same subject.

### 1. Extreme Low Angle
**Camera position:** Ground level, pointing up
**Subject placement:** Subject towers above camera, often against sky
**Effect:** Power, dominance, monumentality
**When to use:** Heroic moments, reveals, scale emphasis
**Example header:** `P## / 18mm wide / extreme low angle / [beat]`

### 2. High Angle
**Camera position:** Above subject, pointing down (30-60°)
**Subject placement:** Subject shrinks in frame, environment dominates
**Effect:** Vulnerability, isolation, surveillance, judgment
**When to use:** Overwhelm beats, ant perspective, layout establishing
**Example header:** `P## / 35mm / high angle / [beat]`

### 3. Overhead Top-Down
**Camera position:** Directly above, 90° down
**Subject placement:** Flat composition, often geometric pattern
**Effect:** God view, infographic clarity, abstract beauty
**When to use:** Cooking prep, layout reveals, pattern compositions
**Example header:** `P## / 24mm / overhead top-down / [beat]`

### 4. Over-the-Shoulder (OTS)
**Camera position:** Behind one subject, focus on another
**Subject placement:** Back of head/shoulder in foreground (out of focus), subject in midground
**Effect:** POV intimacy, conversation, eavesdropping
**When to use:** Dialogue, two-character beats, hand-to-hand action
**Example header:** `P## / 50mm / OTS / [beat]`

### 5. Foreground Obstruction
**Camera position:** Standard, but with object in foreground
**Subject placement:** Foreground element partially blocks subject
**Effect:** Layered depth, voyeurism, real-life texture
**When to use:** Hidden moments, peeking, environmental grounding
**Example header:** `P## / 35mm / foreground obstruction / [beat]`

### 6. Reflection Shot
**Camera position:** Standard, capturing reflection in surface
**Subject placement:** Subject appears via mirror, window, water, metal
**Effect:** Dreamlike, dual reality, mood
**When to use:** Pensive beats, identity moments, water/glass scenes
**Example header:** `P## / 50mm / reflection / [beat]`

### 7. Silhouette Shot
**Camera position:** Backlit, exposing only outline
**Subject placement:** Subject fully dark against bright background
**Effect:** Mystery, anonymity, iconic
**When to use:** Branded moments, mystery reveals, dawn/dusk
**Example header:** `P## / 50mm / silhouette / [beat]`

### 8. Frame-within-a-Frame
**Camera position:** Standard, using environmental element as frame
**Subject placement:** Subject contained in doorway, window, arch, mirror
**Effect:** Contained, theatrical, focused attention
**When to use:** Discovery moments, isolation, picture-book compositions
**Example header:** `P## / 35mm / frame-in-frame / [beat]`

### 9. Deep Vanishing Point
**Camera position:** End of corridor/road, lines converge
**Subject placement:** Subject at far point, lines lead eye
**Effect:** Depth, journey, infinite recession
**When to use:** Travel shots, intro sequences, geometry emphasis
**Example header:** `P## / 24mm / deep vanishing point / [beat]`

### 10. Wide Negative Space
**Camera position:** Wide, subject small in frame
**Subject placement:** Subject occupies <25% of frame, lots of empty area
**Effect:** Loneliness, scale, contemplation
**When to use:** Quiet beats, breathing room, minimalist moments
**Example header:** `P## / 35mm / wide negative space / [beat]`

### 11. Compressed Telephoto Distance
**Camera position:** Long lens (85-200mm), far from subject
**Subject placement:** Subject and background both sharp, flat
**Effect:** Documentary, voyeuristic, telephoto compression
**When to use:** Cinematic portraits, distant observation, paparazzi
**Example header:** `P## / 135mm / compressed telephoto / [beat]`

### 12. Handheld Close Perspective
**Camera position:** Handheld, very close to subject
**Subject placement:** Subject fills frame, slight motion/wobble
**Effect:** Intimate, immediate, raw
**When to use:** UGC aesthetic, POV cooking, action immersion
**Example header:** `P## / 35mm / handheld close / [beat]`

### 13. Diagonal Movement
**Camera position:** Tilted angle (Dutch tilt or 45° composition)
**Subject placement:** Subject and lines move diagonally
**Effect:** Tension, dynamism, energy
**When to use:** Action beats, conflict, instability
**Example header:** `P## / 35mm / diagonal / [beat]`

### 14. Symmetrical Blocking
**Camera position:** Centered, balanced left/right
**Subject placement:** Subject dead center or mirrored composition
**Effect:** Formal, ritualistic, iconic
**When to use:** Ceremonies, reveals, branded hero shots
**Example header:** `P## / 50mm / symmetrical / [beat]`

### 15. Asymmetrical Balance
**Camera position:** Off-center, weighted to one side
**Subject placement:** Subject on rule-of-thirds intersection
**Effect:** Dynamic tension, modern, natural
**When to use:** Most modern cinema, conversational scenes, walking
**Example header:** `P## / 35mm / asymmetrical / [beat]`

### 16. Subject Partially Hidden
**Camera position:** Standard, subject blocked by object/body part
**Subject placement:** Only part of subject visible (face, hands, leg)
**Effect:** Mystery, fragmentation, voyeurism
**When to use:** Tease moments, slow reveals, gestural emphasis
**Example header:** `P## / 50mm / partially hidden / [beat]`

### 17. Environmental Scale
**Camera position:** Wide, subject dwarfed by environment
**Subject placement:** Subject small but emphasized by surroundings
**Effect:** Epic, awe, nature overpowering humanity
**When to use:** Outdoor scenes, architecture, before/after
**Example header:** `P## / 16mm ultra-wide / environmental scale / [beat]`

### 18. POV Composition
**Camera position:** Camera = character's eyes
**Subject placement:** Subject sees what we see (hands/tools visible)
**Effect:** Immersion, first-person, video-game
**When to use:** Cooking POV, walk-throughs, hand-object close-ups
**Example header:** `P## / 24mm / POV / [beat]`

### 19. Layered Foreground/Midground/Background
**Camera position:** Deep focus, all planes visible
**Subject placement:** 3 distinct depth layers, all in focus
**Effect:** Story-telling density, environmental context
**When to use:** Establishing shots, busy scenes, multi-character
**Example header:** `P## / 24mm / layered FG/MG/BG / [beat]`

---

## Imperfect Realism Texture Pack

Add this line to STYLE for cinematic texture (drop one or two per prompt):

```
[film grain], [haze], [soft focus falloff], [natural lighting], [practical light sources], [weather], [dust motes], [reflections on wet surface], [shadows with character], [environmental texture]
```

Pick the textures that match the scene:
| Texture | Best for |
|---------|----------|
| film grain | all cinematic, default |
| haze | outdoor, atmospheric, distance |
| soft focus falloff | romance, intimacy, dreams |
| motion blur | action, speed, walking |
| natural lighting | daylight, window light |
| practical light sources | lamps, candles, screens |
| weather | rain, snow, fog, mist |
| dust motes | sunbeam, attic, abandoned spaces |
| reflections on wet surface | rain, puddles, oil |
| shadows with character | window blinds, foliage, lace |
| environmental texture | brick, wood, concrete grain |

---

## Default Negatives (Cinematic Image)

Append to every cinematic image prompt to avoid generic/AI look:

```
no clean digital sharpness, no CGI look, no poster composition, no centered portrait, no black bars
```

Why each:
- **no clean digital sharpness** — keep grain, avoid sterile AI output
- **no CGI look** — anchor in photo-realism
- **no poster composition** — frame is mid-scene, not advertising
- **no centered portrait** — composition is dynamic, not mugshot
- **no black bars** — output is single image, not letterbox movie

---

## Composition Sweep Workflow

To **explore 10 visual languages for the same subject**:

1. Pick a key moment (e.g., "Maya holding the finished loaf")
2. Generate 10 prompts, each with a different style from the 19 above
3. Run all 10 through GPT Image 2
4. Review: which compositions land best for the story?
5. Pick the winner → use it as P01 of the storyboard
6. The runner-up compositions become alternate panels

The `/s2s cinematic-variations` command automates this sweep.

## Script-to-Storyboard Assignment (v1.6.2)

When the user arrives with a **full script** (not a brief to explore), use this table to assign ONE composition per panel based on the script's beat type. No exploration — direct assignment.

| Script beat type | Composition | Why |
|---|---|---|
| Hook / first frame | Handheld close OR POV | Immersion, "you are there" |
| Establishing / master | Environmental scale OR wide negative space | Geography, context |
| Character emotional | Reflection OR silhouette OR frame-in-frame | Interiority, mood |
| Action / impact | Extreme low angle OR diagonal | Energy, tension |
| Dialogue / two-person | OTS OR foreground obstruction | Intimacy, voyeurism |
| Reveal / hero moment | Symmetrical blocking OR compressed telephoto | Formal, iconic |
| Isolation / loneliness | Wide negative space OR deep vanishing point | Scale of absence |
| Tactile / close detail | POV OR handheld close | Touch, texture |
| Climax / peak | Diagonal OR compressed telephoto | Maximum dynamism |
| Resolution / settle | Asymmetrical balance OR layered FG/MG/BG | Natural, lived-in |

This table is also in the main SKILL.md under "Script-to-Storyboard Workflow". Use it when the user says "generate storyboard from this script" or "assign compositions per panel".

---

## Panel Header Convention (Updated)

Add the composition style as a 4th field in the panel header:

```
P## / [focal length]mm [shot type] / [composition style] / [beat name]
```

**Examples:**
- `P01 / 35mm close / handheld close / Kiss approach`
- `P02 / 24mm wide / environmental scale / Kitchen master`
- `P06 / macro insert / frame-in-frame / Egg crack`
- `P12 / 50mm counter / foreground obstruction / Loaf reveal`

This makes every panel's visual language explicit, so Seedance can match the intent.

---

## Related References

- `../commands/cinematic-variations.md` — automated 10-composition sweep
- `../commands/storyboard.md` — uses this vocab in panel headers
- `../references/seedance-motion-prompt.md` — applies texture pack to STYLE line
- `../references/storyboard-prompt-template.md` — fills in PANEL HEADERS with composition
