# Monochrome 4×3 12-Panel Storyboard Style (Validated 2026-06-14)

A **validated visual style lock** for multi-clip AI video storyboards. Source: 5-clip narrative project ("16 Putaran" — Indonesian gambling addiction / life-arc storyboard) generated end-to-end on 2026-06-14, anchored to user reference image `img_c67e2b5bfb94.jpg`.

## When to Use This Style

| Signal | Use this style? |
|---|---|
| Multi-clip narrative (5-7 clips) with shared character + 1 setting | ✅ YES |
| Single 8-15s UGC ad | ❌ NO — use 1 storyboard per ad, no grid |
| "World split into N fates" / grid / multiverse concept | ✅ YES — the floating 4x4 grid is built for this |
| Photorealistic director cut / film pitch | ❌ NO — use Cinematic Composition Vocabulary instead |
| Pre-vis for live-action or drama | ⚠️ Maybe — strong style, less flexible than monochrome rough sketch |

## Locked Style Spec

**Composition:**
- Single image per storyboard (NOT a triptych, NOT a contact sheet of clips)
- Aspect: **1536x1024 landscape (16:9)**
- Layout: **4 rows × 3 columns = 12 equal panels** (P01 top-left → P12 bottom-right)
- Thin white gutters on charcoal background
- Panel labels P01-P12 implied by layout (no visible panel numbers — but the reading order is L→R, top→bottom)

**Visual language:**
- **Monochrome** — graphite + sepia/amber palette ONLY
- Hand-drawn cross-hatched pencil quality
- Wobbly organic strokes, no hard outlines
- Paper grain texture overlay
- Cross-hatched shadows
- Color shift across clips: warm amber (memory) → cool clinical (struggle) → cold red (climax) → unified held (closure)

**Composition pattern (recurring across clips):**
- Recurring setting: same dark bedroom with single bed, fan, desk lamp, water bottle, phone
- Recurring subject: same character (Rizky) in same room
- Supernatural 4x4 floating grid of 16 cards hovering as primary light source
- Cells 1-N glow amber, the rest dim — count of lit cells = narrative progress
- Mix of "bedroom master" panels (full room + grid + character) and "card close-up" panels (just one cell magnified)
- Always end with a hold frame for handoff to next clip

**Hard NO's:**
- NO text inside cells (no Indonesian words, no captions, no labels)
- NO watermarks, no frame numbers, no panel labels
- NO full color, NO photoreal, NO CGI, NO 3D render
- NO black bars
- NO centered portrait composition
- The numbered cells show ONLY tiny numerals (1-16) and the visual scene

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

## Worked Example (Clip 1 of "16 Putaran")

- CARRY_OVER: none (this is the first clip)
- NEW_CELLS: cards 1-3 (Masa Kecil, Ayah, Ibu)
- TONE_SHIFT: warm amber (memory, gentle)
- CLIP_BEATS: P01-P03 bedroom master + grid emerges + 3 cards start glowing, P04-P06 close-ups of each cell (child playing in kampung, teen on motorcycle with father, teen receiving nasi bungkus from mother), P07-P12 hold/master shots ending in still reflection

The actual prompt used is in `/root/.hermes/cache/images/openai_codex_gpt-image-2-medium_20260614_172436_42b06f15.png` (the resulting file).

## Pitfalls

1. **Triptych temptation** — Agent default is to make a "3 panels = 3 scenes" image. WRONG. The storyboard for a clip is a 12-panel *sequence* of 1 scene, not 3 scenes. 1 clip = 1 storyboard image = 12 panels of the same scene + close-ups.

2. **Photoreal drift** — When the brief says "Indonesian man" or "real human", agent often defaults to GPT Image 2 photoreal generation. This style explicitly forbids photoreal. Always prepend "monochrome hand-drawn graphite-and-sepia illustration style" to lock the look.

3. **Text hallucination** — Even with "no text" in negative prompt, image generators want to add captions. Use the literal phrase "no text inside grid cells, no Indonesian words" twice in negatives if first attempt adds captions.

4. **Grid geometry drift** — The 4x4 grid is sacred. If a re-roll shifts the grid to 3x3 or 5x5, reject and re-prompt with explicit "4x4 grid of 16 small rectangular cards, fixed positions, no drift". Continuity across clips depends on this.

5. **Carry-over regression** — In Clip N, the cells 1-(N-1) MUST be glowing. Forgetting to specify carry-over causes the agent to re-render only the new cells lit, breaking the visual narrative. Always state "[1-N] cards (carry-over from previous beat) glowing amber" explicitly.

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
3. **Batch the rest** — copy prompt template, change only [CLIP_BEATS] + [CARRY_OVER] + [TONE_SHIFT], generate directly via `image_generate` (don't loop through director profile — 5min timeout per call)
4. **Don't** call director profile for image generation — director profile is for prompt CRAFTING. Generate prompts OUTSIDE the director session, then call `image_generate` directly. Saves 2-3 min per clip.
5. **Push to Notion** — use `ntn` CLI to upload via file_upload API (no public URL, no expiry)
6. **Send to user** — `send_message` with `MEDIA:/path/to/file.png` for Telegram delivery

## Related References

- `references/competition-deliverable-blueprint.md` — full Kreafest 2026 case study that uses this style for 7 clips
- `references/cinematic-composition-vocabulary.md` — alternative photoreal styles (use only when photoreal is requested)
- `references/storyboard-prompt-template.md` — generic 12-section template, can be adapted to this monochrome style
