# /s2s motion — Step 3: Seedance 2.0 Motion Prompt

Generates a **complete Seedance 2.0 motion prompt** with 5-part spine, panel beats, director strip text, and audio strategy. Uses previously-saved storyboard + character/product references.

---

## Trigger

- Manual: `/s2s motion`
- Auto-detect: "motion prompt", "Seedance prompt", "video prompt", "bikinin prompt video"

If user has no storyboard yet, redirect to `/s2s storyboard` (Step 1).

---

## Required Inputs

| Input | Source | Required? |
|-------|--------|-----------|
| Storyboard image path/URL | Step 1 output | Required unless a depth map storyboard replaces it |
| Depth map storyboard path/URL | `/s2s depth-map` output | Optional replacement for normal storyboard when composition/style decoupling is desired |
| Tone + visual-style reference | User / look development | Required when using a depth map storyboard |
| Character ref path/URL | Step 2a output | Required if video has human |
| Product ref path/URL | Step 2b output | Required if video has product |
| Brief (duration, energy, audio) | User | Required |
| Extra role-bound assets | User or analysis step | Optional |

### Optional extra assets (v1.3.0)

Use only when they solve a specific problem:

| Asset | Role |
|------|------|
| First-frame still | lock exact opening state |
| Last-frame still | lock exact landing state |
| Camera reference video | borrow camera behavior only |
| Depth map storyboard | borrow camera placement, framing, scale, and spatial layout only |
| Tone + visual-style reference | borrow final color, lighting, texture, material, and mood only |
| Action reference video | borrow choreography only |
| FX reference video | borrow transition/VFX grammar only |
| Rhythm reference video | borrow pacing/cut density only |
| BGM/audio reference | borrow tempo/mood only |
| Typography still | borrow title-card style only |

**Q-template (only if not already in bundle from `/s2s pipeline`):**

```
Q1: Where are the images?
    A) I'll provide paths (please paste)
    B) I have URLs (please paste)
    C) Use defaults from previous /s2s run

Q2: Duration?
    A) 4s (snappy)
    B) 8s (smooth, recommended for product)
    C) 12s (atmospheric)
    D) 15s (full sequence)

Q3: Audio strategy?
    A) Silent (diegetic foley only — RECOMMENDED for editability)
    B) Music baked in (specify genre + BPM)

Q4: Energy?
    A) High-rhythm (smash cuts, loopable)
    B) Mid-rhythm (build, cooking montage)
    C) Slow cinematic (master + beauty)

Q5: Optional attachment roles?  (only ask if user has 3+ assets or existing-video task)
    A) No extra roles — use standard workflow
    B) First frame / last frame lock
    C) Camera / action / FX reference split
    D) Rhythm / BGM reference split
    E) Existing-video mode (extend / edit / fuse)
```

---

## Specialized Templates (v1.2.0)

Some briefs trigger auto-injected safety / regulatory templates that affect motion generation.

### Pregnancy / Maternal Content Safety (auto-trigger)

**Detection keywords** (case-insensitive, EN + ID): `pregnant`, `pregnancy`, `expecting`, `prenatal`, `maternal`, `bumil`, `hamil`, `baby-bump`, `trimester`, `mengandung`, `hamil muda/besar`

**When detected, auto-modify the motion prompt:**

1. **RHYTHM TRACK** — force calm UGC vocabulary (settle, breathe, soft land, ease, drift, float + micro/macro block + gentle/rest/drift/breath beat). Override any high-energy defaults.

2. **EMOTIONAL GUIDANCE** — use calm templates:
   - Valence: "peaceful, content, settled, gentle, supported, mindful"
   - Arousal: "soft opening -> gentle build -> contemplative middle -> peaceful resolution through stillness and breath"

3. **CONSTRAINTS** — append:
   ```
   - No high-impact motion, no jumps, no sudden direction changes
   - No extreme body compression (deep twists, prone positions)
   - Movement should feel supported, gentle, intentional
   - Match motion intensity to subject's energy level (not artificially amplified)
   ```

4. **NEGATIVE PROMPTS** — append:
   ```
   - No contact sports, no high-impact motion, no extreme body compression
   - No sudden direction changes or jarring transitions
   ```

5. **Disclaimer** (for published content caption):
   > "Educational content. Always consult your healthcare provider before starting any new exercise, diet, or wellness routine during pregnancy."

6. **QC Checklist** adds one item:
   - [ ] **Pregnancy safety constraints injected** (if brief detected as maternal content)

### Other Specialized Templates (future)

- Pet/Animal Safety (auto-detect "puppy", "kitten", "pet")
- Children's Content Safety (auto-detect "kid", "child", "balita", "anak")
- Medical/Health Claims (auto-detect "cure", "treat", "diagnose", "obat")
- Financial Claims (auto-detect "guaranteed return", "risk-free", "pasti profit")

v1.2.0 ships with pregnancy safety as the canonical example.

---

## Behavior

