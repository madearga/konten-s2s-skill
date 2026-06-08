# Product Reference Prompt (GPT Image 2)

Generates a **product reference image** for consistency across video generations. Four variants via `--type` flag: `hero`, `multi-angle`, `lifestyle`, `sheet`. Use this as `@[product ref]` when running Seedance motion prompts.

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

## Variant 4: IN-USE (`/s2s product-ref --type=in-use`) — v1.2.0

Product being **actively used** by hands/person. Best for: **UGC tutorials, demos, "show me how" content, hands-on reviews**.

### Template

```
Create a 16:9 product-in-use shot showing [PRODUCT_NAME] being actively used.

[PRODUCT]
[SAME PRODUCT SPEC]

[USAGE SCENE]
User action: [applying serum to face / holding mug of coffee / wearing sneakers while walking / brushing teeth with toothpaste / pouring cereal / etc.]
Hand position: [visible hands performing the action / one hand / both hands / etc.]
Body context: [close-up of hands and product / mid-shot with arm visible / etc.]
Stage of use: [opening the package / mid-use / finishing the action / showing results / etc.]

[STYLE]
Natural lighting, real-world context (kitchen, bathroom, gym, outdoor, etc.).
Show the product in its **functional moment**, not just a static display.
Sharp focus on the product + the action it's involved in.
Color palette: [match product brand, warm/cool/neutral].
Mood: [instructional, intimate, demonstrative, etc.].

[COMPOSITION]
Product occupies 30-50% of frame (similar to lifestyle).
Hands/body **partially visible** (not full character — focus on product).
Rule of thirds: product on action point.
Depth of field: shallow, product sharp, background bokeh.
Show the interaction: hand-to-product contact visible.

[NEGATIVE]
No human faces (focus on hands/product, not portrait).
No text overlays, no logos added by AI, no watermarks, no price tags.
**No unrealistic hand anatomy** (6 fingers, weird angles, distorted knuckles) ← most common failure
**No full character portraits** (only hands + product, not person's face)
No other products competing for attention.
No distorted proportions, no warped product surfaces.
```

### Why IN-USE is Different from LIFESTYLE

| Aspect | LIFESTYLE | IN-USE |
|--------|-----------|--------|
| **Product state** | Static, displayed in setting | Active, being manipulated |
| **Human presence** | No humans (product alone) | Hands/arms visible (doing the action) |
| **Action** | None (just sits there) | Specific (apply, hold, pour, brush, wear) |
| **Focus** | Setting + product mood | Product + hand interaction |
| **Best for** | Aspirational UGC, "the vibe" | Tutorial, demo, "how-to" |
| **Example brief** | "Perfume on marble vanity" | "Hand applying serum to face" |
| **Example brief (ID)** | "Sepatu sneakers di rak display" | "Tangan pakai serum di wajah" |

### IN-USE Variant Selection Guide

| Scenario | Pick this | Reason |
|----------|-----------|--------|
| Beauty/skincare tutorial | **in-use** | Show application, dropper, rub-in |
| Cooking/recipe demo | **in-use** | Show pouring, stirring, plating |
| Fashion/sneaker showcase | **lifestyle** or **multi-angle** | Static, not interactive |
| Tech product (phone, earbuds) | **multi-angle** or **hero** | Static showcase |
| FMCG/snack | **in-use** | Show opening, eating, pouring |
| Drink/beverage | **in-use** | Show pouring, holding, sipping |
| App/software (no physical product) | N/A | Use character-ref + screen recording |
| Supplement/vitamin | **in-use** | Show bottle, hand, pill, water |

### IN-USE Pitfalls

1. **Human face appears** — GPT Image defaults to portrait. Add explicit "no human faces" to negative.
2. **Unrealistic hand anatomy** — most common failure. Add "no unrealistic hand anatomy, no 6 fingers, no weird angles."
3. **Full character instead of just hands** — force "hands and product, not full character."
4. **Product too small** — same as lifestyle, be explicit: "occupies 30-50% of frame."
5. **Lost action context** — "user is doing X" must be clear. Specify: "user applying serum" not "person near product."
6. **Cluttered scene** — keep background clean. Lifestyle has 1-2 supporting props; in-use should have just the action context.

