# Seedance Motion Micro-Intake

Use this reference inside `/s2s motion` and `/s2s motion --bind` after the user already has storyboard/reference assets. It is not a separate command and does not replace `/s2s interview` for vague projects.

---

## Goal

Resolve only the runtime information needed to compile a Seedance motion prompt:

1. **Duration**
2. **Action/story progression**
3. **Audio strategy**

Do not restart a full creative interview when visual references or an approved storyboard already establish the concept.

---

## Required vs Defaultable

| Field | Gate | Source priority | Default |
|---|---|---|---|
| Duration | Must be locked before compilation | explicit user value → approved brief → platform limit | none; ask once |
| Action/story progression | Must be locked before compilation | director strip/panel beats → script/brief → normal storyboard plan → depth-storyboard generation plan → visual analysis | none; ask once if textual progression is unavailable or ambiguous |
| Audio strategy | May be defaulted | explicit user request → brief → scene-derived foley | natural synchronized diegetic sound and environmental ambience only; no music |
| Energy/rhythm | May be inferred | explicit user request → action verbs → duration/beat density | mid-rhythm |
| Composition/camera | Asset-bound | depth storyboard → normal storyboard → explicit shot plan | never invent over an attached depth storyboard |
| Look/style | Asset-bound | tone/visual-style reference | never copy style from a depth map |
| Character identity | Conditional asset-bound | character sheet → approved character description | required when a human/character must remain identifiable |

---

## Reference Preconditions

When depth workflow is used, verify:

- `@[depth storyboard]` exists
- `@[tone visual reference]` exists
- `@[character sheet]` exists if an identifiable human/character appears
- attachment roles are unambiguous

Missing files are prerequisite failures, not interview questions about creative direction. Ask only for the missing path/URL.

---

## Intake Algorithm

### 1. Extract before asking

Scan the current request, approved brief, prior S2S artifacts, and attached asset descriptions. Fill every field already stated or safely derivable.

Never ask for:

- composition already encoded by the depth storyboard
- style already encoded by the tone reference
- identity already encoded by the character sheet
- audio when the default diegetic strategy is acceptable
- information already supplied earlier in the same session

### 2. Build the Intake Card

```markdown
## Motion Intake Card

| Field | Value | Source | Confidence |
|---|---|---|---|
| Duration | ... | explicit / brief / missing | locked / ask |
| Action progression | ... | director strip / brief / storyboard plan / visual inference / missing | locked / confirm / ask |
| Audio | ... | explicit / inferred default | locked / defaulted |
| Energy | ... | explicit / inferred | locked / defaulted |
| Depth storyboard | ... | attachment | verified / missing |
| Tone reference | ... | attachment | verified / missing |
| Character sheet | ... | attachment / not applicable | verified / missing / N/A |
```

### 3. Ask minimum questions

Ask at most two questions in one batch.

**Question A — duration, only when missing:**

```text
Durasi final?
A) 4 detik — 3–4 visual beats
B) 8 detik — 4–6 visual beats
C) 12 detik — cinematic sequence
D) 15 detik — full nine-panel progression
```

**Question B — action, only when no reliable textual progression exists:**

```text
Aksi utama dari awal sampai akhir apa? Satu kalimat cukup.
```

If the storyboard suggests an action but confidence is not high, offer the inferred sentence for confirmation instead of asking an open-ended interview:

```text
Saya baca urutannya sebagai: “[inferred progression].” Pakai ini atau koreksi?
```

Do not ask about audio unless the user requests music, dialogue, voiceover, or a specific sound design.

### 4. Apply defaults

If audio was not specified:

```text
Natural synchronized diegetic sound and environmental ambience only. No music.
```

If energy was not specified, infer it:

| Evidence | Energy |
|---|---|
| quiet observation, slow reveal, reflective ending | slow cinematic |
| approach, interaction, consequence, resolution | mid-rhythm |
| chase, impact, rapid montage, action burst | high-rhythm |

### 5. Gate compilation

Compile the final motion prompt only when:

- duration is locked
- action progression is locked
- required references are present
- every attachment has one explicit role

Audio and energy may be defaulted and must be labeled as assumptions in the Intake Card.

---

## Nine-Panel Timing Rule

A 3×3 storyboard does not require nine literal hard cuts. Convert panels into visual beats appropriate to duration:

| Duration | Recommended treatment |
|---|---|
| 4s | Select 3–4 essential beats; do not claim all nine are legible |
| 8s | Merge related panels into 4–6 beats |
| 12s | Use 6–8 beats with motivated transitions |
| 15s | Full nine-panel progression is allowed |
| >15s | Split into multiple clips or use extend/fuse mode |

Preserve the narrative order even when beats are merged.

---

## Role-Binding Contract

```text
Depth storyboard → camera placement, framing, perspective, shot scale,
foreground/midground/background layering, silhouettes, occlusion,
composition, and spatial relationships only.

Tone visual reference → final palette, lighting, texture, materials,
atmosphere, mood, and visual language only.

Character sheet → face, hair or hijab, clothing, proportions, and
signature identity details only.

Motion text → action progression, timing, transitions, physics, and audio.
```

Conflict priority:

1. Character/product identity → identity sheet
2. Camera/composition/spatial layout → depth storyboard
3. Look/tone/material/lighting → tone reference
4. Motion/timing/audio → motion text

---

## Output Contract

After the micro-intake gate passes, output:

1. Motion Intake Card
2. Copy-paste-ready Seedance motion prompt
3. QC checklist
4. Attachment list with explicit roles
5. Assumptions/defaults used

Do not output a second generic creative brief.

---

## When to Escalate to `/s2s interview`

Escalate only when the project itself is still vague: no clear concept, subject, location, or intended event.

Do not escalate when the user already has visual reference + storyboard/depth storyboard + character sheet. That state requires micro-intake, not full intake.