1. Verify image paths/URLs exist
2. Load `../references/seedance-motion-prompt.md` (the 5-part spine)
3. Load `../references/director-strip-7-track.md` (vocabulary)
4. Load `../references/seedance-asset-binding.md` when 3+ assets or mixed media roles are involved
5. Load `../references/depth-map-storyboard.md` when a depth map storyboard is attached; enforce depth=composition only, tone ref=look only, character/product sheet=identity only
6. Load `../references/seedance-pattern-library.md` when the user wants extend/edit/fuse/beat-sync/dialogue/one-take behavior
7. Load `../references/seedance-2-best-practices-2026.md` (broader context)
8. Pull **director strip text + panel beats from Step 1 output** (the real signal — storyboard image alone is unreadable at panel resolution)
9. If needed, add an **ASSET ROLE BINDING** block to state what each attachment controls and what to ignore
10. If needed, switch into the correct **mode override**: standard / extend / edit / fuse / beat-sync / dialogue / one-take
11. Build the 5-part spine:
   - **SUBJECT** (1-2 sentences, identity)
   - **ACTION** (2-4 sentences, story in prose)
   - **CAMERA** (per-panel P## / focal length / shot type)
   - **STYLE** (visual signature)
   - **CONSTRAINTS** (what to avoid)
12. Add **Emotional Guidance 2-axis** (Valence + Arousal)
13. Add **Audio strategy** (default: silent, diegetic foley only)
14. Add **Panel beats per P##** with shot + motion + foley + emotional beat + audio cue
15. Add **Negative prompts** (no music, no logo, no text, no watermark, no frame numbers)
16. Run QC checklist (11 base items + optional role-binding checks)
17. Output: copy-paste-ready prompt + checklist + attachment list

---

## Optional Prompt Modes (v1.3.0)

`/s2s motion` remains the same command, but it can emit different Step 3 variants:

| Mode | When to use | What changes |
|------|-------------|--------------|
| Standard | Default new video generation | existing v1.2.0 behavior |
| Extend | Continue an existing clip forward/backward | action + constraints wording switches to continuation |
| Edit | Keep most of a clip, replace one variable | prompt explicitly states what stays vs changes |
| Fuse | Merge 2-3 clips into one sequence | prompt adds transition logic and source-role split |
| Beat-sync | Music/rhythm-led montage | panel beats map more tightly to rhythm refs |
| Dialogue | Talk-to-camera / skit / host delivery | camera becomes calmer, facial readability prioritized |
| One-take | No-cut choreography | cuts removed, camera path continuity emphasized |

---

## Output Format

```
## Motion Prompt (Seedance 2.0)

<prompt text — full 5-part spine + director strip + panel beats + emotional guidance + audio + negative>

## QC Checklist
- [✓] `@[storyboard ref]` referenced at top
- [✓] `@[character ref]` or `@[product ref]` referenced
- [✓] Extra attachments named with explicit roles (if any)
- [✓] Depth storyboard controls composition only; tone reference controls look only (if depth workflow)
- [✓] Subject line (1-2 sentences) — identity
- [✓] Action line (2-4 sentences) — story in prose
- [✓] Camera line — per-panel P## / focal length / shot type
- [✓] Style line — visual signature
- [✓] Constraints line — what to avoid
- [✓] **Emotional Guidance 2-axis** (Valence + Arousal)
- [✓] Audio strategy explicit (silent/diegetic OR music+specs)
- [✓] **Panel beats per P##** with shot + motion + foley + emotional beat + audio cue
- [✓] Negative prompts: no music, no logo, no text, no watermark, no frame numbers

## Attachments Needed
- @[storyboard ref]: <path or URL>
- @[depth storyboard]: <path or URL> [use instead of normal storyboard when applicable]
- @[tone visual reference]: <path or URL> [required with depth storyboard]
- @[character ref]: <path or URL>  [if applicable]
- @[product ref]: <path or URL>    [if applicable]

## Cost & Time
- Seedance 2.0 Standard: ~$0.05/s, 8-15s clip = $0.40-0.75
- Seedance 2.0 Fast (for iteration): ~half cost
- Generation: ~2-3 min per clip
- Total Step 3: ~5-10 min (including image uploads + first review)

## Suggested Next Step
- Generate, review for drift + emotion + audio sync
- If something off → re-roll with same prompt (cheap)
- If structural issue → re-check the 5-part spine + director strip text
- For multi-clip sequences → run `/s2s motion` again with new storyboard (modular 2-storyboard strategy)
```

---

## Common Errors

| User Input | Error | Fix |
|------------|-------|-----|
| "Just the prompt text" (no image paths) | Can't generate without refs | Force user to provide storyboard.png + character.png / product.png |
| "Make it 60 seconds" | Out of scope (drift risk) | Split into 4-6 short clips, use multi-cut strategy |
| "Add dramatic music" | Locks pacing, hard to re-edit | Push back: generate silent, add music in post (CapCut/DaVinci) |
| No panel beats in prompt | Image is unreadable at panel resolution | Force-write panel beats from Step 1's director strip |
| "Use just the image, no text" | Director strip text is the actual signal | Re-explain: image = documentation, text = contract |
| Many attachments but no role binding | Camera/action/style signals bleed together | Name each extra asset and state exactly what it controls |
| Existing clip task treated as new generation | Continuity breaks | Switch to extend/edit/fuse mode wording |

---

## Critical Rule (Reinforced)

**The storyboard image is documentation. The text in this prompt is the contract.**

When Seedance 2.0 processes the storyboard image, it gets downsampled to ~30px per panel. Essentially unreadable. The model relies on the **director strip text + panel beats written in this prompt** to know what each panel should do.

If you skip writing the panel beats, the video will be generic, not match your storyboard intent.

---

## Related

- `../references/seedance-motion-prompt.md` — full 5-part spine template
- `../references/director-strip-7-track.md` — vocabulary
- `../references/seedance-asset-binding.md` — optional attachment role system
- `../references/seedance-pattern-library.md` — optional extend/edit/fuse/dialogue/beat-sync modes
- `../references/seedance-2-best-practices-2026.md` — broader context
- `storyboard.md` — Step 1 (storyboard)
- `character-ref.md` / `product-ref.md` — Step 2a/2b (reference images)
