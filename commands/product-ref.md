# /s2s product-ref — Step 2b: Product Reference Image Prompt

Generates a **product reference image** with 4 variants: `hero`, `multi-angle`, `lifestyle`, `sheet`. For product-only videos (FMCG, beauty, fashion, electronics, food).

---

## Trigger

- Manual: `/s2s product-ref` or `/s2s product-ref --type=<hero|multi-angle|lifestyle>`
- Auto-detect: "product reference", "product sheet", "product hero", "product lifestyle"

If user is asking for a character reference (human), use `/s2s character-ref` instead.

---

## Inputs to Gather (1-2 Clarifying Questions)

| Field | Example | Required? |
|-------|---------|-----------|
| Product type | "blue sneakers" / "skincare serum" / "protein bar" | Required |
| Variant (or pick via --type) | hero / multi-angle / lifestyle / sheet | Required |
| Material + color | "mesh upper, deep blue, white midsole" | Required |
| Key features | "logo placement, distinctive texture" | Recommended |
| Ad vibe | "premium" / "lifestyle" / "energetic UGC" | Recommended |

**Q-template:**

```
Q1: What's the product?
    A) [first guess]
    B) [alternative]
    C) Describe

Q2: Which variant?
    A) Hero (clean studio, single product, white background) — best for: hero shots, beauty, e-commerce
    B) Multi-angle (4-angle grid, identity for cuts) — best for: FMCG, beauty, health
    C) Lifestyle (product in setting) — best for: aspirational UGC, contextual ads
    D) Sheet (6-panel comprehensive reference, 21:9) — best for: brand kit, multi-video asset library, all-angle coverage in 1 generation
```

---

## Behavior

1. Parse product brief + variant
2. Load `references/product-ref-prompt.md`
3. Fill in the appropriate variant template
4. **If variant = `sheet`**: load the sheet-specific template (6-panel 21:9 layout)
5. **Always add to negative prompts: "no human hands, no human fingers, no human body parts"** (most common failure)
6. **Always add to negative prompts: "no logos added by AI, no watermarks, no text"**
7. Run QC checklist
8. Output: copy-paste-ready prompt + checklist + variant rationale
9. **If variant = `sheet`**: remind user they can crop individual panels as separate `@[product ref]` for different videos

---

## Output Format

```
## Product Reference Prompt (GPT Image 2)

**Variant:** <hero | multi-angle | lifestyle>
**Why this variant:** <1-line rationale>

```
<prompt text — variant-specific template with all 4 sections filled>
```

## QC Checklist (All Variants)

- [ ] Product name + category specified
- [ ] Material, color, key features described
- [ ] Style locked (studio, lighting, background)
- [ ] Composition specified (angle, padding, camera)
- [ ] Consistency locks present (no redesign, no recolor, no extra parts)
- [ ] **"No human hands" in negative** ← most common failure
- [ ] **"No text, no logos, no watermarks" in negative**
- [ ] **Default cinematic negatives appended:** `no clean digital sharpness, no CGI look, no poster composition, no centered portrait, no black bars`

## Save the Output
- Generate the image in GPT Image 2
- Save as `product.png` (or any memorable name)
- **Note the file path** — you'll need it for `/s2s motion` as `@[product ref]`

## Cost & Time
- GPT Image 2: ~$0.07, ~30s
- Multi-angle may need 1-2 re-rolls (~$0.14-0.21)
- Lifestyle variant highest re-roll rate (budget 2-3x)
- Total Step 2b: ~3-10 min depending on variant

## Suggested Next Step
- If your video also has a character → run `/s2s character-ref` first
- If product-only → run `/s2s motion` with storyboard.png + product.png paths
```

---

## Variant Selection Guide

| Scenario | Best Variant | Reason |
|----------|--------------|--------|
| FMCG (snacks, drinks, supplements) | `multi-angle` | Identity across cuts, professional look |
| Beauty/skincare hero | `hero` | Premium feel, single clear frame |
| Fashion (sneakers, apparel) | `lifestyle` | Aspiration + setting sells the product |
| Electronics (phones, earbuds) | `hero` or `multi-angle` | Clean tech aesthetic |
| Food/cooking (the dish) | `lifestyle` | Dish in kitchen context |
| e-commerce product page | `multi-angle` | Full coverage for buyer confidence |
| Quick UGC ad | `lifestyle` | Fastest to one usable frame |
| Brand kit / multi-video asset | `sheet` | 6 panels in 1 generation, crop per-panel for different @[product ref] |
| Product with important back/side details | `sheet` | Captures front, back, side, texture, hero, in-use all at once |
| Budget optimization (6 videos, 1 product) | `sheet` | $0.07 total vs $0.42 for 6 separate generations |

---

## Common Errors

| User Input | Error | Fix |
|------------|-------|-----|
| "Show a hand holding the product" | GPT defaults to hands; hands ruin product shot | Add explicit "no human hands" negative + push back to user |
| "Make it look like Apple ad" | Triggers AI adding fake Apple logo | Add "no logos added by AI" + "no brand text" |
| Lifestyle without setting context | Vague | Force specific setting: "kitchen counter" / "vanity table" / "running trail" |
| "Just generate" (no product spec) | Can't generate | Force concrete: name, category, color, material |

---

## Related

- `../references/product-ref-prompt.md` — full template + 3 variants
- `../references/cinematic-composition-vocabulary.md` — 19 cinematic styles for the product hero shot
- `character-ref.md` — for character-driven videos
- `motion.md` — uses this as @[product ref]
- `cinematic-variations.md` — pre-visualize the product shot with 10 compositions first
