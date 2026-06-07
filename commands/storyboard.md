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

## Behavior

1. Parse brief + clarifying answers → build the 12 sections
2. Load `references/storyboard-prompt-template.md` (the fill-in template)
3. Load `references/banana-bread-worked-example.md` (worked example for reference)
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
Run `/s2s character-ref` (if your video has a human) OR `/s2s product-ref` (if product-only) — then `/s2s motion` to wrap up.

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
