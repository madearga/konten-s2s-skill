# Monochrome 4×3 12-Panel Storyboard Style — Complete Guide

> **Validated 2026-06-14** for a multi-clip public-safety storyboard project. Single source of truth — replaces the earlier `monochrome-storyboard-style.md` (merged 2026-06-15).
>
> Reference anchor: `/root/.hermes/image_cache/img_c67e2b5bfb94.jpg` — use `vision_analyze` to lock style before generating.

A **validated visual style lock** for multi-clip AI video storyboards. Source: 5-clip narrative pattern generated end-to-end on 2026-06-14, anchored to user reference image `img_c67e2b5bfb94.jpg`.

## When to Use This Style

| Signal | Use this style? |
|---|---|
| Multi-clip narrative (5-7 clips) with shared character + 1 setting | ✅ YES |
| Single 8-15s UGC ad | ❌ NO — use 1 storyboard per ad, no grid |
| "World split into N fates" / grid / multiverse concept | ✅ YES — the floating 4x4 grid is built for this |
| Photorealistic director cut / film pitch | ❌ NO — use Cinematic Composition Vocabulary instead |
| Pre-vis for live-action or drama | ⚠️ Maybe — strong style, less flexible than monochrome rough sketch |

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
| Color shift | Warm amber (memory) → cool clinical (struggle) → cold red (climax) → unified held (closure) |

**Hard NO's:**
- NO text inside cells (no Indonesian words, no captions, no labels)
- NO watermarks, no frame numbers, no panel labels
- NO full color, NO photoreal, NO CGI, NO 3D render
- NO black bars
- NO centered portrait composition
- The numbered cells show ONLY tiny numerals (1-16) and the visual scene

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

## Cells Narrative Map (generic fate-grid)

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

| Clip | Beat | Cells Lit | Tone |
|------|------|-----------|------|
| 1 | Seed Memory | 1-3 (Masa Kecil, Ayah, Ibu) | Bedroom dark, warm amber. Pensive. |
| 2 | School Years | 1-8 (Sekolah, Sahabat, Cinta Pertama, Kuliah, Mimpi) | Bedroom warmer, nostalgic. |
| 3 | Adulthood Struggles | 1-12 (Kerja, Gagal, Hutang, Sakit) | Bedroom cooler/clinical, dejected. |
| 4 | Final Fall | 13-16 (Rambut, Mata, Jari, Penjara) | All 16 lit, last 4 colder redder. Bedroom darker/colder, despair. |
| 5 | Closing | All 16 unified | Fully unified amber-gold. Fan still, lamp steady, room held. Quiet acceptance. |

**Rule**: in each clip, cells 1-(N-1) MUST be glowing (carry-over from previous beat). Forgetting to specify carry-over causes the agent to re-render only the new cells lit, breaking visual narrative.

## Known-Good Prompt Template

Copy this template, then replace `[CLIP_BEATS]` and `[CARRY_OVER]` with your clip-specific content:

```
A 16:9 horizontal storyboard sheet laid out as 4 rows by 3 columns of 12
equal panels (P01 top-left to P12 bottom-right) separated by thin white
gutters on a charcoal background, monochrome hand-drawn graphite-and-sepia
illustration style with cross-hatching, pencil sketch linework, wobbly
organic strokes, no hard outlines, paper grain texture overlay throughout.
The recurring setting is a cramped dark Indonesian [ROOM_TYPE] at [TIME] —
[ROOM_PROPS]. The recurring subject is [CHARACTER_DESCRIPTION]. A
supernatural 4x4 floating grid of 16 small rectangular cards hovers in the
air as the primary light source, each card outlined faintly,
[CARRY_OVER] glowing amber, [NEW_CELLS] lighting up sequentially with
[TONE_SHIFT].

[CLIP_BEATS — 12 paragraphs, one per panel P01-P12]

Cross-hatched shadows throughout, sepia and amber palette only
[TONE_NOTE], melancholic introspective mood, no clean digital sharpness,
no CGI look, no photoreal render, no full color, no poster composition,
no centered portrait, no black bars, no text inside grid cells, no
Indonesian words, no watermarks, no frame numbers, only tiny numerals 1
through [N] inside the glowing cards, the other [16-N] cards blank or dim.
```

