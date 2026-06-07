# Product Reference Prompt (GPT Image 2)

Generates a **product reference image** for consistency across video generations. Three variants via `--type` flag: `hero`, `multi-angle`, `lifestyle`. Use this as `@[product ref]` when running Seedance motion prompts.

---

## When to Use

- Your video has a **product as the primary subject** (FMCG, beauty, fashion, electronics, food, etc.)
- You want consistent product appearance across multiple shots or re-rolls
- The product will appear in a storyboard panel sequence

If your video is **character-driven** (human as subject), use `/s2s character-ref` instead. If both, generate both references.

---

## Variant 1: HERO (`/s2s product-ref --type=hero`)

Single product, clean studio, white background, advertising hero shot. Best for: **pack shots, beauty/skincare, e-commerce hero frames**.

### Template

```
Create a 16:9 product hero shot of [PRODUCT_NAME] for advertising.

[PRODUCT]
[PRODUCT_NAME]: [category — e.g., "blue sneakers", "skincare serum bottle", "protein bar"].
Material: [leather, plastic, glass, etc.].
Color: [primary color], [secondary accents].
Size cues: [palm-sized, full-frame, etc.].
Key features: [logo placement, texture, branding elements, distinctive details].

[STYLE]
Studio product photography, clean white or soft gradient background.
Soft 3-point lighting: key light from upper-left, fill from right, soft rim from behind.
Subtle reflection on the surface beneath the product.
Sharp focus on the product, slight bokeh on background.

[COMPOSITION]
Product centered, occupying 50-70% of the frame.
Slight 3/4 angle (not flat front, not full side) to show dimension.
Padding 10-15% around product for camera movement in video.
Eye-level camera (matches product placement on a real shelf).

[NEGATIVE]
No human hands, no human fingers, no human arms, no human body parts.
No text overlays, no logos added by AI, no watermarks, no price tags, no labels, no captions.
No other products, no background clutter, no shadows from other objects.
No distorted proportions, no melted/warped surfaces, no extra parts.
```

### Fill-In Example (Blue Sneakers)

```
Create a 16:9 product hero shot of blue sneakers for advertising.

[PRODUCT]
Blue sneakers: minimalist running shoes, low-top silhouette.
Material: mesh upper, rubber sole, synthetic overlays.
Color: deep ocean blue upper, white midsole, dark grey outsole.
Size cues: full-frame, single product, occupies 60% of frame.
Key features: white brand stripe on side, padded collar, lace-up closure.

[STYLE]
Studio product photography, clean white background.
Soft 3-point lighting: key light from upper-left, fill from right, soft rim from behind.
Subtle reflection on white surface beneath the product.
Sharp focus on sneakers, slight bokeh on background.

[COMPOSITION]
Product centered, occupying 50-70% of the frame.
Slight 3/4 angle (not flat front, not full side).
Padding 10-15% around product for camera movement.
Eye-level camera.

[NEGATIVE]
No human hands, no human fingers, no human arms, no human body parts.
No text overlays, no logos added by AI, no watermarks, no price tags.
No other products, no background clutter, no distorted proportions.
```

---

## Variant 2: MULTI-ANGLE (`/s2s product-ref --type=multi-angle`)

4-angle grid for consistency across frames. Best for: **FMCG/Beauty/Health (Babypapaya-style), rotating product reveals, side-by-side product lines**.

### Template

```
Create a 16:9 product reference grid showing [PRODUCT_NAME] from 4 angles.

[PRODUCT]
[SAME PRODUCT SPEC AS HERO VARIANT]
[product name, category, material, color, key features — identical across all 4 angles]

[STYLE]
Studio product photography, clean white or soft gradient background.
Consistent 3-point lighting across all 4 panels.
Sharp focus on product in every panel.

[GRID]
4 panels arranged 2x2:
- Top-left: front view (camera straight on)
- Top-right: 3/4 view (slight angle, ~30° turn)
- Bottom-left: side profile (90° turn, full silhouette)
- Bottom-right: 45° elevated angle (top-down 3/4, shows top surface)

[CONSISTENCY LOCKS]
Material, color, branding, texture MUST be identical across all 4 views.
Do not redesign, recolor, add logos, remove details, or alter proportions.
Product must occupy same relative size in each panel.
Background must be identical (same color, same lighting) across all 4 panels.

[NEGATIVE]
No human hands, no human fingers, no human arms.
No text overlays, no labels, no angle tags inside panels, no panel borders.
No other products, no background scenery, no watermarks.
No distorted proportions or warped surfaces.
```

