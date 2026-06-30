# /s2s hook — Hook Brainstorming for Short-Form Vertical Video

Generates 3-5 hook variants for the first 3 seconds of a 9:16 vertical narrative short. Evaluates each against the 6-criterion scoring matrix. Returns ranked hooks + recommended frozen-first-3s storyboard image prompt.

**Capability:** Hook
**Trigger:** `/s2s hook` or auto-detect: "hook engaging", "alternatif hook", "hook paling ngena", "hook out of the box", "visual hook", "hook brainstorming", "social issue video", "social-issue hook", "PSA hook", "competition hook", "data-driven hook", "Indonesian statistics hook", "hook viral video"

---

## When to Use

- User wants a strong opening for vertical short-form (9:16, < 30s)
- User has a brief but no opening hook yet
- User is targeting social-impact / PSA / competition audience
- First 3 seconds retention is critical
- User explicitly asks for "hook ideas" or "hook variants"

---

## Inputs to Gather

Ask until **3 of 4** fields are filled:

| Field             | Example                                                              | Required? |
|-------------------|----------------------------------------------------------------------|-----------|
| Core message      | "Anti cyberbullying untuk remaja"                                   | Required  |
| Target audience   | "Indonesian teens 13-19, mobile-first, TikTok native"                | Required  |
| Tone constraint   | "Contemplative, no music, foley only" / "Energetic, smash cuts"     | Optional  |
| Forbidden topics  | "Don't show face of victim, no graphic method"                       | Optional  |

If user gives full brief, fill 3-4 directly. If vague, ask minimum.

---

## Workflow

### Step 1: Load Hook Reference

Read `references/hook-brainstorming-social-issue.md` (canonical 5 hook tiers + 6 evaluation criteria + worked example from "multi-clip fate-grid pattern" social-issue session).

### Step 2: Generate 5 Hook Variants

Generate across the 5 tiers (one variant per tier, or 2-3 variants per tier for richer sweep):

| Tier | Hook Type                  | Description                                              |
|------|----------------------------|----------------------------------------------------------|
| 1    | **Pattern interrupt**      | Unexpected visual that breaks scroll                    |
| 2    | **Cold open + question**   | Drop into action, viewer must catch up                   |
| 3    | **Statistic + visual**     | Real number + surprising frame                           |
| 4    | **In-medias-res moment**   | Start at emotional peak, flashback to context            |
| 5    | **Relatable micro-detail** | Mundane moment viewer recognizes, then twist             |

### Step 3: Score Each Variant Against 6 Criteria

Per `references/hook-brainstorming-social-issue.md` § "6 Evaluation Criteria":

| Criterion       | Question                                                    | Weight |
|-----------------|-------------------------------------------------------------|--------|
| Clarity in 3s   | Can viewer parse the WHO/WHAT in 3 seconds?                 | High   |
| Visual AI-ability | Can Seedance/Veo/Kling generate this visual?              | High   |
| Relevance       | Does it connect to the core message?                       | High   |
| Emotional hit   | Does it trigger an immediate emotion (curiosity, dread, empathy)? | High |
| Uniqueness      | Is this a different angle from typical PSA / TikTok scroll? | Medium |
| Continuity      | Does it set up the rest of the clip without giving it away?  | Medium |

Score each 1-5, weight by importance. Total possible: 25.

### Step 4: Return Ranked Hooks + Storyboard Prompt

Output:

```markdown
# /s2s hook — Hook Variant Report

## Brief
[core message + audience + constraints]

## Hook Variants (Ranked)

### #1 — [Hook name] (Score: X/25)
**Tier:** [1-5]
**Visual:** [3-second visual description]
**Voice-over (if any):** [first line]
**Why it works:** [3-bullet justification]

### #2 — [Hook name] (Score: X/25)
[same structure]

### #3, #4, #5...

## Recommended Frozen-First-3s Storyboard Prompt
```
[12-section storyboard prompt template filled with the winning hook's first 3 seconds]
```

## Fallback
If #1 doesn't perform in test, fall back to #2.

## Continuity Check
Does this hook set up the rest of the clip without spoiling the resolution?
[Yes / No / Needs adjustment]
```

---

## Special Cases

### Sensitive Content (Cyberbullying, Self-Harm, Suicide)

Apply the **6-point Sensitive Content Safety Guardrails** (SKILL.md main file):
- Hand/limbs only, no face
- No method shown
- No graphic violence
- Show environmental impact (clock stopped, phone glowing, etc.)
- Setting intact
- Help line CTA in end card

### Indonesian Statistics Hook

When user wants "data-driven hook" or "Indonesian statistics hook":
- Use BPS / Kominfo / Kemenkes verified numbers
- Format: "1 dari X [kelompok] mengalami [masalah]" or "X% [populasi] [aksi]"
- Pair with visual iconography (NOT text in frame per pitfall #6)

### Competition Submission (competition, etc.)


---

## Output Format Example

```markdown
# /s2s hook — Hook Variant Report

## Brief
Anti-cyberbullying untuk remaja Indonesia, 13-19 tahun.
Tone contemplative, no music, foley only. Don't show victim's face.

## Hook Variants (Ranked)

### #1 — Phone Glow on Sheets (Score: 23/25)
**Tier:** 5 — Relatable micro-detail
**Visual:** 0-3s: Locked ECU of phone screen glowing on rumpled bed sheets, hand enters frame from screen-right, picks up phone, screen light spills across pillow, cut to black at 3s.
**Voice-over:** "Pesan terakhirnya masuk jam 3 pagi."
**Why it works:**
- Clarity: viewer parses "phone in bed at night" instantly
- AI-ability: simple props, well-tested Seedance pattern
- Relevance: phone = cyberbullying channel
- Emotional hit: dread + intimacy
- Uniqueness: mundane moment with sinister undertone
- Continuity: sets up "what message?" without spoiling

### #2 — Notification Counter (Score: 21/25)
[similar]

### #3 — Empty Chair at Lunch (Score: 20/25)
[similar]

### #4 — Mirrored Screens (Score: 19/25)
[similar]

### #5 — Hand Under Blanket (Score: 18/25)
[similar]

## Recommended Frozen-First-3s Storyboard Prompt
[12-section storyboard template filled with the #1 hook]

## Fallback
Use #2 if #1 doesn't perform.

## Continuity Check
Does #1 hook set up rest of clip without spoiling? **Yes** — viewer wonders what the message was, but doesn't know the resolution.
```

---

## Cross-Reference

- `references/hook-brainstorming-social-issue.md` — full hook reference (5 tiers, 6 criteria, worked example)
- `references/storyboard-style-monochrome-4x3.md` — visual style anchor if monochrome project
- `references/seedance-no-character-ref-pov-workflow.md` — POV / hands-only if face must not be shown
- SKILL.md main file: "A/B Hook Variant Pattern" + "Sensitive Content Safety Guardrails"

---

## Related Commands

- After hook locked, run `/s2s storyboard` to generate full 12-panel storyboard image
- For 3 hook variants as 3 frozen-first-3s storyboard images, run `/s2s cinematic-variations` with `mode=hook-sweep`
- After storyboard image generated, run `/s2s motion` for the motion prompt
