# /s2s product-ref — Step 2b: Product Reference Image Prompt

Generates a **product reference image** for AI video generation. 5 styles available. User picks by number or describes what they want in natural language.

---

## Trigger

- Manual: `/s2s product-ref` followed by product description
- Auto-detect: "product reference", "product sheet", "product hero", "bikin gambar produk", "referensi produk", "foto produk"

If user is asking for a character reference (human), use `/s2s character-ref` instead.

If the user has **uploaded reference image(s)** of the product, default to `--type=sheet` and instruct the image generator to respect the uploaded image(s) as the source of truth using the `SUBJECT = [All Uploaded product]` pattern.

---

## How Users Pick a Style

### Option A: Numbered Menu (recommended for non-dev)

Show this menu when user hasn't specified a style:

```
Pilih jenis gambar produk:
  1. 📸 Studio bersih — 1 foto, background putih, premium
  2. 🔄 Multi-angle — 4 sisi produk (depan/samping/miring/atap)
  3. 🏠 Lifestyle — produk di tempat asli (kamar, dapur, dll)
  4. ✋ Sedang dipakai — hands-on demo, tutorial feel
  5. 📋 Full sheet — 6 panel semua sisi, hemat budget

Ketik angka atau deskripsi bebas.
```

### Option B: Natural Language (auto-detect)

User just describes what they want — AI detects the best style:

| User says... | Auto-pick |
|---|---|
| **uploaded reference image(s) present** | **5. Full sheet (default)** |
| "foto produk clean", "studio", "background putih", "premium" | 1. Studio |
| "dari semua sisi", "multi-angle", "4 angle", "grid" | 2. Multi-angle |
| "di kamar", "di dapur", "di rak", "lifestyle", "setting asli" | 3. Lifestyle |
| "lagi dipakai", "tutorial", "demo", "hands-on", "cara pakai" | 4. Sedang dipakai |
| "semua angle", "brand kit", "reference sheet", "komprehensif" | 5. Full sheet |
| "pakai", "minum", "makan", "oles", "tuang", "semprot" (ID verbs) | 4. Sedang dipakai |
| "tampilkan", "pamerkan", "showcase" | 1. Studio |
| (no clear keywords, no images) | 2. Multi-angle (default) |

### Option C: Dev flag (for technical users)

Dev users can still use: `/s2s product-ref --type=<hero|multi-angle|lifestyle|in-use|sheet>`

This bypasses auto-detection and menu. Only use when user explicitly types `--type`.

---

## 5 Styles Reference

| # | Style | Layout | Best For | Cost |
|---|-------|--------|----------|------|
| 1 | Studio (hero) | 16:9, single | Beauty, e-commerce, premium display | $0.07 |
| 2 | Multi-angle | 16:9, 2×2 grid | FMCG, rotating reveals, product pages | $0.07 |
| 3 | Lifestyle | 16:9, single | Aspirational UGC, contextual storytelling | $0.07 |
| 4 | Sedang dipakai (in-use) | 16:9, single | Tutorials, demos, "cara pakai" content | $0.07 |
| 5 | Full sheet | 21:9, 6-panel grid | Brand kit, multi-video asset, semua sisi | $0.07 |

---

## Inputs to Gather

| Field | Example | Required? |
|-------|---------|-----------|
| Product name | "Pigeon Teens BB Cream" / "Hori Baby Snack" | Required |
| Style (1-5) | Auto-detect from description, or user picks | Auto |
| Material + color | "pastel pink bottle, white pump cap" | Required |
| Key features | "logo di depan, matte finish, pump mechanism" | Recommended |

**Only ask questions if info is missing.** If user already described the product well, skip straight to generation.

---

## Behavior

1. Parse product description
2. **Detect uploaded reference image(s)** — if present, default to `sheet` variant
3. Auto-detect style from keywords if no images (or show numbered menu if unclear)
4. Load `../references/product-ref-prompt.md` — pick matching variant template
5. If images present, fill `SUBJECT = [All Uploaded product]`, `BRAND = [brand name]`, `CATEGORY = [category]`, and add `RESPECT THE REFERENCE IMAGES` block
6. **Always add to negative prompts:** "no human hands, no human fingers, no human body parts" (most common failure)
7. **Always add to negative prompts:** "no logos added by AI, no watermarks, no text"
8. Run QC checklist
9. Output: copy-paste-ready prompt + style rationale

