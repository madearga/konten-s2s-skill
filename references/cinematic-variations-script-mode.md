# Cinematic Variations: Script-Mode + Character Consistency

**Created:** 2026-06-15 (v1.6.3)
**Source:** Social-issue competition video session (5 clips × 15s, anonymized case)

---

## Script-Mode (When User Has a Full Script)

### Default vs Script-Mode

| | Default Mode | Script-Mode |
|---|---|---|
| **Input** | 1 subject/brief | Full creative script (N clips × M panels) |
| **Output** | 10 composition OPTIONS for one moment | 10 KEY MOMENTS, each with assigned composition |
| **Goal** | Explore visual language before committing | Lock compositions from script intent |
| **When** | User says "explore compositions for X" | User says "cinematic from this script" / "generate storyboard from script" |

### How to Run Script-Mode

1. Read script → identify 10 key moments (spread across clips, one per major beat)
2. For each moment, assign ONE composition from the 19-vocab library using the beat-type table in `references/cinematic-composition-vocabulary.md`
3. Write 10 prompts, each with:
   - **Title** (evocative, 2-4 words)
   - **Script beat** (which clip, which panel)
   - **Beat type** (hook, establishing, emotional, impact, etc.)
   - **Composition name + vocab number**
   - **Full image prompt** (one paragraph, same format as default mode)
4. Output in same numbered format as default cinematic-variations

### Composition Rotation Across Multiple Sets

When generating script-mode sweeps for multiple clips (e.g., 5 clips × 10 prompts = 50 images):

- **Track** which of the 19 composition styles have been used in previous sets
- **Assign unused styles first** in each new set
- If reuse is necessary (19 styles < 10×N prompts), change the subject/context enough that the same composition produces a visually different result
- Goal: maximize visual variety across the entire project, not just within one set

**Validated example (2026-06-15):**
- Set 1 (Clip 1): 10 styles used (handheld close, diagonal, frame-in-frame, wide neg space, reflection, compressed telephoto, layered FG/MG/BG, deep vanishing point, symmetrical, POV)
- Set 2 (Clip 2): 9 NEW styles + 1 reuse = 19/19 total coverage
- Reflection was reused in Set 2 but with a completely different subject (broken phone reflection of face vs. phone reflection of childhood memory)

### Output Enhancement: Composite Storyboard

After generating all 10 images, composite them into a single storyboard grid image using `scripts/storyboard_composite.py`. This gives the user one file to review instead of 10 separate images. The composite includes:
- Title bar with project name + clip number
- 5×2 grid of portrait images (480×720 each)
- Label below each image (title + composition style)
- Dark background (#0C0C0F)

---

## Character Consistency: The #1 Ordering Mistake

### The Problem

Generating a 10-image cinematic sweep (or script-mode batch) WITHOUT a character reference produces **zero facial consistency**. Every image will look like a different person, even with identical character descriptions in each prompt.

**Validated 2026-06-15:**
- 20 images generated across 2 sets (10 per clip)
- Same character description (the protagonist, 28, Indonesian-Javanese) in every prompt
- Result: 20 different faces. Zero consistency.
- User caught it: "itu semuanya berubah ubah sepertinya"

### Correct Pipeline Order

```
WRONG:  cinematic-variations → (notice faces differ) → character-ref → re-generate
RIGHT:  character-ref → cinematic-variations → storyboard → motion
```

### Why It Happens

`image_generate` (GPT Image 2) does NOT support face-locking via reference image input. Each generation is independent — the model interprets the text description fresh each time, producing natural variation. Text consistency (same description in every prompt) reduces variation but does NOT eliminate it.

### What Actually Helps

1. **For motion/video (Step 3):** Seedance/Veo/Kling DO support image-to-video with reference. The character ref image is valuable here as `@[character ref]`.
2. **For image generation (Steps 1-2):** Bake the EXACT SAME character description (verbatim, word-for-word) into every prompt. Minimizes but doesn't eliminate variation.
3. **For perfect consistency across key frames:** Use a backend that supports image-to-image with reference:
   - Pixazo with reference image input
   - Midjourney `--cref` (character reference)
   - Stable Diffusion with ControlNet/IP-Adapter

### Practical Recommendation

For competition videos where the storyboard images are PLANNING documents (not final output):
- Accept some variation in the cinematic sweep — it's exploration
- Generate character ref AFTER the sweep (for motion prompts)
- The cinematic key frames don't need perfect face consistency; the VIDEO output does

For projects where the storyboard images ARE the final deliverable:
- Generate character ref FIRST
- Use a face-locking backend (Pixazo reference, Midjourney `--cref`)
- Or generate all frames in a single batch with explicit "same person as previous" instructions

---

## Related

- `commands/cinematic-variations.md` — default mode (10 compositions × 1 subject)
- `references/cinematic-composition-vocabulary.md` — 19 styles + Script-to-Storyboard assignment table
- `scripts/storyboard_composite.py` — PIL script to composite 10 images into 1 grid
- `SKILL.md` pitfall #11 — character consistency ordering rule
