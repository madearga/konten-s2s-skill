# /s2s storyboard — Step 1: Storyboard Image Prompt

Generates a complete **12-section GPT Image 2 storyboard prompt** from a user brief. Outputs a copy-paste-ready prompt + QC checklist.

---

## Trigger

- Manual: `/s2s storyboard`
- Auto-detect: "storyboard", "12-section storyboard", "video storyboard", "bikin storyboard"

If user just says "video" with a brief, ask whether they want storyboard first (Step 1) or full pipeline (`/s2s pipeline`).

---

## Inputs to Gather (1-3 Clarifying Questions)

Ask until **at least 4 of 5** fields are filled:

| Field | Example | Required? |
|-------|---------|-----------|
| Concept | "Indonesian girl in kitchen making nasi goreng" | Required |
| Character | "Maya, 25, casual streetwear" | Required (or "no character, product only") |
| Location | "warm kitchen, window screen-left, teal cabinets" | Recommended |
| Duration | 4s / 8s / 12s / 15s (default: 15s) | Recommended |
| Energy / vibe | "energetic smash cuts" / "slow cinematic" / "loopable high-rhythm" | Recommended |

If user gives a full brief, fill 4-5 directly. If vague, ask the minimum.

**Q-template (multi-choice when possible):**

```
Q1: What's the core concept?
    A) [first guess]
    B) [alternative interpretation]
    C) Let me describe it

Q2: Is there a human character, or is this product-only?
    A) Yes, single character
    B) Yes, 2+ characters
    C) No character (product/landscape only)

Q3: What's the rhythm?
    A) High-rhythm smash cuts (loopable, fast)
    B) Mid-rhythm cinematic (cooking montage, build)
    C) Slow cinematic (master + beauty shots)

Q4: Duration?
    A) 4s (snappy, action)
    B) 8s (smooth, product)
    C) 12s (atmospheric)
    D) 15s (full sequence)
```

---

## Optional Pre-Step: Composition Sweep

Before building the full storyboard, optionally run `/s2s cinematic-variations <subject>` to explore **10 different cinematic compositions** of the key moment. Pick the most striking → use it as P01 of the storyboard.

```
# Optional workflow:
/s2s cinematic-variations Indonesian girl holding finished banana bread --pick=3
# → generates 10 single-image prompts, picks top 3
# → use top 3 as P01, P02, P## anchors

/s2s storyboard Indonesian girl in kitchen making banana bread, energetic, 15s
# → builds full 12-section prompt, using picked compositions as anchor panels
```

This is **optional** — for tight budgets, skip and go directly to `/s2s storyboard` (1 image at $0.07). Use the sweep when you want to explore visual language before committing.

---

## Specialized Templates (v1.2.0)

Some briefs trigger auto-injected safety / regulatory templates. Detection happens in the Behavior section, injection happens in the Output Format section.

### Pregnancy / Maternal Content Safety (auto-trigger)

**Detection keywords (case-insensitive, EN + ID):**
- `pregnant`, `pregnancy`, `expecting`, `prenatal`, `maternal`, `bumil`, `hamil`, `baby-bump`, `trimester`, `mengandung`, `hamil muda/besar`

**When detected, auto-append this block to CONSTRAINTS section of the storyboard prompt:**

```
[MUST READ — PREGNANCY/MATERNAL SAFETY]
- No high-impact stunts, jumps, sudden direction changes
- No exercises requiring balance on uneven surfaces
- Avoid poses that compress the abdomen (deep twists, prone positions)
- No extreme heat exposure (hot yoga, sauna, hot baths)
- No contact sports or activities with fall risk
- Show modifications for different trimesters when applicable
- This is educational/lifestyle content, NOT medical advice
- Include disclaimer: "Always consult your healthcare provider before starting any new exercise or diet during pregnancy"
- Show inclusive body representation (different body types, not just one "ideal")
- Movement should feel supported, gentle, intentional — not jarring
```

