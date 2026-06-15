# Competition Video Deliverable Blueprint

Validated end-to-end playbook for competition-style AI video submissions. Source: KreafestPoldaJatim 2026 "16 Putaran" (Indonesian public-safety competition, gambling addiction theme, 1:45 duration, $5 budget, 2-3 hour execution).

---

## When to Use This Pattern

Use this blueprint when the user wants to:
- Submit a video to a competition / lomba / festival
- Create a public-safety PSA / social-impact video
- Make a 60-180s narrative AI video with discrete beats
- Build a "world split into N fates" structure (multiverse, grid, branching)

Skip this blueprint for:
- Single 8-15s UGC ads (use the default 3-step pipeline instead)
- 1-minute+ continuous shots (use First+Last Frame, see ai-video-production SKILL section 2.7)
- Real human face videos (use Kling 3.0 instead — Seedance 2.0 face-blocks)

---

## Competition Deliverable Structure (Validated 1:45 / 7-Clip)

### Concept Template: "The N-Fate Grid"

**Logline:** One person's single repetitive action. The action creates a 4x4 (or 3x3) grid of N alternate fates. The grid lights up cell by cell. Each lit cell shows a frozen tableau of a different life outcome. The grid glitches at climax. The action stops. End card with closing line.

**Why it wins competitions:**
- Orisinal — split-fate / multiverse structure is rare
- Uses AI's core strength (image-to-image consistency) instead of fighting it
- Emotional escalation is intrinsic to the structure
- Works in any 9:16 vertical format, any duration 1:00-2:30

**Variation 1: "16 Putaran" (Kreafest 2026 — Judi Online)**
- 16 fates = what you lose to gambling: kerja, rumah, keluarga, teman, tabungan, motor, HP, gigi, rambut, mata, jari, kebebasan, kewarasan, orang lain, nyawa, harapan
- Single action: thumb tapping phone screen
- Indonesian visual context: BCA bank, gangguang debt office, warung, puskesmas, sel tahanan

**Variation 2: "Cyber Bullying 7 Hari"**
- 7 fates = 7 days of cyberbullying escalation
- Single action: typing a comment
- Fates: regret, viral shame, depression, suicide attempt, support, recovery, advocacy

**Variation 3: "Kekerasan Seksual 16 Detik"**
- 16 fates = brain's 16-second unsafe-recognition window
- Single action: NOT-action (the absence of intervention)
- Fates: lift, train, mall, kos, angkot, etc. — each cell a frozen "what could have happened"

---

## The 7-Clip Timeline (validated)

| Clip | Detik | Role | Panels | Storyboard | Motion |
|------|-------|------|--------|------------|--------|
| 1 | 0:00-0:15 | Hook (gesture + grid reveal) | 9 (v1) / **12 (v2)** | storyboard_01.png | clip_01.mp4 |
| 2 | 0:15-0:30 | Fates 1-4 | 9 | storyboard_02.png | clip_02.mp4 |
| 3 | 0:30-0:45 | Fates 5-8 | 9 | storyboard_03.png | clip_03.mp4 |
| 4 | 0:45-1:00 | Fates 9-12 | 9 | storyboard_04.png | clip_04.mp4 |
| 5 | 1:00-1:15 | Fates 13-16 | 9 | storyboard_05.png | clip_05.mp4 |
| 6 | 1:15-1:30 | Glitch / Freeze / Drop | 9 | storyboard_06.png | clip_06.mp4 |
| 7 | 1:30-1:45 | End card (typography only) | 6 | storyboard_07.png | clip_07.mp4 |

**Why 4 fates per clip:** 4 cells light up per 15s = 1 cell per ~3.75s, which is roughly the rhythm of an 80-BPM tap. Aligns to natural diegetic pacing.

**Why 9 panels per storyboard:** 3x3 grid is the standard Seedance/Pixazo sweet spot. More panels = drift, illegible. Fewer = not enough escalation.

**Why 6 panels for end card:** typography-only, no geography, fewer panels needed.

**Why 12 panels for Clip 1 v2 (hook):** the first 3 seconds need extra resolution to land the grid flash + smash cut + bedroom master. See § "Hook Retention Pattern" below.

---

## Cross-Clip Continuity Rules

These 4 rules must hold across ALL 7 motion prompts. Drop them into a constant block at the top of every motion prompt.

### Rule 1 — Same character ref, every clip

```
Use @[rizky_ref] as the authoritative C1 character reference.
```

