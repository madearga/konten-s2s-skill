# /s2s pipeline — Master Orchestrator

Runs all 3 steps end-to-end with checkpoints. The "one-shot" command for users who want the full Storyboard-to-Seedance workflow without manually invoking each step.

---

## Trigger

- Manual: `/s2s pipeline`
- Auto-detect: "full video pipeline", "storyboard to seedance complete", "bikin video AI lengkap"

If user wants just one step, redirect to the specific subcommand.

---

## Behavior

```
Step 1: /s2s storyboard
   ↓ (output: filled 12-section prompt + QC checklist)
   ↓ CHECKPOINT — user reviews prompt, can edit before sending to GPT Image 2
   ↓ User sends to GPT Image 2, gets storyboard.png
Step 2: Detect references needed (human? product? both?)
   ↓ Step 2a: /s2s character-ref   [if human in video]
   ↓ Step 2b: /s2s product-ref     [if product in video]
   ↓ IMPORTANT: BOTH can run in parallel if brief has human + product
   ↓ User sends to GPT Image 2, gets character.png / product.png
Step 2.5: Optional asset-role pass (v1.3.0)
   ↓ Ask whether first-frame / last-frame / camera-ref / action-ref / fx-ref / rhythm-ref / bgm-ref assets exist
   ↓ If yes, label each one with a single explicit role for Step 3
Step 3: /s2s motion
   ↓ (output: filled motion prompt + QC checklist)
   ↓ User sends to Seedance 2.0 with @[storyboard] + @[character] + @[product] attachments
   ↓ User gets final video.mp4

Final: Save bundle file
```

---

## Step 2 Reference Detection (CRITICAL — fixed in v1.2.0)

The pipeline must detect **all** reference types needed, not just one. Many briefs combine human + product (e.g., "Indonesian girl applying serum" needs both character ref AND product ref).

### Auto-Detect Keywords

| Reference | Detection keywords (case-insensitive, EN + ID) |
|-----------|------------------------------------------------|
| **Character** | `woman`, `man`, `girl`, `boy`, `person`, `orang`, `cewek`, `cowok`, `chef`, `model`, `actor`, `host`, names (Maya, Lina, etc.) |
| **Product** | `serum`, `sneaker`, `skincare`, `bottle`, `food`, `snack`, `protein bar`, `phone`, `earbuds`, `lipstick`, `cream`, `mask`, `coffee`, `tea`, brand names, product categories |
| **Both** | "X using/applying/wearing/holding/drinking/eating Y" pattern (X = person noun, Y = product noun) |

### Question Template (always ask, never auto-skip)

```
Q: What's in your video? (multi-select)
    A) Human character only
    B) Product only
    C) Both — human using/applying/holding product   ← DEFAULT for most FMCG/beauty/lifestyle
    D) No human, no product (landscape/abstract only)

If C:  → /s2s character-ref + /s2s product-ref (BOTH, can run in parallel)
If A:  → /s2s character-ref only
If B:  → /s2s product-ref only (with --type=hero/multi-angle/lifestyle/in-use)
If D:  → skip Step 2, go directly to Step 3
```

### Default Rule (when user says "video" or gives a brief)

**Default to C (Both) when brief contains human + product verbs** — this is the most common case for UGC, FMCG ads, beauty tutorials, cooking demos, fitness content. Skip C only if user explicitly says "no character" or "product only".

### Cost Impact

| Path | Reference types | Cost | Time |
|------|-----------------|------|------|
| Character only | 1 ref | +$0.07 | +30s |
| Product only | 1 ref | +$0.07 | +30s |
| **Both (default for human+product brief)** | **2 refs** | **+$0.14** | **+60s (parallel)** |
| No character, no product | 0 refs | +$0 | +0s |

Optional role-bound assets (first frame, camera ref, rhythm ref, etc.) typically add **clarity**, not API cost, unless the user must generate them first.

---

## Optional Asset-Role Pass (v1.3.0)

Before Step 3, ask this only when needed:

```text
Q: Any extra assets that should control only one part of the video?
   A) No — standard workflow
   B) First frame / last frame lock
   C) Camera behavior reference
   D) Action choreography reference
   E) FX / transition reference
   F) Rhythm / BGM reference
```

Rule: each extra asset gets exactly **one primary job** in the motion prompt.

---

## Bundle File Output

After all 3 steps complete, save a single markdown file at the user's working directory:

**Filename:** `s2s-bundle-YYYYMMDD-HHMMSS.md`

**Format:**

