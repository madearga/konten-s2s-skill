# Character Reference Prompt (GPT Image 2)

Generates a **multi-angle character sheet** for identity consistency across video generations. Use this as `@[character ref]` when running Seedance motion prompts.

---

## When to Use

- Your video has a **human/character as the primary subject**
- You want consistent face/body/proportions across multiple shots or re-rolls
- The character will appear in a storyboard panel sequence

If your video is **product-only** (no human), use `/s2s product-ref` instead.

---

## The Template (Drop Into GPT Image 2)

```
Create a 16:9 character reference sheet for [CHARACTER_NAME] used across a [GENRE] video.

[SUBJECT]
[CHARACTER_NAME]: [age range], [ethnicity/look if relevant], [hair color + length + style], [build], [skin tone], [distinctive features: freckles, dimples, scar, glasses, etc.].
Outfit: [top], [bottom], [shoes], [accessories]. Keep outfit consistent across all 3 angles.
Expression default: [neutral, slight smile, focused, etc. — the "resting" face for this character].

[STYLE]
3D stylized character design, semi-realistic proportions, slightly stylized features (NOT chibi, NOT hyperreal).
Clean color palette: [choose palette: warm/fresh/muted/saturated].
Soft cinematic lighting, neutral background (off-white or soft gradient).
NO text, NO logos, NO watermarks, NO panel borders, NO captions.

[ANGLES]
3 character views arranged side-by-side:
- Left panel: 3/4 front view (waist up, slight turn)
- Center panel: front view (waist up, eyes forward)
- Right panel: side profile (waist up, looking 90° screen-right)
All 3 views use identical proportions, identical outfit, identical color palette, identical lighting.

[CONSISTENCY LOCKS]
Face geometry, hair shape, outfit details, and body proportions MUST be identical across all 3 views.
Do not redesign, age-shift, beautify, duplicate, merge, or add another character.
Do not add props held in hands (empty hands only).
Do not place the character in any environment — clean reference background only.

[NEGATIVE]
No text, no labels, no arrows, no logos, no watermarks, no other people, no background scenery, no UI overlays.
```

---

## Fill-In Example (Indonesian Woman, Casual Streetwear)

```
Create a 16:9 character reference sheet for Maya used across a cooking UGC ad.

[SUBJECT]
Maya: 25, Indonesian, dark brown shoulder-length wavy hair, athletic build, warm tan skin, small mole below right eye, dimpled smile.
Outfit: cream linen shirt (sleeves rolled), high-waist dark jeans, white canvas sneakers, small gold hoop earrings.
Expression default: warm, slight smile, direct eye contact with camera.

[STYLE]
3D stylized character design, semi-realistic proportions, slightly stylized features (NOT chibi, NOT hyperreal).
Clean color palette: warm earth tones (cream, terracotta, sage, soft brown).
Soft cinematic lighting from screen-left, neutral cream background.

[ANGLES]
3 character views arranged side-by-side:
- Left panel: 3/4 front view (waist up, slight turn)
- Center panel: front view (waist up, eyes forward)
- Right panel: side profile (waist up, looking 90° screen-right)

[CONSISTENCY LOCKS]
Face geometry, hair shape, outfit details, and body proportions MUST be identical across all 3 views.
Do not redesign, age-shift, beautify, duplicate, merge, or add another character.
Do not add props held in hands (empty hands only).

[NEGATIVE]
No text, no labels, no arrows, no logos, no watermarks, no other people, no background scenery, no UI overlays.
```

---

## QC Checklist Before Sending to GPT Image 2

- [ ] Age range, hair, build, skin tone specified
- [ ] Outfit fully described (top + bottom + shoes + accessories)
- [ ] "Expression default" defined
- [ ] 3 angles specified (3/4 front, front, side profile)
- [ ] Style locked (3D stylized, semi-realistic)
- [ ] Color palette chosen
- [ ] Consistency locks present (no redesign, no age-shift, no duplicate)
- [ ] Negative prompts present (no text, no labels, no other people)

---

## Pitfalls

1. **Vague age range** — "young adult" → "25". GPT needs concrete numbers.
2. **Outfit with too many details** — keep outfit to 4-5 items max. Detail = noise = inconsistency.
3. **Forgetting 3-angle spec** — 2 angles = bad identity transfer. 3 angles minimum.
4. **Inconsistent style across angles** — explicitly say "identical proportions, identical outfit, identical lighting."
5. **Adding props to hands** — empty hands only. Props belong in storyboard panels, not in the reference sheet.
6. **Hyperrealistic style** — if you go hyperreal, identity transfer degrades. Stay stylized.
7. **Missing ethnicity/look markers** — vague "person" → GPT picks random ethnicity. Be explicit if it matters.

---

## Variants

| Variant | Use Case | Output |
|---------|----------|--------|
| **Default** (above) | Single human character, identity-ready | 3-angle sheet |
| **Multi-character** | 2+ characters in same video | 2 separate sheets, one per character |
| **Stylized extreme** | Anime/chibi video | Use 2D anime template instead (different prompt) |
| **Real human** | Forbidden by Seedance 2.0 face-blocking — use Kling 3.0 instead | N/A |

For **multi-character** videos, generate one sheet per character. Keep the second character as a different `@[character ref]` for Seedance to disambiguate.

---

## Related References

- `storyboard-prompt-template.md` — Step 1 (storyboard image)
- `seedance-motion-prompt.md` — Step 3 (motion, uses this as @[character ref])
- `banana-bread-worked-example.md` — full worked example
- `../commands/character-ref.md` — slash command spec
