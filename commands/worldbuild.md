# /s2s worldbuild — Imagined World Through 9 Cinematic Stills

Turns a one-line spark (idea, mood, culture, place, name, genre, or reference image) into 9 cinematic still-image prompts that all belong to the same unseen film. Use this when the world itself is the deliverable, not a single character or a motion clip.

**Capability:** Pre-pipeline worldbuilding
**Trigger:** `/s2s worldbuild`, `/s2s-worldbuild`, "bangun dunia", "worldbuilding", "eksplorasi dunia", "eksplorasi visual", "dunia imajiner", "9 stills"

**Companion skill:** Loads `kuka-worldbuilder` from the local Hermes skills library. The command routes the input to that skill and returns its standard 9-aspect output. If the skill is not installed locally, the command prints the install hint instead of failing.

---

## When to Use

- User has a world, setting, or atmosphere and wants to explore it visually before locking a story
- User wants a batch of visually coherent stills that read as one world/film, for pitching, moodboarding, or pre-production
- User uploads a reference image and wants a world built out from its subject, setting, color, architecture, body covering, mood, lighting, or culture
- User wants 9 stills as a "world bible" that motion clips can later pull from

This is a **still-image, worldbuilding-first** pre-step. If the user already has a locked story/character and wants motion/video prompts, hand off to `/s2s storyboard` + `/s2s motion` instead. If they want a single character built and locked, that's `/s2s character-ref` territory.

## Behavior

1. Accept any single input: a phrase, mood, genre, name, culture, place, or uploaded reference image. Don't run a long intake questionnaire first.
2. Load the `kuka-worldbuilder` skill from the local skills library.
3. Run that skill's standard 9-aspect process: poetic world name, 2-3 sentence world concept, then 9 cinematic still-image prompts in this fixed order — Inhabitants, Animals, Architecture, Landscapes, Daily Life, Travel or Motion, Sound or Culture, Power or Intensity, Portrait.
4. Return the full 9-aspect output as a markdown block. Each aspect includes a one-sentence world-building note plus a full cinematic visual prompt (subject placement, environment, body covering, materials, lighting, weather, camera distance, cinematic realism, ending with the standard negative add-on).
5. Append a hand-off block at the end pointing to `/s2s storyboard` for converting any chosen aspect into a 12-section storyboard prompt, and `/s2s motion` for the next step toward video.

If the input is genuinely empty, ask one short question: what spark do you want to build from.

## Output Format

```
[Poetic World Name]

World Concept:
[2-3 sentence concept]

Inhabitants
World-Building Note: [one brief visual sentence]
Prompt:
[full cinematic visual prompt]

Animals
World-Building Note: [one brief visual sentence]
Prompt:
[full cinematic visual prompt]

... continue through all 9 aspects in order (Architecture, Landscapes, Daily Life,
Travel or Motion, Sound or Culture, Power or Intensity, Portrait) ...

---
Next steps:
- Pick 1-2 strongest aspects and run `/s2s storyboard` to turn them into a 12-section storyboard
- Then `/s2s character-ref` or `/s2s product-ref` if the chosen scene needs identity or product lock
- Then `/s2s motion` to generate the Seedance motion prompt for the scene
```

Always generate all 9 aspects in one pass, in the order listed, unless the user asks for a specific subset.

## Companion Skill

`kuka-worldbuilder` (Hermes Agent, MIT) — a cinematic worldbuilding director that turns any idea, mood, culture, place, name, genre, or reference image into a believable imaginary world told through 9 cinematic still-image prompts. See `references/companion-worldbuilder.md` for install + cross-platform notes.

## Example

```
/s2s worldbuild Jakarta 2099
/s2s worldbuild a world where rain is currency
/s2s worldbuild Norse whalers + uploaded reference photo
```

## Pipeline Position

`/s2s worldbuild` is an **upstream pre-step**, not a substitute for any existing command. It produces a still-image world bible that other commands can draw from:

```
/s2s worldbuild  →  /s2s storyboard (per chosen aspect)  →  /s2s character-ref  →  /s2s motion
```

## License

Command file: MIT. Companion `kuka-worldbuilder` skill: MIT.
