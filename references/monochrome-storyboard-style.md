# Monochrome Sepia/Amber Storyboard Style

Validated 2026-06-14 for project "16 Putaran" (KreafestPoldaJatim 2026 Rizky narrative). Reference anchor: `/root/.hermes/image_cache/img_c67e2b5bfb94.jpg`.

## Style DNA

| Element | Specification |
|---------|---------------|
| Palette | Monochrome graphite + amber/sepia ONLY. No full color. |
| Linework | Hand-drawn pencil sketch, cross-hatching, wobbly organic strokes |
| Outlines | No hard outlines, no clean digital sharpness |
| Texture | Paper grain overlay throughout |
| Aspect | 1536x1024 landscape (16:9) |
| Grid | 4 rows × 3 columns of equal panels, thin white gutters on charcoal background |
| Labels | Panel headers P01-P12 implied by layout, no explicit text overlays |

## Bedroom Anchor (consistent across all clips)

- Cramped dark Indonesian bedroom at night
- Rumpled single bed with wrinkled sheets
- Vintage metal standing fan (left of frame)
- Small nightstand with glowing tungsten desk lamp (right of frame)
- Water bottle and a phone on nightstand
- Bare scuffed walls rendered in cross-hatched charcoal

## Subject

- Young Indonesian man, late teens to late twenties across the narrative
- Messy dark hair, plain wrinkled t-shirt
- Phone in hand in early beats, hands resting on knees by climax
- Expression: contemplative → nostalgic → dejected → emptied → quiet acceptance

## Floating 4x4 Grid (the supernatural element)

- 16 small rectangular cards hover in the air as the primary light source
- Each card outlined faintly
- Numbered 1-16 with numerals only (NO Indonesian text labels, NO scene descriptions)
- Cards glow amber-gold sequentially as narrative progresses
- Unlit cards stay dim grey rectangles
- Glow color shifts: warm amber (early) → cool clinical (mid) → colder redder (climax) → unified held (resolution)

## Cells Narrative Map (16 Putaran Rizky)

| Cell | Indonesian Context | Visual Iconography |
|------|--------------------|---------------------|
| 1 | Masa Kecil | Young boy playing in Indonesian kampung yard (rusted toy car, simple timber house, golden hour) |
| 2 | Ayah | Teen boy on motorcycle in Indonesian workshop with father mechanic |
| 3 | Ibu | Teen boy receiving packed lunch (nasi bungkus) from mother outside workshop, warm tungsten on mom |
| 4 | Sekolah | Indonesian SMA classroom, teen alone at wooden desk with thick Pelajaran book |
| 5 | Sahabat | Teen boy on concrete bench outside SMA with 2 friends (red+white oblong t-shirt), laughing |
| 6 | Cinta Pertama | Teen boy at Indonesian school gate (pagar besi + gapura), watching girl in putih-abu uniform walk away |
| 7 | Kuliah | Teen boy (~18) at Indonesian warung kopi (terpal), textbook + cheap kopi hitam, hopeful |
| 8 | Mimpi | Teen boy in small kost room, looking up at paper with handwritten words (illegible) on wall, small desk lamp |
| 9 | Kerja | Young adult at cramped Indonesian call-center cubicle, monitor with no legible content, papers, empty cup, cool fluorescent |
| 10 | Gagal | Young adult collapsed forehead-down on keyboard, office after hours, fluorescent off, dying warm sun from window |
| 11 | Hutang | Young adult at debt office, half-shadowed collector in sunglasses, trembling hands holding empty brown wallet |
| 12 | Sakit | Young adult in Indonesian puskesmas waiting room, hand on temple, kipas angin fan overhead, cracked pale-green paint |
| 13 | Rambut | Indonesian bathroom with cat tembok tile, cermin dinding retak (cracked wall mirror), bald patches on crown, hair thin at temples |
| 14 | Mata | Outside Indonesian warung tenda with terpal, white eyepatch over right eye, motorcycle scar on cheek, dim late-evening |
| 15 | Jari | Close-up left hand on wooden meja kayu jati, pinky missing at 2nd knuckle, scar healed over, single bulb above |
| 16 | Penjara | Indonesian sel tahanan with single hanging bulb, concrete wall, iron bars, folded blanket, single plastic pail, empty cell |

## Carry-Over Progression (across clips)

- **Clip 1 (Seed Memory):** cells 1-3 light. Bedroom dark, warm amber. Pensive.
- **Clip 2 (School Years):** cells 1-8 lit. Bedroom warmer, nostalgic.
- **Clip 3 (Adulthood Struggles):** cells 1-12 lit. Bedroom cooler/clinical, dejected.
- **Clip 4 (Final Fall):** all 16 lit (last 4 colder redder). Bedroom darker/colder, despair.
- **Clip 5 (Closing):** all 16 fully unified amber-gold. Fan still, lamp steady, room held. Quiet acceptance.

## Common Pitfalls to Avoid

1. **Photorealistic drift** — even with style prompt locked, GPT Image 2 can drift to photoreal. Re-prompt with stronger "monochrome hand-drawn" emphasis if first gen looks too real.
2. **Text hallucination inside cells** — explicitly say "only tiny numerals" + "NO Indonesian words" + "no captions" multiple times in prompt.
3. **Cell 16 (Penjara) too violent** — keep as empty cell, no figure, no graphic content. Just bare concrete + bulb + bars.
4. **Inconsistent cell carry-over** — explicitly state in each clip prompt "cards 1-X from previous beat still glowing".
5. **Aspect ratio drift** — GPT Image 2 may output portrait if prompt ambiguous. Always state "16:9 horizontal, 4 rows × 3 columns equal panels".

## Verified Reference Image

`/root/.hermes/image_cache/img_c67e2b5bfb94.jpg` is the validated reference for the 4x3 grid layout, bedroom anchor, floating 4x4 grid, monochrome palette, and Indonesian context per cell. Use `vision_analyze` to lock style before generating.

## Provenance

- Validated end-to-end on "16 Putaran" project (KreafestPoldaJatim 2026)
- 5 storyboard images generated 2026-06-14 via Director profile + Codex GPT Image 2 medium
- User explicitly corrected: "Harusnya generate sesuai skill s2s kita dengan persona director" + "Harusnya langsung 1 storyboard???" — both corrected to monochrome 4x3 grid per this reference