```markdown
# S2S Pipeline Bundle — <timestamp>

## Brief
<original user brief>

## Step 1: Storyboard Prompt
<output from /s2s storyboard>

## Step 2a: Character Reference Prompt  [if used]
<output from /s2s character-ref>

## Step 2b: Product Reference Prompt  [if used]
<output from /s2s product-ref>

## Step 3: Motion Prompt
<output from /s2s motion>

## QC Summary
| Step | Status |
|------|--------|
| Step 1: Storyboard | ✓ all 11 checks |
| Step 2a: Character ref | ✓ all 8 checks |
| Step 2b: Product ref | ✓ all 7 checks |
| Step 3: Motion | ✓ all 11 checks |

## Cost & Time
- GPT Image 2 (storyboard): ~$0.07
- GPT Image 2 (character ref, if used): ~$0.07
- GPT Image 2 (product ref, if used): ~$0.07
- Seedance 2.0 (video, 8-15s): ~$0.40-0.75
- **Total: ~$0.54-0.89 per video (1 ref) / ~$0.61-0.96 per video (both refs)**
- Wall time: ~10-15 minutes (mostly waiting on generations)

## Notes
- All prompts are GPT Image 2 / Seedance 2.0 ready
- Attachments needed for Step 3: storyboard.png + character.png (if used) + product.png (if used)
- Bundle saved at <path>
```

---

## Checkpoint Behavior

Between each step, **pause and wait for user approval**:

```
Step 1 complete. Here's the filled storyboard prompt:

[paste full prompt]

QC: 11/11 ✓
Cost so far: $0 (just prompt generation)
Next: send to GPT Image 2, save as storyboard.png, then continue.

→ Reply "ok lanjut" to continue
→ Reply "edit <section>" to revise a section
→ Reply "stop" to end pipeline (current state saved)
```

Same checkpoint after Step 2 and Step 3.

---

## Resume Capability

If user stops mid-pipeline, they can resume:

```
/s2s pipeline resume --from=step2
```

This loads the bundle file and picks up at Step 2. Bundle filename = state file.

If no bundle file exists, asks user to start fresh.

---

## Error Handling

| Failure | Behavior |
|---------|----------|
| User brief too vague | Ask clarifying Qs until 4 of 5 fields filled (concept, character, location, duration, energy) |
| Storyboard image path invalid (Step 3 standalone) | Prompt for valid path, don't run |
| Both character-ref and product-ref skipped (Step 2) | Warn: motion prompt will lack @[ref] — quality may drop, but proceed if user confirms |
| Director Strip text missing from Step 1 output | Warn, fallback to copy from worked example template |
| Bundle file write failure (Step 3) | Print all 3 prompts to console, log error, don't lose work |

---

## Decision Tree: When to Use /s2s pipeline vs Subcommands

```
Q: User has a brief but no images yet?
├─ YES → /s2s pipeline  (full orchestrator)
└─ NO  → Use subcommands directly:
         - Have storyboard image? → /s2s motion
         - Need just a storyboard? → /s2s storyboard
         - Need just a ref? → /s2s character-ref or /s2s product-ref
```

---

## Cost & Time Summary

| Step | Model | Cost | Time |
|------|-------|------|------|
| Step 1: Storyboard prompt | (skill, no API) | free | 5 min |
| Step 1: GPT Image 2 gen | GPT Image 2 | $0.07 | 30s |
| Step 2: Ref prompt | (skill, no API) | free | 2-5 min |
| Step 2: GPT Image 2 gen | GPT Image 2 | $0.07 | 30s |
| Step 3: Motion prompt | (skill, no API) | free | 5 min |
| Step 3: Seedance gen | Seedance 2.0 | $0.40-0.75 | 2-3 min |
| **Total (Lina's pipeline)** | | **~$0.54-0.89** | **~15-20 min** |

For batch 100 ads: **~$54-89 total** at Fast tier (half cost).

---

## Output Deliverables

1. **3 copy-paste prompts** (Storyboard, Ref, Motion)
2. **3 generated images** (storyboard.png, character.png OR product.png)
3. **1 final video** (video.mp4)
4. **1 bundle file** (s2s-bundle-YYYYMMDD-HHMMSS.md) — all 3 prompts + QC summary

---

## Related

- `../SKILL.md` — entry point + decision tree
- `storyboard.md` — Step 1 only
- `character-ref.md` — Step 2a only
- `product-ref.md` — Step 2b only
- `motion.md` — Step 3 only
- `../references/seedance-asset-binding.md` — optional role-binding layer
- `../references/seedance-pattern-library.md` — optional scenario patterns