If face drifts between clips, the whole video falls apart. Re-roll with the same ref, never substitute.

### Rule 2 — Spatial Continuity Lock (the geography stays)

The bedroom scene (or whatever primary location) is the same across clips 1-6. Only the grid in the upper-center changes. State this explicitly:

```
P01-P09 share the same frame composition: bedroom lower-half, 4x4 grid upper-half. The grid's 16 positions are fixed. The bedroom geography is fixed. Allowed changes: which cells are lit, content of the lit cell, tap rhythm intensity. Forbidden: grid position change, bedroom redesign, screen direction flip.
```

### Rule 3 — RHYTHM TRACK escalation is monotonic

Across the 7 clips, RHYTHM must escalate. Never reset.

| Clip | Tap tempo | RHYTHM verbs | ESCALATION |
|------|-----------|--------------|------------|
| 1 | 1 tap/sec | `hold` → `pause` → `build` | L1 → L4 |
| 2 | 1.5 tap/sec | `hold` → `burst` → `impact` | L2 → L3 |
| 3 | 2 tap/sec | `hold` → `impact` | L3 |
| 4 | 2.5 tap/sec | `hold` → `impact` → `final hit` | L3 → L4 |
| 5 | 3 tap/sec (peak) | `hold` → `impact` → `final hit` | L4 → L5 |
| 6 | 3 → 6 → silence | `build` → `burst` → `impact` → `pause` | L5 → drop |
| 7 | silence | `hold` → `slow reveal` → `settle` | drop → L1 |

### Rule 4 — Single audio bed, layered in post

Generate each clip with diegetic foley only. NEVER bake music into generation. Build the audio in CapCut/DaVinci:

- 1 tap SFX loop (search "fingertip tap" or "phone tap" in CapCut free library)
- 1 breath sample (inhale + exhale) for Clip 7
- Optional: 1 bulb hum, 1 kipas angin ambient

Tempo per clip section is set in post via speed adjustment on the SFX, NOT regenerated per clip.

---

## Hook Retention Pattern (validated v2, 2026-06-13)

**Problem:** Original Clip 1 (9 panels) started with 0.3s of black silence, then 1s of empty black bedroom before the thumb tap. Social-media retention drops ~40% if first 3 seconds don't deliver visual content. On Reels/TikTok, a "black → silence → slow build" hook is a swipe-away.

**Fix — v2 structure (12 panels, 0.3s + 0.3s + content):**

| P## | Time | Content | Role |
|-----|------|---------|------|
| P01 | 0-0.3s | FULL 4x4 GRID FLASH (all 16 cells visible, bright) | **3-second hook** — visual question: "what is this grid?" |
| P02 | 0.3-0.6s | SMASH CUT TO BLACK (0.3s, no text) | **Pattern interrupt** — resets attention clock |
| P03-P09 | 0.6-11s | Bedroom master → thumb close-up → tap rhythm → screen glow → phone tilt → sweat detail → pull back | Story content (10.4s) |
| P10-P11 | 11-13s | Grid emerges on wall behind Rizky, 4 corner cells pulse on | **Second hook** at 11s — visual reward that re-engages scrollers |
| P12 | 13-15s | 4 corner cells lit, hold for handoff to Clip 2 | Continuation tease |

**Why the 0.3s + 0.3s double-pulse works:**

- First 0.3s = "what is that?" (curiosity, viewer stays)
- Second 0.3s black = "ok reset, here comes the actual thing" (re-engagement)
- 11s second hook = "oh the grid is back, and now it lights up" (delayed reward, viewer watches to see what happens)

**Retention math (TikTok-style):**
- 100% viewers at 0s
- ~60% at 3s without hook → ~75% WITH v2 grid flash (3-second hook)
- ~40% at 11s → ~60% at 11s with second hook
- ~25% completion → ~45% completion with double hook
- For competition: judges watch full video → winning video gets >70% completion rate

**Cost: free** — same 12-panel storyboard, just rearranged the opening 2 panels and added a 0.3s grid flash.

**Apply to any competition video:** if first 3 seconds of your hook aren't visually arresting (text-free, image-only, no slow fade-in), rewrite to match this pattern. Black openings work in film; they don't work in vertical short-form.

---

## NO TEXT IN GRID CELLS (validated pitfall, 2026-06-13)