## Worked Example (Clip 1, generic fate-grid)

- **CARRY_OVER**: none (this is the first clip)
- **NEW_CELLS**: cards 1-3 (Masa Kecil, Ayah, Ibu)
- **TONE_SHIFT**: warm amber (memory, gentle)
- **CLIP_BEATS**: P01-P03 bedroom master + grid emerges + 3 cards start glowing, P04-P06 close-ups of each cell (child playing in kampung, teen on motorcycle with father, teen receiving nasi bungkus from mother), P07-P12 hold/master shots ending in still reflection

Actual generated output: `/root/.hermes/cache/images/openai_codex_gpt-image-2-medium_20260614_172436_42b06f15.png`

## Pitfalls

1. **Triptych temptation** — Agent default is to make a "3 panels = 3 scenes" image. WRONG. The storyboard for a clip is a 12-panel *sequence* of 1 scene, not 3 scenes. 1 clip = 1 storyboard image = 12 panels of the same scene + close-ups.

2. **Photoreal drift** — When the brief says "Indonesian man" or "real human", agent often defaults to GPT Image 2 photoreal generation. This style explicitly forbids photoreal. Always prepend "monochrome hand-drawn graphite-and-sepia illustration style" to lock the look.

3. **Text hallucination inside cells** — Even with "no text" in negative prompt, image generators want to add captions. Use the literal phrase "no text inside grid cells, no Indonesian words" twice in negatives if first attempt adds captions. Only tiny numerals (1-16) allowed.

4. **Cell 16 (Penjara) too violent** — keep as empty cell, no figure, no graphic content. Just bare concrete + bulb + bars.

5. **Grid geometry drift** — The 4x4 grid is sacred. If a re-roll shifts the grid to 3x3 or 5x5, reject and re-prompt with explicit "4x4 grid of 16 small rectangular cards, fixed positions, no drift". Continuity across clips depends on this.

6. **Inconsistent cell carry-over** — explicitly state in each clip prompt "cards 1-X from previous beat still glowing". Skipping this breaks narrative continuity.

7. **Aspect ratio drift** — GPT Image 2 may output portrait if prompt ambiguous. Always state "16:9 horizontal, 4 rows × 3 columns equal panels".

## Reference Image

User-provided anchor (use `vision_analyze` to lock style before generating):

```
/root/.hermes/image_cache/img_c67e2b5bfb94.jpg
```

12-panel 4×3 grid in monochrome graphite + amber/sepia, hand-drawn cross-hatched pencil, dark bedroom + floating 4x4 grid of 16 cards, young Indonesian man on bed watching grid. This is the gold standard reference — describe it in the prompt's "STYLE LOCK" section.

## Production Workflow (Validated)

For batch multi-clip storyboards:

1. **Lock the style** — `vision_analyze` on the reference image, then craft the first prompt manually (don't trust director profile for this)
2. **Generate 1 clip first** — verify it matches the reference visual quality
3. **Batch the rest** — copy prompt template, change only `[CLIP_BEATS]` + `[CARRY_OVER]` + `[TONE_SHIFT]`, generate directly via `image_generate` (don't loop through director profile — 5min timeout per call)
4. **Don't** call director profile for image generation — director profile is for prompt CRAFTING. Generate prompts OUTSIDE the director session, then call `image_generate` directly. Saves 2-3 min per clip.
5. **Push to Notion** — use `ntn` CLI to upload via file_upload API (no public URL, no expiry)
6. **Send to user** — `send_message` with `MEDIA:/path/to/file.png` for Telegram delivery

## Provenance

- Validated end-to-end on a multi-clip public-safety storyboard project
- 5 storyboard images generated 2026-06-14 via Director profile + Codex GPT Image 2 medium
- User explicitly corrected: "Harusnya generate sesuai skill s2s kita dengan persona director" + "Harusnya langsung 1 storyboard???" — both corrected to monochrome 4x3 grid per this reference

## Related References

- `references/cinematic-composition-vocabulary.md` — alternative photoreal styles (use only when photoreal is requested)
- `references/storyboard-prompt-template.md` — generic 12-section template, can be adapted to this monochrome style
- `references/storyboard-motion-prompt-review-notes.md` — review checklist, realism-lock phrases