### Why Multi-Angle

This is the **default for FMCG/Beauty/Health** content (Babypapaya-style). One multi-angle reference image gives Seedance 4 view options for any shot, keeping product identity stable across cuts and re-rolls.

---

## Variant 3: LIFESTYLE (`/s2s product-ref --type=lifestyle`)

Product in lifestyle setting. Best for: **aspirational UGC, contextual ads, "product in real life" storytelling**.

### Template

```
Create a 16:9 lifestyle shot of [PRODUCT_NAME] in a real-world setting.

[PRODUCT]
[SAME PRODUCT SPEC]

[SETTING]
Location: [kitchen counter, vanity table, gym bag, running trail, café table, etc.]
Atmosphere: [morning sunlight, warm lamp glow, natural daylight, soft fog, etc.]
Supporting elements: [subtle props that don't compete with product — a hand towel, a coffee cup, a folded jacket, etc. — no people].

[STYLE]
Editorial product photography, shallow depth of field, product in sharp focus.
Natural lighting matching the setting.
Color palette: [warm, fresh, muted, etc.].
Mood: [cozy, energetic, luxurious, minimal, etc.].

[COMPOSITION]
Product occupies 30-50% of frame (smaller than hero shot — product is part of a scene).
Rule of thirds: product on left or right third, not dead center.
Foreground: [table edge, soft bokeh element]
Midground: product
Background: setting context (slightly out of focus)

[NEGATIVE]
No human hands, no human fingers, no human arms, no human body parts, no faces.
No text overlays, no logos added by AI, no watermarks, no price tags.
No other competing products, no clutter, no distracting elements.
No distorted proportions, no warped product surfaces.
```

### Why Lifestyle

Use when the **setting IS the message**. E.g., perfume on a vanity = luxury. Sneakers on a trail = adventure. Skincare in a sunlit bathroom = self-care ritual.

**Pitfall:** Lifestyle variant has the **highest re-roll rate** because GPT Image sometimes adds human hands, makes the product too small, or invents distracting background elements. Budget 2-3 re-rolls.

---

## QC Checklist (All Variants)

- [ ] Product name + category specified
- [ ] Material, color, key features described
- [ ] Style locked (studio, lighting, background)
- [ ] Composition specified (angle, padding, camera)
- [ ] Consistency locks present (no redesign, no recolor, no extra parts)
- [ ] **Negative prompts include "no human hands"** ← most common failure
- [ ] **Negative prompts include "no text, no logos, no watermarks"**

---

## Pitfalls (All Variants)

1. **Human hands appearing** — GPT Image defaults to "person holding product." Add explicit "no human hands" to negative.
2. **AI adding fake logos** — GPT sometimes invents brand text. Add "no logos added by AI" to negative.
3. **Product too small in frame** — be explicit: "occupies 50-70% of frame."
4. **Inconsistent colors across angles** (multi-angle) — repeat color spec in consistency locks.
5. **Distorted proportions** — "no distorted proportions, no warped surfaces."
6. **Lifestyle variant with people** — explicitly ban "no human hands, no human body parts, no faces."
7. **Missing padding for motion** — Seedance needs 10-15% room to move. Without padding, motion is cramped.

---

## Variant Selection Guide

| Scenario | Best Variant | Reason |
|----------|--------------|--------|
| FMCG ad (snacks, drinks, supplements) | `multi-angle` | Identity across cuts, professional look |
| Beauty/skincare hero shot | `hero` | Premium feel, single clear frame |
| Fashion (sneakers, apparel) | `lifestyle` | Aspiration + setting sells the product |
| Electronics (phones, earbuds) | `hero` or `multi-angle` | Clean tech aesthetic |
| Food/cooking (the dish itself) | `lifestyle` | Dish in kitchen context |
| e-commerce product page | `multi-angle` | Full coverage for buyer confidence |
| Quick UGC ad | `lifestyle` | Fastest to one usable frame |

---

## Related References

- `references/character-ref-prompt.md` — for character-driven videos
- `references/seedance-motion-prompt.md` — Step 3 (uses this as @[product ref])
- `commands/product-ref.md` — slash command spec
- `../SKILL.md` section 2.7 (First+Last Frame) — simpler alternative
