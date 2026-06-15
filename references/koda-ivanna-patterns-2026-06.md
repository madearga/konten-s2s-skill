# Koda & Ivanna Patterns — 2026-06 Reverse-Engineering Notes

Source feed: `@aimikoda` (Koda) + `@ivanka_humeniuk` (Ivanna). Scraped 2026-06-11 via
`twitter user-posts` from `~/.hermes/.env` auth. These are the verified patterns that
showed up in their actual published prompts, not speculation.

**Why this file exists:** The base `director-strip-7-track.md` + `seedance-motion-prompt.md`
shipped with v1.2.0 cover RHYTHM + ESCALATION vocabulary but miss 4 high-value patterns
Koda and Ivanna use in real published Seedance 2.0 prompts. Patch these in.

---

## Pattern 1 — Director Strip 7-Track (Augmented, not duplicated)

The base skill ships 7 tracks: BEAT LINE, CAMERA PATH, ACTION PATH, RHYTHM TRACK,
ESCALATION MAP, STATE TRACK, STYLE TRACK. **Koda's published prompts use the same 7
plus three enhancements:**

- **Panel headers carry lens + beat name OUTSIDE the image, never inside the panel.**
  Format: `P01 / 24mm wide / Meadow master -> P02 / 85mm portrait / Sunbathing face`.
  This is the explicit "STORYBOARD PURITY" rule — no labels/arrows/captions *inside*
  the panel itself. The base skill says "monochrome panel grid" but doesn't enforce
  the header-strip-outside convention.
- **RHYTHM and ESCALATION values are pinned to specific vocabulary, not free-form.**
  Koda's published vocabulary is exact:
  - RHYTHM verbs: `hold | slow reveal | build | burst | impact | pause | recover | final hit`
  - RHYTHM block sizes: `short block | medium block | long block`
  - RHYTHM beat types: `clean beat | match beat | smash beat | held beat | whip beat`
  - ESCALATION levels: `L1 calm | L2 tension | L3 rise | L4 surge | L5 peak`
  - ESCALATION curves: `flat | rise | spike | drop | release | unresolved`
- **ESCALATION is a 2-tuple (level, curve), not a single word.** Format:
  `ESC P08: L5 peak / release`. Base skill templates use single words.

**Action:** When generating director strips, emit Panel Headers as `P## / {lens}mm {shot_type} / {beat_name}` and write RHYTHM/ESCALATION using the locked vocab above.

---

## Pattern 2 — Spatial Continuity Lock (new, missing in v1.2.0)

Koda's "BREE-S02-WINDRIDE" storyboard defines a **Spatial Continuity Lock** block:

```
P07, P08, P09, P10, and P11 share one jump geography: the tall crest screen right,
the open sky above it, and the landing slope beyond it. P08 and P09 are phases of
the same airborne arc rising off the crest from P07. P10 is an overhead view of
the same arc, not a new location. P11 lands on the far side of the same crest,
continuing screen right. P12 is not a new establishing shot; it is the same hill
country seen wide as she exits toward the horizon. Allowed changes between locked
panels: camera angle, distance and height, C1 pose, board height above ground,
shadow position, grass spray state.
```

**Why it matters:** Seedance-class models flip geometry between shots without explicit
direction. The base skill's "screen direction in LOCATION" pitfall (#5) is the **first
level** of this fix. The Spatial Continuity Lock is the **second level** — it groups
panels that must share the same world-space and explicitly enumerates what CAN change
(camera, pose, state) and what CANNOT (geography, screen direction, geography markers).

**Action:** Add a `[SPATIAL CONTINUITY LOCK]` block to the storyboard template, placed
right after `[IDENTITY CONSISTENCY]`. Format:

```
PANELS_SHARING_GEOGRAPHY: P##, P##, P##  (list of panels locked to same world-space)
GEOGRAPHY_ANCHOR: {one-line description of the location these panels share, e.g.
                  "tall crest screen right + landing slope beyond"}
NOT_NEW_LOCATIONS: P##  (panels that look like new locations but are actually
                  alternate views of the same geography)
ALLOWED_CHANGES: {camera angle, distance, height, C1 pose, prop state, etc.}
FORBIDDEN_CHANGES: {flip screen direction, move horizon line, relocate anchor}
```

**Pitfall:** If you skip this, Seedance will treat each panel as an independent shot
and may relocate the subject, flip the sun, or move the horizon. Symptom: the same
character is on the left in P01 and on the right in P02 with no narrative reason.

---

## Pattern 3 — HARD CUT Marker (new, missing in v1.2.0)

Every single shot in Koda's and Ivanna's published multi-shot prompts ends with
`(HARD CUT)`. Format:

```
SHOT 1 (0-2s) Extreme Macro • camera: slow push in • {description}. (HARD CUT)
SHOT 2 (2-3.5s) Extreme Close-Up • camera: static, snap impact • {description}. (HARD CUT)
```