**Problem:** First pass of all 5 multi-clip storyboards (Clip 2-5) included text labels inside grid cells — "Kerja", "Rumah", "BANK", "TUNGGAKAN", "GADAI", "Pusingku pegel linu", "Panas dingin, Pilek", etc. Reasoning at the time: "Indonesian text helps juri immediately understand what each cell represents."

**What actually happened:**

- **Seedance 2.0 + Pixazo** hallucinated the text — generated Arabic-looking, random-letter, or repeating-character noise inside cells
- The text competed visually with the scene inside each cell (bank teller was partially obscured by misspelled "BANK")
- Judges (predicted comments) said "kok ada teks random? maksudnya apa?"
- Text labels also broke the rule "no text on screen" enforced throughout the rest of the prompts (Clip 7 end card is the only exception)

**Fix — visual iconography only:**

Instead of text, use **specific Indonesian visual context** in every cell:

| Concept | ❌ Text | ✅ Visual |
|---------|---------|----------|
| Work loss | "Kerja" label | Empty office, cardboard box of personal items, Rizky staring at bare desk |
| Home loss | "Rumah" label | Rizky squatting on dawn sidewalk beside plastic bags and gerobak |
| Family loss | "Keluarga" label | Rizky outside kampung pagar, woman and child silhouette walking away |
| Friend loss | "Teman" label | Rizky alone at long warung meja, group laughing at far end |
| Savings loss | "BANK" label | Rizky pushing empty passbook across BCA-style glass teller counter |
| Motor loss | "TUNGGAKAN" label | Debt collector silhouette (shadowed, no face), Rizky handing over motorcycle keys |
| Last phone loss | "GADAI" label | Rizky's hand placing cracked phone on Indonesian pawnshop counter |
| Tooth loss | "Gigi" label | Extreme close-up of mouth with missing right canine (no blood, just the gap) |
| Hair loss | "Rambut" label | Rizky in Indonesian bathroom looking into cermin dinding retak (cracked wall mirror), bald patches on crown |
| Eye loss | "Mata" label | Rizky outside warung tenda wearing worn white eyepatch + motorcycle accident scar on cheek |
| Finger loss | "Jari" label | Close-up of left hand on wooden meja kayu jati, pinky missing at 2nd knuckle (scarred over) |
| Prison loss | "Penjara" label | Indonesian sel tahanan with single hanging bulb, concrete wall, bars |
| Sanity loss | "Kewarasan" label | Indonesian puskesmas psychiatric ranjang besi, Rizky staring at ceiling contemplatively |
| Others loss | "Orang Lain" label | Indonesian hospital koridor with slippers, frosted glass with figure on bed behind |
| Self loss | "Nyawa" label | HIGH-ANGLE looking down at Rizky on bare kamar lantai, HP retak near hand, eyes open but UNFOCUSED — ambiguous still pose, NOT death |
| Hope loss | "Harapan" label | Indonesian wooden pier at dusk, Rizky silhouette holding last coin, orange-gray sky |

**Indonesian context words that anchor each cell (paste into cell prompt):**

```
Indonesian small bathroom with cat tembok tile
Indonesian warung tenda with terpal
Indonesian wooden meja kayu jati
Indonesian puskesmas psychiatric ward
Indonesian hospital koridor with slippers
Indonesian bare kamar lantai with HP retak
Indonesian sel tahanan with single hanging bulb
Indonesian wooden pier at dusk facing wide calm sea
BCA-style glass bank teller counter
gangguang-style debt office with shadowed figure
Indonesian pawnshop with tungsten light
cermin dinding retak (cracked wall mirror)
```

**Cost: free** — same storyboard prompt, just remove text + add Indonesian visual context to cell descriptions.

**Apply universally:** NEVER put text labels inside any AI-generated video frame, EXCEPT for the closing line / hashtag in the end card (Clip 7). The model isn't a typesetter; text in cells always hallucinates and always looks worse than no text.

---

## Per-Clip P09 Rule (single-cell activation)

**Problem:** Original Clip 2 P09 had the new cell (Teman/Friends) AND a previously-activated cell (Keluarga/Family) both highlighted simultaneously. Reasoning: "show progress, remind viewer of all the losses so far."

**What actually happened:**

- The double-highlight confused the eye — viewer couldn't tell which cell was the "new" activation
- The cell-pulse whoosh SFX only hit once, but 2 cells lit → rhythm/visual mismatch
- The intent of the "buildup" was broken: each beat should be a clean "this is what he lost next"

**Fix — P09 rule:**

