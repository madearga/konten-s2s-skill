# /s2s character-ref — Step 2a: Character Reference Image Prompt

Generates a **3-angle character sheet** for identity consistency across video generations. One variant: stylized character sheet.

---

## Trigger

- Manual: `/s2s character-ref`
- Auto-detect: "character sheet", "character reference", "consistent character", "identity ref"

If user is asking for a product reference (no human), use `/s2s product-ref` instead.

---

## Inputs to Gather (1-2 Clarifying Questions)

| Field | Example | Required? |
|-------|---------|-----------|
| Character archetype | "young Indonesian woman" / "middle-aged man, casual" | Required |
| Style | "3D stylized" / "anime" / "Pixar-like" | Required (default: 3D stylized semi-realistic) |
| Age range | "25" / "40-50" | Required |
| Key visual features | "dark hair, dimples, small mole" | Recommended |
| Outfit | "casual streetwear" / "business casual" | Recommended |

**Q-template:**

```
Q1: What's the character?
    A) [first guess]
    B) [alternative]
    C) Let me describe

Q2: Style?
    A) 3D stylized (semi-realistic, default)
    B) Pixar-like (rounder, more cartoon)
    C) Anime (2D, stylized)
    D) Real human (NOT recommended for Seedance — use Kling 3.0)

Q3: Outfit/vibe?
    A) Casual (jeans + t-shirt)
    B) Streetwear (sneakers + joggers)
    C) Formal (suit)
    D) Describe
```

---

## Behavior

1. Parse character brief
2. Load `../references/character-ref-prompt.md`
3. Fill in the 3-angle template
4. Add the user's character details (age, hair, outfit, features)
5. Run QC checklist (8 items)
6. Output: copy-paste-ready prompt + checklist + path-saving reminder

---

## Output Format

```
## Character Reference Prompt (GPT Image 2)

```
<prompt text — 3-angle character sheet with consistency locks>
```

## QC Checklist
- [✓] Age range specified
- [✓] Hair, build, skin tone described
- [✓] Outfit fully detailed (top + bottom + shoes + accessories)
- [✓] "Expression default" defined
- [✓] 3 angles specified (3/4 front, front, side profile)
- [✓] Style locked (3D stylized, semi-realistic)
- [✓] Color palette chosen
- [✓] Consistency locks present (no redesign, no age-shift, no duplicate)
- [✓] Negative prompts: no text, no labels, no other people

## Save the Output
- Generate the image in GPT Image 2
- Save as `character.png` (or any memorable name)
- **Note the file path** — you'll need it for `/s2s motion` as `@[character ref]`

## Cost & Time
- GPT Image 2: ~$0.07, ~30s
- Total Step 2a: ~3 min (mostly reviewing prompt before send)

## Suggested Next Step
- If your video also has a product → run `/s2s product-ref`
- If character-only → run `/s2s motion` with storyboard.png + character.png paths
```

---

## Common Errors

| User Input | Error | Fix |
|------------|-------|-----|
| "Make her look like a real person" | Seedance face-block issue | Switch to stylized 3D or use Kling 3.0 |
| "Just one angle" | Bad identity transfer | Force 3-angle spec |
| "Add some props" | Props go in storyboard, not ref | Ref = empty hands only |
| Vague age "young" | GPT picks random | Force concrete: "25" or "early 30s" |

---

## Related

- `../references/character-ref-prompt.md` — full template + worked example
- `../references/cinematic-composition-vocabulary.md` — 19 cinematic styles for the 3-angle layout
- `product-ref.md` — for product-only videos
- `motion.md` — uses this as @[character ref]
- `cinematic-variations.md` — pre-visualize the 3-angle layout with 10 compositions first
