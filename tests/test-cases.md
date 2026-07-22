# Test Cases — storyboard-to-seedance-suite

8 grouped test cases covering the command surface plus optional enhancement layers. Some groups include multiple scenario variants (for example TC2a/TC2b and TC3/TC3b). Manual verification only — each test produces a real prompt that the user sends to GPT Image 2 / Seedance 2.0.

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

## TC3b: `/s2s motion` with asset-role binding (v1.3.0 additive)

**Input:** `/s2s motion` + `storyboard.png` + `character.png` + `product.png` + `camera-ref.mp4` + brief "beauty UGC, 12s, calm, use camera-ref only for handheld movement"

**Expected Output:**
- Standard 5-part spine still present
- Added **ASSET ROLE BINDING** block
- Explicit lines like:
  - `Use @[character ref] for identity only`
  - `Use @[product ref] for product continuity only`
  - `Use @[camera ref video] for handheld behavior only`
- No ambiguity about what each attachment controls

**Pass criteria:**
- Existing v1.2.0 structure preserved
- Extra assets named with one primary job each
- Prompt explicitly says what to ignore from camera-ref video

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

## TC7: Existing-video pattern mode (extend/edit/fuse)

**Input A:** `/s2s analyze --seedance reference-ugc.mp4` + user request "extend this by 5s"

**Expected Output A:**
- Analysis still works as before
- Recommended Step 3 mode = **Extend Existing Video**
- Motion prompt includes wording like `Generate only the NEW continuation segment`

**Input B:** `/s2s motion` + 2 reference clips + brief "merge these into one product reveal"

**Expected Output B:**
- Step 3 mode = **Fuse Multiple Clips**
- Prompt adds transition logic and source-role split

**Pass criteria:**
- No new command required
- Existing `/s2s motion` command handles the variant by changing wording only
- Standard users who do not need these modes see unchanged behavior

---

## TC8: `/s2s depth-map` revised conversion workflow

**Input:** `/s2s depth-map storyboard.png tone=look.jpg character=character.png`

**Expected Output:**
- Normal storyboard is treated as immutable source geometry
- Paste-ready monocular grayscale conversion prompt
- Layout contract records canvas, aspect ratio, grid, panel count, dividers, and reading order
- Canonical depth convention: white nearest, near-black farthest, black dividers
- Seedance role binding: depth=composition, tone=look, character=identity
- Text-to-image-only backend returns an honest blocker instead of claiming conversion

**Pass criteria:**
- Workflow order is normal storyboard → depth conversion, never direct depth generation by default
- Prompt preserves exact framing, perspective, composition, silhouettes, and objects
- Prompt bans RGB, lighting, texture, reflection, fog, blur, AO, halos, labels, and layout changes
- QC blocks handoff if panel count/layout/composition changed
- Each attached asset has exactly one primary role

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

This is **manual verification only** in v1.3.0. Future versions could add:
- LLM-as-judge for QC checklist auto-pass
- Image diff between consecutive @[character ref] runs (identity consistency check)
- Video frame analysis for drift detection
- Cost + time tracking per pipeline run

Track these as future work — not in scope for v1.0.

---

## TC7: `/s2s vo-v3` (ElevenLabs v3 inline audio tags — added v1.11.0)

**Input:** `/s2s vo-v3` + "Pigeon straw 240ml, 15 detik, casual mom, Indonesian, light audio events"

**Expected Output:**
- Single `.txt` file at `~/Downloads/vo_scripts/pigeon-straw-240ml-tiktok-15s-casual-mom-v3.txt`
- Plain text (parses without error via `python3 -c "open('file').read()"`)
- **NOT** valid XML or SSML — no `<speak>`, `<break>`, `<prosody>`, `<emphasis>` anywhere
- 4-segment UGC arc with v3 inline tags: hook → problem → product → CTA
- Each segment uses bracketed lowercase tags verified in `references/elevenlabs-vo-v3-tags.md`
- Pause control via `[short pause]` / `[pause]` / `[long pause]` (NOT SSML `<break>`)
- Numbers written as words (`dua ratus empat puluh mili`, not `240ml`)
- No emoji in body
- Word count for Indonesian 15s target: 30–38 spoken words (excluding tags)

**Variants to verify:**
- TC7a: Casual mom (default — tone = `[calm][cheerfully]` for hook + CTA, `[tired]` for problem, `[emphasized]` for benefit beat)
- TC7b: Hype UGC (tone = `[excited][happily]`, `[rushed]`, reaction sounds `[laughs]`)
- TC7c: Calm expert narrator (tone = `[calm]` + `[slows down]` for problem beat, `[calm][cheerfully]` close)

**Edge cases:**
- Numbers in input ("240ml") → MUST be written as words in output
- Emoji in input → MUST be stripped before emitting
- < 3 args from user → agent asks 5 questions or applies defaults
- Existing `/s2s motion` output for same product → VO segments sync to motion timeline
- User asks for real-time / conversational → route to `eleven_turbo_v2_5` or `eleven_flash_v2_5` (NOT v3)
- User asks for PVC voice → reject per official blog (PVC not optimized for v3)
- Indonesian wpm correction applied (~130 wpm effective, ~85–90% of English 150 wpm baseline)

---

## TC8: `/s2s troubleshoot` retake triage (v1.12.0)

**Input:** User says: "Take 2 still restarts the action instead of continuing from the accepted parent clip. Should I regenerate?"

**Required loaded references:**
- `references/seedance-retake-protocol.md`
- `references/seedance-model-mechanics.md`
- `references/seedance-failure-atlas.md`
- `references/seedance-troubleshooting.md`

**Expected behavior:**
- Do **not** blindly regenerate.
- Output a triage verdict: `Rewrite` if the same restart flaw happened in 2+ takes; otherwise `Re-roll` only if prompt is correct and sample looks unlucky.
- Diagnose dominant mechanism: compounding error / missing observed state handoff.
- Use Failure Atlas row: `Action restarts` → completed beat not marked already happened → add completed beat exclusion.
- Apply the one-variable rule: change only the opening/continuation state clause, not camera/style/product/ref stack.
- Include a shot log line:
  `Take N · changed: opening state / completed beat exclusion · seed: same/new · verdict: rewrite · evidence: action restarted twice`

**Pass criteria:**
- Report includes: Symptom, Triage Verdict, Diagnosis, One-Variable Repair, Retake Prompt, Shot Log, Stop Condition.
- Repair prompt starts from observed parent end state, not planned ending.
- Repair excludes already-completed action.
- No unrelated rewrite of style, camera, aspect ratio, product, or character identity.

---

## TC9: `/s2s help` command guide (v1.13.0)

**Input A:** `/s2s help`

**Expected:**
- Shows compact command map.
- Includes at least: help, interview, storyboard, character-ref, product-ref, motion, ads, analyze, troubleshoot, vo-v3, bundle, pipeline.
- Gives 3–5 example invocations.

**Input B:** `/s2s help vo-v3`

**Expected:**
- Explains only `/s2s vo-v3`.
- Includes: use when, inputs needed, output `.txt` with `[lowercase_tags]`, example, next command.

**Input C:** `fungsi s2s buat iklan produk apa?`

**Expected:**
- Routes to `/s2s ads` as smallest matching command.
- Does not start full pipeline unless user asks for full workflow.