### Reference-Image Mode

When the user uploads product reference image(s), treat them as the **single source of truth** for product identity:

```
SUBJECT = [All Uploaded product]
BRAND = [brand name from user or reference]
CATEGORY = [category from user or reference]
STYLE_TYPE = photorealistic studio product photography, clean white-to-neutral gradient backdrop
```

- Do not ask the user to re-describe the product from scratch unless details are missing.
- Pull `BRAND` and `CATEGORY` from any text the user included. If missing, ask one focused question.
- In the final prompt, always include the `RESPECT THE REFERENCE IMAGES` block so the generator preserves shape, color, label, logo, and proportions across all 6 panels.

---

## Output Format

```
## Product Reference Prompt (GPT Image 2)

**Style:** [1-5 name]
**Kenapa style ini:** [1-line rationale in user's language]

```
<prompt text — variant-specific template filled with product details>
```

## QC Checklist (All Styles)

- [ ] Product name + category specified
- [ ] Material, color, key features described
- [ ] Style locked (studio, lighting, background)
- [ ] Composition specified (angle, padding, camera)
- [ ] Consistency locks present (no redesign, no recolor, no extra parts)
- [ ] **"No human hands" in negative** ← most common failure
- [ ] **"No text, no logos, no watermarks" in negative**
- [ ] **Default cinematic negatives appended**

## Save the Output
- Generate the image in GPT Image 2
- Save as `product.png` (or any memorable name)
- **Note the file path** — you'll need it for `/s2s motion` as `@[product ref]`

## Cost & Time
- GPT Image 2: ~$0.07, ~30s
- Multi-angle may need 1-2 re-rolls (~$0.14-0.21)
- Lifestyle highest re-roll rate (budget 2-3x)
- Total Step 2b: ~3-10 min depending on style

## Suggested Next Step
- If your video also has a character → run `/s2s character-ref` first
- If product-only → run `/s2s motion` with storyboard.png + product.png paths
```

---

## Style Selection Guide (Expanded)

| Scenario | Best Style | Reason |
|----------|------------|--------|
| Skincare/beauty premium | 1. Studio | Clean, premium, e-commerce ready |
| FMCG snack/drink | 2. Multi-angle | Identity across cuts |
| "Produk di kamar mandi" | 3. Lifestyle | Setting tells the story |
| "Cara pakai serum" | 4. Sedang dipakai | Show application process |
| "Mau bikin banyak video, hemat budget" | 5. Full sheet | 6 panels × 1 gen = 6 refs |
| Product has important back label | 5. Full sheet | Captures back + side details |
| Fashion sneakers | 3. Lifestyle | Aspiration sells |
| Electronics/tech | 1. Studio | Clean tech aesthetic |
| Cooking recipe demo | 4. Sedang dipakai | Show pouring, stirring, plating |
| e-commerce product page | 2. Multi-angle | Buyer confidence from all sides |
| Quick 1-video UGC ad | 3. Lifestyle | Fastest to usable frame |

---

## Common Errors

| User Input | Error | Fix |
|------------|-------|-----|
| "Show a hand holding the product" | GPT defaults to hands in hero shot | Auto-detect picks style 4 (in-use) instead |
| "Make it look like Apple ad" | AI adds fake Apple logo | Add "no logos added by AI" to negative |
| Lifestyle without setting context | Vague | Ask: "di tempat apa? kamar, dapur, rak?" |
| "Just generate" (no product spec) | Can't generate | Ask: "produk apa? warna apa? bentuknya gimana?" |
| In-use without specifying action | Vague | Ask: "aksi apa? oles? tuang? semprot?" |

---

## Related

- `../references/product-ref-prompt.md` — full template + 5 variant templates
- `../references/cinematic-composition-vocabulary.md` — cinematic styles for hero shots
- `character-ref.md` — for character-driven videos
- `motion.md` — uses this as @[product ref]
- `cinematic-variations.md` — pre-visualize with 10 compositions first