**Why it matters:** Without `(HARD CUT)`, Seedance blends the end of shot N into
the start of shot N+1, producing dissolve-style transitions and breaking the
cut-driven rhythm. The marker is a fence, not a suggestion.

**Action:** Every shot in `seedance-motion-prompt.md` SHOT LIST must end with
`(HARD CUT)`. The final shot can end with a different marker like `(HARD CUT TO BLACK)`
or `(MATCH CUT TO {next sequence})` to signal the end of the sequence.

**Pitfall:** Ivanna's Renaissance Grand Prix prompt (8 shots, 15s total) puts
`(HARD CUT)` on every single shot including the last. The last one then explicitly
says "Hard cut to black during the upward motion." So `(HARD CUT)` is per-shot,
and the sequence end is a separate instruction.

---

## Pattern 4 — Comprehensive Negative Prompt (new, missing in v1.2.0)

Ivanna's haute cuisine b-roll ends with this negative prompt block:

```
NEGATIVE PROMPT: static grid, split-screen, collage, tiled mosaic, contact sheet,
picture-in-picture, multiple panels; warm orange fire overlay, campfire flames
over the face, golden/warm color cast; on-screen text, captions, subtitles, logos,
watermark; plastic skin, waxy skin, CGI look, 3D render, doll face; extra fingers,
deformed hands, distorted face; blurry, low quality.
```

The base skill's `seedance-motion-prompt.md` does not have a NEGATIVE PROMPT section.
This is a gap because Seedance's most common failure modes are exactly these
artifacts (split-screen when it tries to cram multiple panels, contact sheet when
shot list is long, waxy skin from anime-style prompts).

**Action:** Add a `[NEGATIVE PROMPT]` section to `seedance-motion-prompt.md` with
this default vocabulary, plus the `--neg-style-overrides` flag for style-specific
extras (e.g. anime prompts should add `western realism, photoreal face, deep shadow`).

**Default NEGATIVE PROMPT block (paste verbatim unless user overrides):**

```
NEGATIVE PROMPT: static grid, split-screen, collage, tiled mosaic, contact sheet,
picture-in-picture, multiple panels; on-screen text, captions, subtitles, logos,
watermark, UI, ghost poses, duplicate bodies, technical overlays; extra fingers,
deformed hands, distorted face, plastic skin, waxy skin, CGI look, 3D render,
doll face; blurry, low quality, motion-blur smears; warm orange fire overlay,
golden/warm color cast (when style is cool).
```

**Pitfall:** The base `cinematic-composition-vocabulary.md` ships "imperfect realism
texture pack" but no negative overrides. When the user picks anime style, you must
ADD `western realism, photoreal face, deep shadow` to the negative list. Otherwise
Seedance drifts to photoreal faces inside an anime scene.

---

## Adoption Recommendation (Arga, per MEMORY 2026-06)

Per memory: Seedance 2.0 is **out** for our pipeline (face-blocks). These patterns
are still worth adopting because **Veo 3.1 Lite + Kling 3.0 have the same failure
modes** (multi-shot dissolves, geometry flips, contact-sheet hallucination).

**Apply all 4 patterns to:**
- `seedance-motion-prompt.md` template — add HARD CUT per shot + NEGATIVE PROMPT block
- `storyboard-prompt-template.md` 12-Section — add `[SPATIAL CONTINUITY LOCK]` as
  new section between `[IDENTITY CONSISTENCY]` and `[STORYBOARD PURITY]`
- `director-strip-7-track.md` — pin RHYTHM/ESCALATION vocab + Panel Header format

**Don't apply (not relevant for Veo/Kling):**
- Model-specific prompt prefixes (Seedance-directive language like
  "Use @[storyboard 1 ref] as the authoritative director-approved...")
- PixVerse-style "shot chips, thin lines, rhythm blocks" (this is for Koda's
  storyboard IMAGE gen, not motion prompt)

---

## Source Verification

| Pattern | Source | Tweet ID | Verified via |
|---------|--------|----------|-------------|
| Director Strip augmented | Koda "The Wind Calls" | 2065389969430954445 | twitter user-posts aimikoda, 2026-06-11 |
| Spatial Continuity Lock | Koda "BREE-S02-WINDRIDE" | 2065389969430954445 | same |
| HARD CUT marker | Ivanna haute cuisine b-roll | 2064182754560934025 | twitter user-posts ivanka_humeniuk, 2026-06-11 |
| Negative Prompt | Ivanna haute cuisine b-roll | 2064182757845020941 | same |
| Renaissance Grand Prix reference | Ivanna Dreamina | 2063824412038639972 | same |

**Scraping command:**
```bash
twitter user-posts aimikoda
twitter user-posts ivanka_humeniuk
```

Both are verified accounts. Koda has 3,727 views on the Wind Calls post; Ivanna has
5,899 views on the b-roll comparison. Both posts include the full prompt text in
the thread, so the patterns above are transcribed verbatim from published source.