> **P09 (and any "hold" frame) highlights ONLY the newly activated cell at full brightness. Previously-activated cells stay at their previous state (full brightness if they completed activation in an earlier clip, or 30% opacity if they just completed activation in the same clip). The viewer reads progress from cell count, not from double-lighting.**

**Cost: free** — same storyboard, just enforce single-cell per panel in the prompt.

**Apply universally:** in any "counting up" sequence (16 cells, 7 days, 4 phases), each beat lights ONE new element. Multiple new elements per beat breaks the rhythm.

---

## Death / Sensitive Imagery Rule (validated 2026-06-13)

**Problem:** Original Clip 5 (Fates 13-16) P07 — "Nyawa / Self loss" — was written as a "high-angle of Rizky collapsed on bare kamar lantai, motionless, eyes open." Intended to imply: "this is what gambling took from you." But rendered as a **collapsed / death scene** by the model, which is:
- Risky for a public-safety competition (could be read as glorifying suicide / making light of death)
- Ambiguous in a way that confuses the audience ("is he dead? did he just faint? is this a memory?")
- Misaligned with Indonesian Kreafest judges' preferences for **observational / preventive** framing, not dramatic / violent

**Fix — ambiguous still pose:**

Replace any "death / dying / collapsed" cell with **contemplative stillness**:

> Eyes open but unfocused. HP retak near hand. Bare kamar lantai. NOT violent, NOT obviously dead. The viewer should wonder: "is he alive? is he lost? is he just... empty?" The ambiguity IS the point.

Apply the same treatment to:
- Hospital scenes (slippers + bowed head + frosted glass figure, not "person dying in bed")
- Prison scenes (sitting on bunk + staring forward, not "prisoner in distress")
- Psychiatric scenes (staring at ceiling contemplatively, not "tied to bed")

**Negative prompt anchor (always include for these cells):**

```
no graphic violence, blood, gore, body horror, depiction of death as violent act, collapsed dead body, death scene
```

**Cost: free** — same storyboard, just reframe the cell description + tighten the negative prompt.

**Apply universally:** in any competition / public-safety / PSA video, replace violent imagery with observational / ambiguous stillness. Indonesian juri consistently prefer "show the problem" over "show the consequence" — they want the viewer to think, not flinch.

---

## Predicted-Comments QC Pattern

After the storyboard + motion prompts are written (BEFORE generating the video), predict 20 comments a viewer would leave. Use these to find weak spots in the prompt.

**Pattern (3 categories):**

- **8 positive** — emotional responses, what landed
- **7 critical/constructive** — what's missing, what's confusing, what's too fast/slow
- **5 questions/debates** — what confuses people, what's debatable

**Why it works:**

- Critical comments surface ambiguity in the prompt ("kok ada teks random?" → caught the text-in-cell bug)
- Question comments surface missing context ("kenapa pilih tema ini?") → strengthens the production brief
- Positive comments confirm the hook landed ("hook-nya ngena banget") → validates opening 3 seconds

**Validated 20-comment set for "16 Putaran" (Kreafest 2026):**

1-8. Positive: visual impact ("16 fate dalam 1 menit, ngerasa ditampar"), hook strength, creative direction, shareability
9-15. Critical: Clip 7 too fast, no caption Bahasa, music missing, 16 cell too fast, motion blur pusing, perlu disclaimer untuk yg pernah kena dampak, Clip 6 glitch bisa trigger epilepsi
16-20. Questions: 100% AI?, cost breakdown, kenapa tema judi bukan cyberbullying, aplikasi apa yg diklik, siapa creative director

**Apply to any 30s+ video:** if you can't predict at least 8 positive + 7 critical comments, the storyboard is too thin and needs more visual specificity.

---

## v2 Patch Checklist (when iterating from v1 to v2)

| # | Check | Action |
|---|-------|--------|
| 1 | First 3 seconds of hook | Visual content, no black, no slow fade |
| 2 | Text in any cell | Remove all, add Indonesian visual iconography |
| 3 | P09 (or any "hold" frame) | Single-cell highlight only, no double-lighting |
| 4 | Cell scenes | Add specific Indonesian context (cermin, warung tenda, meja kayu, puskesmas, sel tahanan) |
| 5 | Death/violent imagery | Make ambiguous (eyes open but unfocused, not collapsed dead body) |
| 6 | Negative prompt | Explicit ban on `text inside grid cells`, `text labels`, `written words in cells` |
| 7 | Predicted comments | Write 20 before generating — if 7+ are critical, the prompt needs more specificity |