### IN-USE Detection Logic (for auto-selection in `/s2s pipeline`)

When the brief contains **usage verbs**, default to `in-use`:
- EN: `use`, `apply`, `wear`, `hold`, `drink`, `eat`, `rub`, `brush`, `pour`, `apply`, `wear`, `swipe`, `spray`, `tap`, `click`, `press`, `cook with`, `pour`, `squeeze`
- ID: `pakai`, `minum`, `makan`, `oles`, `sikat`, `tuang`, `semprot`, `tekan`, `masak pakai`, `perasan`

When brief contains **display verbs**, default to other variants:
- `show`, `display`, `feature`, `tampilkan`, `pamerkan` → `hero` or `multi-angle`
- `in setting`, `on shelf`, `di rak`, `di etalase` → `lifestyle`

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
## Variant 5: SHEET (`/s2s product-ref --type=sheet`)

6-panel comprehensive reference sheet in 21:9 wide layout. All angles + texture + in-use in a single generation. Best for: **brand kits, multi-video asset libraries, products with important details on multiple sides**.

### Why Sheet

- **Cost efficient**: 1 generation ($0.07) covers 6 angles vs 6 separate generations ($0.42)
- **Multi-video**: Crop individual panels as separate `@[product ref]` for different Seedance videos
- **Complete documentation**: Front, back, side, hero, texture, and in-use all captured
- **Consistency guarantee**: All 6 panels are generated simultaneously — zero drift between angles

### Template

```
Create a 21:9 wide product reference sheet for [PRODUCT_NAME] — [brief description: "pastel pink skincare pump bottle with white cap, 150ml, matte finish"].

6 panels in a clean evenly-spaced grid, soft neutral studio background with even lighting, minimal shadows.

PANEL 1 — FRONT VIEW:
Show the product standing upright, shot from directly front. Label must be fully visible, centered, and readable. Packaging colors must be accurate. Place the label "FRONT VIEW" centered below.

PANEL 2 — BACK VIEW:
Show the product from the back with accurate rear packaging details (ingredients list area, barcode region, secondary text). Maintain color consistency. Place the label "BACK VIEW" centered below.

PANEL 3 — SIDE PROFILE:
Show a strict side profile of the product. Silhouette must be clean and readable. Show cap/pump/spout detail from the side. Place the label "SIDE PROFILE" centered below.

PANEL 4 — HERO ANGLE:
Show the product from a 45-degree elevated angle. Reveal both front label and top/cap detail simultaneously. This is the most flattering composition. Place the label "HERO ANGLE" centered below.

PANEL 5 — MATERIAL DETAIL:
Show a macro close-up of the product surface. Reveal material texture: matte vs glossy finish, embossed text, pump mechanism detail, cap threading, label laminate, or any surface detail. Place the label "MATERIAL DETAIL" centered below.

PANEL 6 — IN-USE CONTEXT:
Show the product in a realistic use scenario — held by a hand mid-application (skincare), on a bathroom shelf among other real products, next to a filled glass (beverage), in a child's hand (toy), or on a kitchen counter (food). Environment must feel natural and lived-in, not studio-lit. Hands only — no human faces. Place the label "IN-USE CONTEXT" centered below.

[PRODUCT]
[PRODUCT_NAME]: [category — same spec as hero variant]
Material: [material details]
Color: [primary], [secondary accents]
Size cues: [relative size]
Key features: [logo, texture, branding, distinctive details]

[STYLE]
Photorealistic studio product photography, clean white-to-neutral gradient backdrop.
Panels 1-5: consistent 3-point studio lighting, soft neutral background.
Panel 6: natural environment lighting, lived-in feel.
Sharp focus on product in every panel.
Ultra-detailed, professional reference sheet, clean presentation.

[CONSISTENCY LOCKS]
Same product identity across ALL panels — zero redesign allowed.
Product colors, label text, logo, and proportions must remain IDENTICAL in every panel.
Packaging shape and cap/pump style must be consistent — no variation between views.
Lighting and color temperature consistent across panels 1-5 (panel 6 natural lighting allowed).
Labels must appear only below each panel and be centered.
Layout must be clean, evenly spaced, and easy to read.

[NEGATIVE]
No human faces (hands only for panel 6).
No background clutter, no overlapping panels.
No inconsistent packaging color, no inconsistent label design.
No mixed styles, no motion blur, no dramatic shadows.
No warped proportions, no fictional packaging details.
No logos added by AI, no watermarks, no extra text.
No competing brand logos.
```

