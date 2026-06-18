# /s2s interview — Creative Brief Intake for Vague Ideas

Activated when user arrives with a vague idea — no full brief, no locked character, no script. Bridges to `/s2s storyboard`, `/s2s motion`, `/s2s hook`, or other capabilities after intake.

**Capability:** Interview (creative brief intake)
**Trigger:** `/s2s interview` or auto-detect phrases like "bikin video AI", "bantuin bikin sesuatu", "bikinin video dong", "I want something", "you decide", "kamu yang tentukan", "bebas", "terserah kamu", or any incomplete brief.

---

## When to Use

- User says something vague without topic / character / duration / energy
- User gives topic + audience but no specifics
- User explicitly asks for help brainstorming direction
- User says "kamu pilih yang terbaik" (delegates decisions)

## When NOT to Use

- User provides complete brief with concept + character + location + duration + energy
- User has existing script or storyboard — use `/s2s storyboard` or `/s2s motion` directly
- User wants to extend/edit existing video — use `/s2s compose-pattern` or `/s2s analyze`

---

## Workflow

### Step 1: Detect Vague Input

Identify which mode fits the user's message:

| Mode | Trigger                                            | Approach                          |
|------|----------------------------------------------------|------------------------------------|
| 1    | Pure vague ("bikin video AI dong")                 | Question-First — ask 3-4 Qs         |
| 2    | Topic-given ("PSA anti judi online")              | Brief-First — auto-generate + confirm |
| 3    | Topic + audience ("bikinin buat tugas sekolah")   | Hybrid — Indonesian defaults + 1-2 overrides |

**Rule:** If user provides ≥ 3 of 5 core fields, switch to Brief-First (skip intake). If < 3, use Question-First.

### Step 2: Load Reference

Read `references/creative-brief-intake.md` for full question bank, intake modes, brief template.

### Step 3: Conduct Intake

**Mode 1 (Question-First):**
- Ask max 4 multi-choice questions per batch
- Wait for answers before generating brief
- Don't ask if user already provided the field

**Mode 2 (Brief-First):**
- Auto-generate creative brief from common patterns
- Use Indonesian PSA defaults for social-issue topics
- Surface brief for confirmation: "OK / adjust [field]?"

**Mode 3 (Hybrid):**
- Generate brief with Indonesian defaults
- Ask only 1-2 high-value overrides (e.g., "POV only OK?" + "Duration 105s OK?")

### Step 4: Generate Creative Brief

Output structured brief using the template from `references/creative-brief-intake.md`:

```markdown
# Creative Brief — [Project Name]

## Core
- **Concept:** ...
- **Character:** ...
- **Location:** ...
- **Duration:** ...
- **Energy:** ...

## Extended
- **Audience:** ...
- **Format:** ...
- **Tone:** ...
- **Forbidden:** ...
- **Reference:** ...
- **Budget:** ...
- **Deadline:** ...

## Indonesian Context Anchors
- ...

## Style Lock (if specified)
- ...

## Safety Guardrails (if sensitive content)
- ...

## Suggested Next Capability
- [ ] /s2s hook
- [ ] /s2s storyboard
- [ ] /s2s character-ref
- [ ] /s2s product-ref
- [ ] /s2s motion
- [ ] /s2s cinematic-variations
```

### Step 5: Confirm + Route

Ask user: "Brief ini OK? Atau ada yang mau di-adjust?"

On confirmation, suggest next capability:
- Opening not locked → `/s2s hook`
- Storyboard image needed → `/s2s storyboard`
- Human character present → `/s2s character-ref`
- Product present → `/s2s product-ref`
- Final brief + have refs → `/s2s motion`
- Want 10 composition sweep → `/s2s cinematic-variations`

---

## Inputs to Gather

The intake itself IS the input gathering. No additional fields needed.

**Initial user message** (just process it).

---

## Output Format

```markdown
# /s2s interview — Creative Brief Report

## Intake Mode
[1: Question-First | 2: Brief-First | 3: Hybrid]

## User Original Input
> [verbatim quote]

## Questions Asked (if Mode 1)
1. [question] → [answer]
2. [question] → [answer]
...

## Generated Brief

[Creative Brief template filled]

## Confirmation Status
- [ ] User confirmed brief
- [ ] User requested adjustment: [which fields]

## Next Capability Suggested
`/s2s [hook|storyboard|character-ref|product-ref|motion|cinematic-variations]`

## Resume Instructions
After user confirms brief, the brief becomes input for the next capability. To re-run intake:
```
/s2s interview --regenerate
```
```

---

## Special Cases

### Sensitive Content (PSA, Cyberbullying, Self-Harm, Gambling)

Apply 6-point Sensitive Content Safety Guardrails (SKILL.md main file) AT INTAKE STAGE, not later. Surface help-line CTA in suggested next capability output.