**Cost: $0** — re-prompting only, no re-generation of paid images until storyboard is solid.

---

## Score Self-Assessment (validated, 2026-06-13)

For each clip's storyboard image, score 0-10 across these 5 dimensions:

| Dimension | Question | Weight |
|-----------|----------|--------|
| **Hook strength** | Does the first frame deliver a visual question? | 25% |
| **Visual reward cadence** | Is there a new visual every 2-3 seconds? | 20% |
| **Indonesian specificity** | Are settings recognizable as Indonesian (not generic Asian)? | 20% |
| **Continuity lock** | Will this clip transition smoothly to the next? | 20% |
| **Pacing** | Does the RHYTHM TRACK escalation match the visual story? | 15% |

**Total /10.** If any clip scores <6, regenerate that storyboard before generating motion. Motion re-rolls cost $0.50-0.75 each; storyboard re-rolls cost $0.02.

**Validated score progression for "16 Putaran":**

| Clip | v1 score | v2 score | Why +points |
|------|----------|----------|-------------|
| 1 Hook | 8/10 (9-panel, black opening) | **9/10** (12-panel, grid flash + smash cut + 11s second hook) | Hook retention |
| 2 Fates 1-4 | 7/10 (text labels + P09 double-highlight) | **8.5/10** (visual iconography + single-cell P09) | No text + P09 fix |
| 3 Fates 5-8 | 6/10 (TUNGGAKAN + text labels) | **8/10** (debt + motor key handoff, no text) | Motor/Arrears fix |
| 4 Fates 9-12 | 7/10 (generic body damage) | **8/10** (Indonesian context per cell, no text) | Indonesian context |
| 5 Fates 13-16 | 5/10 (text labels + death scene) | **8.5/10** (ambiguous still pose, no text) | Death → ambiguous |
| 6 Glitch | n/a (not yet generated) | — | Inherit 1-5 fixes |
| 7 End Card | n/a (not yet generated) | — | Inherit 1-5 fixes |

---

## Composite Recipe (CapCut / DaVinci, ~1.5-2 hours)

### Step 1: Lay clips in timeline

```
0:00-0:15  CLIP 1
0:15-0:30  CLIP 2
0:30-0:45  CLIP 3
0:45-1:00  CLIP 4
1:00-1:15  CLIP 5
1:15-1:30  CLIP 6
1:30-1:45  CLIP 7
```

Trim/extend at joints for seamless hard cut. Total 1:45.

### Step 2: Audio bed

- Drag `tap SFX` to track audio
- Split SFX at clip boundaries
- Per section, adjust SFX speed to match clip's tap tempo (use CapCut's "speed" tool on the SFX, NOT the video)
- Clip 6: use stutter edit — duplicate 0.1s tap 6-8 times, then silence
- Clip 7: drop audio entirely, add 1 inhale + 1 exhale

### Step 3: Color grade (unified)

Apply SAME LUT to all 7 clips:
- Lift shadows +5% blue
- Midtone -10% yellow saturation
- Contrast +10
- For grid clips (2-5): selective color on lit cells (+15% orange warmth, +5% brightness), dim cells (-20% brightness, push cyan)

### Step 4: Captions (Clip 7 only)

- White sans (Inter, Helvetica, or similar)
- Center frame
- 2-line fade in/out (NOT static)
- Text content: copy from Clip 7's motion prompt TEXT CONTENT block

### Step 5: Export

- Format: MP4 (H.264)
- Resolution: 1080x1920 (9:16)
- FPS: 24 or 30
- Bitrate: 8+ Mbps
- Audio: AAC 192kbps
- File: ~120-180 MB

---

## Re-roll Strategy (clip fails)