### Fill-In Example (Pigeon Teens Skincare)

```
Create a 21:9 wide product reference sheet for Pigeon Teens BB Cream — pastel pink skincare pump bottle with white cap, 150ml, matte finish, "BB Cream" text on front label.

6 panels in a clean evenly-spaced grid, soft neutral studio background with even lighting, minimal shadows.

PANEL 1 — FRONT VIEW:
Show the product standing upright, shot from directly front. "Pigeon Teens" and "BB Cream" label must be fully visible, centered, and readable. Pastel pink bottle body with white pump cap. Place the label "FRONT VIEW" centered below.

PANEL 2 — BACK VIEW:
Show the product from the back with accurate rear packaging details — ingredients list area, directions text, barcode region. Maintain pastel pink color. Place the label "BACK VIEW" centered below.

PANEL 3 — SIDE PROFILE:
Show a strict side profile. Clean silhouette showing the slim cylindrical shape and white pump mechanism from the side. Place the label "SIDE PROFILE" centered below.

PANEL 4 — HERO ANGLE:
Show from a 45-degree elevated angle. Reveal both "Pigeon Teens" front label and the white pump top simultaneously. Most flattering angle. Place the label "HERO ANGLE" centered below.

PANEL 5 — MATERIAL DETAIL:
Macro close-up of the bottle surface. Reveal the matte soft-touch finish, subtle embossed dots pattern on the pink body, white pump mechanism with precise threading detail. Place the label "MATERIAL DETAIL" centered below.

PANEL 6 — IN-USE CONTEXT:
Show the product on a white bathroom shelf next to a small succulent plant and a folded white hand towel. Warm natural daylight from a window camera-left. No human body parts. Place the label "IN-USE CONTEXT" centered below.

[CONSISTENCY LOCKS]
Same product identity across ALL panels — pastel pink bottle, white pump, "Pigeon Teens" label.
Colors, label text, proportions identical in every panel.
Packaging shape consistent — slim cylinder with white pump cap.
Lighting consistent across panels 1-5, panel 6 natural daylight.

[NEGATIVE]
No human faces, no human hands (panel 6 exception).
No background clutter, no overlapping panels.
No inconsistent packaging color, no inconsistent label.
No mixed styles, no motion blur, no dramatic shadows.
No warped proportions, no fictional details.
No logos added by AI, no watermarks.
```

### Usage After Generation

The sheet can be used in 2 ways:

**Option A: Use entire sheet as `@[product ref]`**
- Seedance sees all 6 angles and picks the most relevant view per shot
- Best for: multi-angle video with product rotating

**Option B: Crop individual panels**
- Crop panel 1 (front) → use as `@[product ref]` for front-facing shots
- Crop panel 4 (hero) → use as `@[product ref]` for 45-degree shots
- Crop panel 6 (in-use) → use as `@[product ref]` for lifestyle shots
- Best for: targeted videos where you need 1 specific angle

### Sheet vs Other Variants

| Aspect | Hero | Multi-angle | Lifestyle | Sheet |
|--------|------|-------------|-----------|-------|
| Panels | 1 | 4 (2×2) | 1 | 6 (1×6 or 2×3) |
| Layout | 16:9 | 16:9 | 16:9 | 21:9 |
| Cost | $0.07 | $0.07 | $0.07 | $0.07 |
| Re-rolls | 1x | 1-2x | 2-3x | 1-2x |
| Best for | Single shot | 4-angle coverage | Context/story | **All-in-one asset** |
| Multi-video | ❌ | ⚠️ 4 angles | ❌ | ✅ 6 crops |
| Budget-friendly | ✅ | ✅ | ❌ | ✅✅ |

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
