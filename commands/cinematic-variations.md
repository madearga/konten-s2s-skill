# /s2s cinematic-variations — Pre-Visualization Composition Sweep

Generates **10 distinct cinematic image prompts** exploring the same subject through 10 different compositions. Use this as a **pre-visualization step before `/s2s storyboard`** to lock in the most striking visual language for your key moments.

---

## Trigger

- Manual: `/s2s cinematic-variations <subject>` or `/s2s cinematic-variations <subject> --pick=N`
- Auto-detect: "cinematic variations", "10 compositions", "visual exploration", "pre-visualization", "explore compositions", "key frame options"

If user just wants a storyboard, redirect to `/s2s storyboard`. This command is **optional upstream** of storyboard — it generates 10 single-image prompts, not a panel sequence.

---

## Inputs to Gather (0-1 Clarifying Question)

| Field | Example | Required? |
|-------|---------|-----------|
| Subject | "Indonesian girl holding finished banana bread" | Required |
| Mood/era | "warm 80s kitchen" / "moody 4am" / "neon-soaked Tokyo" | Recommended |
| Aspect ratio | 16:9 / 9:16 / 1:1 / 3:4 | Default: 16:9 |
| Texture preference | "grain + haze" / "clean + sharp" | Default: grain + haze |

If user gives just a subject, defaults fill in. If vague, ask for mood/era.

**Q-template (only if mood/era missing):**

```
Q: What's the mood/era?
    A) Warm + nostalgic (80s kitchen, golden hour)
    B) Moody + cinematic (4am, rain, single light source)
    C) Vibrant + energetic (neon, saturated, fast-cut energy)
    D) Minimal + clean (white space, single subject, focus on object)
    E) Describe
```

---

## Behavior

1. Parse subject + mood/era
2. Load `references/cinematic-composition-vocabulary.md`
3. Pick **10 of 19 composition styles** for the sweep (rotate through different categories to maximize visual variety):
   - 2 wide/establishing (environmental scale, deep vanishing point)
   - 2 close/intimate (handheld close, foreground obstruction)
   - 2 high/low angle (extreme low angle, high angle)
   - 2 stylistic (silhouette, reflection)
   - 2 architectural/frame (frame-in-frame, layered FG/MG/BG)
4. For each composition, generate one prompt with:
   - **Title** (short, evocative, 2-4 words)
   - **Composition concept** (1-line camera/position description)
   - **Full image prompt** (one clean paragraph: subject + composition + lens + base style + texture + mood + light)
   - **Default negatives** appended: `no clean digital sharpness, no CGI look, no poster composition, no centered portrait, no black bars`
5. Output: 10 numbered copy-paste prompts

---

## Output Format

```
## Cinematic Composition Sweep — [subject]

**Mood/era:** [mood/era]
**Aspect ratio:** 16:9
**Base style:** cinematic realism, film stock grain, film still
**Texture pack:** [2 selected textures]

---

### 1. [Title 1]
**Composition: [brief camera/composition idea, e.g., "ground-level low angle, subject towering"]**

Prompt:
[full cinematic prompt, 1 clean paragraph, ends with: no clean digital sharpness, no CGI look, no poster composition, no centered portrait, no black bars]

---

### 2. [Title 2]
**Composition: [brief idea]**

Prompt:
[full cinematic prompt, ...]

---

[... continue until 10]
```

---

## --pick=N Mode

If user adds `--pick=N` (e.g., `--pick=3`), output additionally includes:

```
## Top 3 Recommended for [subject]

Based on the sweep, these 3 compositions have highest impact for [mood/era]:

1. **#1 [Title]** — use as P01 (hook shot)
2. **#6 [Title]** — use as P02 (establishing wide)
3. **#9 [Title]** — use as P## (climax reveal)

Run `/s2s storyboard` to build the full panel sequence, using these 3 as anchor panels.
```

---

## Common Use Cases

| Scenario | When to run |
|----------|-------------|
| Don't know what composition to start with | Run cinematic-variations FIRST → pick the most striking → use as P01 |
| Want to compare 10 frame options before committing | Run cinematic-variations → user reviews images → pick winner |
| Build a storyboard around a key moment | Run cinematic-variations on the key moment → pick top 3 → run /s2s storyboard with those as anchor panels |
| Test if a subject has visual potential | Quick 10-prompt sweep to see if the subject produces striking images |
| Explore different mood/eras for same subject | Run twice with different mood → compare |

---

## Cost & Time

- 10 GPT Image 2 generations: 10 × $0.07 = **$0.70 total**
- Per-image time: ~30s
- Total wall time: ~5-10 min (mostly waiting on generations)
- Review time: ~5-10 min (pick winners)

This is **optional** — for tight budgets, skip and go directly to `/s2s storyboard` (1 image at $0.07).

---

## Common Errors

| User Input | Error | Fix |
|------------|-------|-----|
| "Make all 10 the same" | Defeats the purpose of the sweep | Force: 10 must be different compositions |
| "Just one variation" | Use `/s2s storyboard` instead | Redirect |
| Vague subject "make a video" | Too abstract | Force: "Indonesian girl in kitchen making X" |
| "Photorealistic" | Conflicts with base style "cinematic realism" | Default is cinematic realism; user override goes in mood/era field |

---

## Pitfalls

1. **All 10 look the same** — GPT Image 2 may default to similar compositions if the subject is dominant. Force the 10 different styles explicitly in each prompt.
2. **Mid-action missing** — "captured moment from a real film scene" requires subject mid-action. Add verb: "Maya turning toward camera with smile" not "Maya standing in kitchen".
3. **Static posing** — even with composition variety, if subject is static, image is static. Always specify mid-action verb.
4. **No imperfection** — clean digital sharpness = AI look. Add grain + texture always.
5. **Generic adjectives** — "epic", "beautiful", "cool" without visual support. Force specific visual details: "soft daylight bloom, steam wisp, golden hour rim light".

---

## Related

- `../references/cinematic-composition-vocabulary.md` — 19 styles + texture pack
- `../commands/storyboard.md` — Step 1 (use cinematic-variations results as anchor panels)
- `../commands/character-ref.md` — Step 2a (use cinematic-variations to test 3-angle layouts)
- `../commands/product-ref.md` — Step 2b (use cinematic-variations to test product hero angles)
- `../SKILL.md` — entry point + decision tree