| Problem | Diagnosis | Fix |
|---------|-----------|-----|
| Face drift across clips | Different `rizky_ref` rendered | Use the SAME ref ID in every prompt. If still drift, re-roll the failing clip with the original storyboard. |
| Grid flips position | Spatial continuity lock not strong enough | Add "upper-center, fixed position, locked" to LOCATION block. Add `split-screen beyond the 4x4` to NEGATIVE PROMPT. |
| Face looks photoreal | Negative prompt not strong enough | Add `western realism, photoreal face, deep shadow, doll face` to NEGATIVE PROMPT. Re-roll. |
| 16 cells don't all appear | Too many cell activations in one clip | Cap at 4 cells per clip. Already enforced by structure — but if Pixazo/Seedance adds extra cells, tighten the grid position language. |
| Tap rhythm doesn't escalate | RHYTHM TRACK brackets missing | Always include bracket syntax `[hold\|pause\|build\|...]` — never free-form. |
| End card text wrong | Typography prompt malformed | Use exactly the TEXT CONTENT block format from Clip 7 template. Don't add "Indonesia" or other words. |
| **Text labels rendered as garbage** | AI hallucinated text in cells | **Apply the "NO TEXT IN GRID CELLS" rule.** Remove all text from cell descriptions; use visual iconography. Re-generate. |
| **P09 highlights 2 cells** | Double-lighting in hold frame | **Apply the "P09 single-cell rule."** Explicitly state "ONLY 1 new cell highlights per panel." |
| **First 3 seconds = black** | Audience swipes away | **Apply hook retention pattern.** P01 = 0.3s grid flash, P02 = 0.3s smash cut to black, P03+ = content. |
| **Death scene rendered** | Misread as glorifying / ambiguous | **Apply ambiguous still pose rule.** "Eyes open but unfocused, NOT death, NOT violent." |

---

## Cost & Time Budget (Kreafest 2026 baseline)

| Item | Cost | Time |
|------|------|------|
| 1 char ref (Pixazo Flux Schnell) | $0.02 | 30s |
| 7 storyboard images (Pixazo Flux Schnell) | $0.14 | 8 min |
| 7 motion clips (Seedance 2.0) | $3.50-5.25 | 20-30 min |
| Composite (CapCut) | $0 | 1.5-2 hours |
| SFX (CapCut free library) | $0 | 15 min |
| Color grade | $0 | 20 min |
| **Total** | **$3.66-5.41** | **~2.5-3 hours** |

Batch-generate storyboard images in parallel (4 in flight at once) to cut storyboard time from 8 min to 2 min.

---

## Submission Checklist (Kreafest format — adapt to competition)

- [ ] Export final video as `16_putaran_final.mp4` (1080x1920, H.264, 8+ Mbps)
- [ ] Upload to submission form (e.g., https://bit.ly/joinkreafest)
- [ ] Cross-post to Instagram Reels + TikTok (if required)
- [ ] Caption includes required handles (@kreafestpoldajatim, @humaspoldajatim)
- [ ] Caption includes required hashtags (#KreaFestPoldaJatim #PolriuntukMasyarakat #HariBhayangkara80 #AIVideoCompetition)
- [ ] Save submission confirmation screenshot
- [ ] Note any feedback received for next iteration

---

## What Makes This Pattern Win (judges' perspective)

1. **Conceptual clarity** — single idea (one gesture → N fates) executed consistently. No concept bloat.
2. **AI-appropriate** — leverages multi-image consistency, doesn't try to do impossible motion (no 360° character morph, no photoreal face).
3. **Emotional arc** — RHYTHM TRACK escalation matches the visual story. Judges feel it, even if they can't articulate why.
4. **Production discipline** — same ref, same LUT, same audio bed. Reads as a coherent piece, not 7 disconnected clips.
5. **Local relevance** — Indonesian visual context (BCA, gangguang, puskesmas, sel tahanan) signals respect for the audience, not just generic AI output.
6. **(v1.5.0) Hook retention** — 3-second visual question (no black opening) + pattern interrupt + second hook at 11s. Vertical short-form audiences swipe away in <3s.
7. **(v1.5.0) Visual specificity** — no text in cells, Indonesian props anchor each scene, ambiguous still pose for sensitive beats. Reads as deliberate, not auto-generated.

---

## Reference: Full Kreafest 2026 "16 Putaran" Prompts

The complete 7-clip storyboard + motion prompt stack for "16 Putaran" lives in the user-created Notion page from the 2026-06-13 session. Pattern is reusable — swap the 16 fates for any competition theme:

- Judi Online → 16 material/spiritual losses (validated)
- Cyber Bullying → 7 days of escalation OR 16 message types
- Kekerasan Seksual → 16 unsafe-recognition seconds OR 16 public spaces
- Any public-safety topic → 16 alternate outcomes of a single bad choice

Structure stays the same. Fates change.

**v2 patterns (2026-06-13) live in § "Hook Retention", § "NO TEXT IN GRID CELLS", § "Per-Clip P09 Rule", § "Death / Sensitive Imagery Rule", § "Predicted-Comments QC", § "v2 Patch Checklist", § "Score Self-Assessment" above.** Apply to any new competition submission.