**For motion prompt, also add to EMOTIONAL GUIDANCE / PANEL BEATS:**
- Match motion intensity to subject's energy level
- Avoid sudden direction changes or impact beats in body movement
- Use settle/breath/rest vocabulary from RHYTHM TRACK (calm UGC variant)

**For Seedance 2.0 motion generation, add to NEGATIVE PROMPTS:**
- "No contact sports, no high-impact motion, no extreme body compression, no sudden direction changes"

**Disclaimer block (always include in caption/description for published content):**
> "Educational content. Always consult your healthcare provider before starting any new exercise, diet, or wellness routine during pregnancy."

### Other Specialized Templates (future)

- Pet/Animal Safety (auto-detect "puppy", "kitten", "pet")
- Children's Content Safety (auto-detect "kid", "child", "balita", "anak")
- Medical/Health Claims (auto-detect "cure", "treat", "diagnose", "obat")
- Financial Claims (auto-detect "guaranteed return", "risk-free", "pasti profit")

These are placeholders for future expansion. v1.2.0 ships with pregnancy safety as the canonical example.

---

## Behavior

1. Parse brief + clarifying answers → build the 12 sections
2. Load `../references/storyboard-prompt-template.md` (the fill-in template)
3. Load `../references/banana-bread-worked-example.md` (worked example for reference)
4. Generate the filled-in prompt
5. Run QC checklist
6. Output: copy-paste-ready prompt + checklist pass/fail + next-step suggestion

---

## Output Format

```
## Storyboard Prompt (GPT Image 2, 16:9)

```
<prompt text — all 12 sections filled in>
```

## QC Checklist
- [✓] P02 master shot specified with full geography + screen directions
- [✓] Screen direction locked (window left, oven right, etc.)
- [✓] RHYTHM TRACK uses bracket vocabulary
- [✓] ESCALATION MAP uses L1-L5
- [✓] STORYBOARD PURITY (monochrome, no text inside panels)
- [✓] Panels numbered P01-P##
- [✓] IDENTITY CONSISTENCY (anti-redesign/age-shift/duplicate)
- [✓] EMOTIONAL ARC with 2-axis (Valence + Arousal preview)
- [✓] STYLE LOCKS (3 separate: style, effect, environment)
- [✓] SPATIAL CONTINUITY LOCK
- [✓] DIRECTOR STRIP (7 tracks, all populated)

## Cost & Time
- GPT Image 2: ~$0.07, ~30s
- Review/edit prompt before sending: ~2-5 min
- Total Step 1: ~5 min

## Suggested Next Step
If you want composition and visual style controlled by separate references, approve the normal storyboard first, then run `/s2s depth-map` before motion.

Otherwise run `/s2s character-ref` (if your video has a human) OR `/s2s product-ref` (if product-only) — then `/s2s motion` to wrap up.

Or run `/s2s pipeline` to do all 3 steps with checkpoints.
```

---

## Common Errors

| User Input | Error | Fix |
|------------|-------|-----|
| "Make a viral TikTok" | Too vague | Ask for: subject, activity, vibe, duration |
| "10 minutes long" | Out of scope | Split into 4-6 short clips (8-15s each) |
| "Make it cinematic" | Vague | Ask: lens style (anamorphic wide), color (teal/orange), motion (slow push-in vs handheld) |
| "Same as that viral banana bread video" | Reference unclear | Ask for the specific element they want (loop technique? cooking pace? character energy?) |

---

## Output Always Includes

1. **The filled-in prompt** (markdown code block, copy-paste ready)
2. **QC checklist** (all 11 items with [✓] or [✗])
3. **Cost + time estimate**
4. **Next-step suggestion** (which command to run next)

---

## Related

- `../references/storyboard-prompt-template.md` — the fill-in template
- `../references/banana-bread-worked-example.md` — fully filled example
- `pipeline.md` — runs all 3 steps with checkpoints
- `../SKILL.md` section "Quick Start" — single-line pipeline invocation