### Indonesian PSA / Social Issue Defaults

For topics like "anti judi online", "cyberbullying", "mental health", "road safety" — auto-fill:
- **Character:** POV / hands only (no face)
- **Location:** Indonesian setting (kos-kosan, warung, sekolah, angkot)
- **Style:** OAK macro cinematic + natural Indonesian lighting
- **Safety:** 6-point guardrails applied
- **Help line:** 119 ext 8 (Into The Light) / @janganbunuhdiri / Yayasan Pulih

### Competition Submission (Kreafest etc.)

Auto-fill:
- **Duration:** 120s (8 clip × 15s) — Kreafest standard
- **Format:** 9:16 vertical
- **Multi-clip:** yes
- **Hook:** required — suggest `/s2s hook` as next step

### Task / School Presentation

Auto-fill:
- **Duration:** 60-90s
- **Format:** 16:9 landscape (presentation friendly)
- **Tone:** informative + memorable
- **Music:** allowed (school presentation)
- **Style:** cinematic OR explainer (user choice)

### UGC / Product

Auto-fill:
- **Character:** 1 main person
- **Location:** real-life setting (kitchen, café, street)
- **Tone:** authentic, calm
- **Pacing:** soft, settle beat
- Suggest `/s2s character-ref` + `/s2s product-ref` as next steps

---

## Worked Examples

### Example 1: Pure Vague

**User:** "bikin video AI dong"

**Mode:** 1 — Question-First

**Questions:**
```
Q1: Mau bikin video tentang apa?
    A) PSA / social issue (cyberbullying, judi online, mental health, dll)
    B) Produk / UGC
    C) Kompetisi / lomba
    D) Tugas sekolah / presentasi
    E) Cerita / naratif

Q2: Untuk platform mana?
    A) TikTok / Reels (9:16 vertikal, < 60s)
    B) YouTube (16:9 landscape)
    C) Presentasi offline
```

(after user answers)

### Example 2: Topic-First

**User:** "bikinin PSA anti cyberbullying buat remaja SMA"

**Mode:** 3 — Hybrid

**Auto-brief:**
```markdown
# Creative Brief — Anti Cyberbullying PSA

## Core
- **Concept:** POV bystander witnessing bullying, choosing to act (LAPORKAN/TEMANI/DENGARKAN)
- **Character:** POV / hands only (no face shown — applies SAKSI DI LAYAR v2 style)
- **Location:** Indonesian SMA — koridor, kelas, kantin
- **Duration:** 120s (8 clip × 15s)
- **Energy:** Brutal hook → intimate slow → decisive slow → restorative

## Indonesian Context Anchors
- Seragam putih abu-abu
- Tas ransel + buku tulis
- Bahasa sehari-hari: "Ayo pulang bareng"
- Kantin sekolah + warung tenda

## Safety Guardrails
- 6-point OAK guardrails applied (no face, no method, no blood)
- Help line: 119 ext 8 (Into The Light) / @janganbunuhdiri / Yayasan Pulih
- End card: LAPORKAN / TEMANI / DENGARKAN

## Style Lock
- OAK macro cinematic
- Vertical 9:16
- Photorealistic, foley only, no music

## Suggested Next Capability
- [x] `/s2s hook` — generate hook variants
- [ ] `/s2s storyboard` — after hook locked
- [ ] `/s2s motion` — after storyboard generated
```

**Override questions:**
```
Q1: POV only (no face shown) OK? Atau mau ada karakter recognizable?
Q2: 120s (8 clip) OK? Atau lebih pendek (60s = 4 clip)?
```

(after user answers, brief finalized)

---

## Cross-Reference

- `references/creative-brief-intake.md` — full intake template + question bank
- `references/hook-brainstorming-social-issue.md` — Indonesian PSA hook patterns
- `references/cinematic-composition-vocabulary.md` — style options for energy/format
- `templates/oak-no-character-pov-workflow.md` — Indonesian PSA defaults (parent skill)
- SKILL.md main file — "Routing Questions" + "Capability Router" + "Sensitive Content Safety Guardrails"

---

## Related Commands

- `/s2s hook` — generate 5 hook variants after brief confirmed
- `/s2s storyboard` — 12-section storyboard prompt after concept + character locked
- `/s2s cinematic-variations` — 10 composition sweep for key moment
- `/s2s character-ref` — generate character ref image
- `/s2s product-ref` — generate product ref image
- `/s2s motion` — 5-part spine motion prompt
- `/s2s bundle` — assemble all artifacts at end of project

---

## When Interview Is Enough

After interview, if user says "cukup segitu dulu, thanks" or "OK saya pikir dulu", stop. Don't auto-progress to next capability. Let user decide when to invoke the next command.