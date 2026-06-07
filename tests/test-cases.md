# Test Cases — storyboard-to-seedance-suite

5 test cases covering all 5 commands. Manual verification (no automated test framework — each test produces a real prompt that user sends to GPT Image 2 / Seedance 2.0).

---

## TC1: `/s2s storyboard`

**Input:** `/s2s storyboard` + brief "Indonesian girl in kitchen making nasi goreng, energetic, 15s"

**Expected Output:**
- Full 12-section GPT Image 2 prompt, all sections filled
- P02 master shot with full geography + screen directions
- RHYTHM TRACK with bracket vocabulary (e.g., "burst / short block / clean beat")
- ESCALATION MAP with L1-L5 (e.g., "L3 rise / spike")
- STORYBOARD PURITY (monochrome, no text inside panels)
- Panels numbered P01-P## (typically 12-16 panels for 15s)
- 11/11 QC checklist pass

**Pass criteria:**
- All 12 sections present and non-empty
- P02 explicitly specifies geography with screen directions
- Bracket vocabulary used in RHYTHM and ESCALATION tracks
- No `[PLACEHOLDER]` text left in prompt

---

## TC2a: `/s2s character-ref`

**Input:** `/s2s character-ref` + "young Indonesian woman, 25, casual streetwear"

**Expected Output:**
- GPT Image 2 character sheet prompt
- 3 angles (3/4 front, front, side profile)
- Stylized 3D, semi-realistic style
- Outfit fully described (cream linen shirt, dark jeans, sneakers, etc.)
- 8/8 QC checklist pass

**Pass criteria:**
- 3 angles specified
- Style locked (3D stylized, semi-realistic)
- Consistency locks present (no redesign, no age-shift, no duplicate)
- "No human hands" not required for character ref (only product)

---

## TC2b: `/s2s product-ref --type=multi-angle`

**Input:** `/s2s product-ref --type=multi-angle` + "blue sneakers, minimalist"

**Expected Output:**
- GPT Image 2 product prompt with 4-angle grid
- Studio lighting, no-human-hands negative
- Material, color, key features described
- 7/7 QC checklist pass

**Pass criteria:**
- 4 panels specified (front, 3/4, side, elevated)
- "No human hands" in negative prompts
- "No text, no logos, no watermarks" in negative prompts
- Padding 10-15% specified for camera movement

---

## TC3: `/s2s motion`

**Input:** `/s2s motion` + `storyboard.png` + `character.png` + brief "energetic, 15s, silent"

**Expected Output:**
- Seedance 2.0 motion prompt
- 5-part spine (Subject → Action → Camera → Style → Constraints)
- `@[storyboard ref]` and `@[character ref]` attachments
- Director Strip text copied from Step 1 output
- Emotional Guidance 2-axis (Valence + Arousal)
- Audio strategy (default: "No music, diegetic foley only")
- Panel beats per P## with shot + motion + foley + emotional beat + audio cue
- Negative prompts: no music, no logo, no text, no watermark
- 11/11 QC checklist pass

**Pass criteria:**
- All 5 spine sections present
- Director strip text present (not just "see storyboard")
- Emotional Guidance split into Valence + Arousal
- Audio strategy explicit
- Panel beats per P## (not just camera direction)

---

## TC4: `/s2s pipeline` (end-to-end)

**Input:** `/s2s pipeline` + brief "Indonesian girl in kitchen making banana bread, 15s, high-rhythm smash cuts"

**Expected Output:**
- 3 prompts (storyboard + character-ref + motion) generated sequentially
- 3 checkpoints (user reviews/approves each prompt)
- Bundle file saved as `s2s-bundle-YYYYMMDD-HHMMSS.md`
- All QC checks pass

**Pass criteria:**
- Step 1 → Step 2 → Step 3 executed in order
- User can pause + resume mid-pipeline
- Bundle file contains all 3 prompts + QC summary
- Final cost ~$0.54-0.89 (image gen + video gen)
- Wall time ~15-20 min (mostly waiting on generations)

---

## TC5: `/s2s motion` with Director Strip missing (error handling)

**Input:** `/s2s motion` + valid `storyboard.png` + `character.png`, but user skips providing director strip text

**Expected Output:**
- Warning: "Director Strip text missing from Step 1 output. Fallback to copy from worked example template."
- Motion prompt generated with fallback director strip
- Suggestion: re-run `/s2s storyboard` with explicit director strip

**Pass criteria:**
- Warning displayed to user
- Fallback to worked example template works
- User informed how to fix for next iteration

---

## TC6: `/s2s cinematic-variations` (pre-visualization sweep)

**Input:** `/s2s cinematic-variations Indonesian girl in kitchen holding finished banana bread`

**Expected Output:**
- 10 distinct cinematic image prompts
- Each prompt uses a different composition style (from 19 in `cinematic-composition-vocabulary.md`)
- All 10 share the same subject (Indonesian girl, banana bread)
- Each prompt includes:
  - Title (short, evocative, 2-4 words)
  - Composition concept (1-line camera/position)
  - Full image prompt (1 clean paragraph, ~80-120 words)
  - Base style: `cinematic realism, film stock grain, film still`
  - Texture pack (1-2 textures)
  - Default negatives: `no clean digital sharpness, no CGI look, no poster composition, no centered portrait, no black bars`

**Pass criteria:**
- All 10 prompts use different compositions (no two the same)
- Each prompt specifies mid-action verb (not static posing)
- 10 compositions cover variety: at least 2 wide/establishing, 2 close/intimate, 2 high/low angle, 2 stylistic, 2 architectural
- 11/11 QC checklist pass per prompt

**With `--pick=3` flag:**
- 10 prompts generated
- Top 3 recommendations section appended
- Recommendations include "use as P01", "use as P02", "use as P## anchor" guidance

---

## Manual Verification Process

After running each test case manually:

1. **TC1 (storyboard):** Copy prompt to GPT Image 2. Verify:
   - Image renders as monochrome rough-sketch panel grid
   - 12-16 panels visible
   - Director strip with rhythm/escalation tracks visible
   - No color inside panels
   - No text labels inside panels

2. **TC2a (character ref):** Copy prompt to GPT Image 2. Verify:
   - 3 angles visible (3/4 front, front, side profile)
   - Same face/hair/outfit in all 3 angles
   - Clean background, no other people

3. **TC2b (product multi-angle):** Copy prompt to GPT Image 2. Verify:
   - 4 panels in 2x2 grid
   - Same product (color, material, branding) in all 4
   - No human hands
   - No fake logos / text

4. **TC3 (motion):** Copy prompt to Seedance 2.0 with @[refs] attached. Verify:
   - Generated video follows panel beats (not random)
   - Emotional Guidance 2-axis shows (not flat mood)
   - Audio strategy honored (silent OR music+specs)
   - No drift between panels

5. **TC4 (pipeline):** Verify:
   - Bundle file structure matches spec
   - All 3 prompts present in bundle
   - QC summary aggregated correctly
   - Cost + time summary accurate

6. **TC6 (cinematic-variations):** Verify:
   - All 10 prompts use different compositions
   - Each prompt specifies mid-action verb
   - Each prompt includes base style + texture + negatives
   - `--pick=3` produces 3 recommendations (if flag used)

---

## Automated Tests (Future)

This is **manual verification only** in v1.0. Future versions could add:
- LLM-as-judge for QC checklist auto-pass
- Image diff between consecutive @[character ref] runs (identity consistency check)
- Video frame analysis for drift detection
- Cost + time tracking per pipeline run

Track these as future work — not in scope for v1.0.
