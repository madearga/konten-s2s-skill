# Seedance Asset Binding Layer

Optional **attachment-role binding** for Step 3. Use when the user has multiple images, videos, or audio files and each one serves a different job.

This is additive. If the run only has `@[storyboard ref]` + one reference sheet, the standard v1.2.0 workflow is enough.

---

## Why Bind Assets Explicitly?

Without role binding, Seedance may blur:
- **identity** with **camera style**
- **action choreography** with **visual texture**
- **BGM/rhythm** with **dialogue or SFX**
- **first frame** intent with **overall environment**

Role binding turns each attachment into a single-purpose signal.

---

## Canonical Attachment Roles

| Role | Purpose | Typical source |
|------|---------|----------------|
| `@[storyboard ref]` | shot order, staging, continuity | Step 1 storyboard image |
| `@[character ref]` | face/body/clothing identity lock | Step 2a character sheet |
| `@[product ref]` | product continuity lock | Step 2b product sheet |
| `@[first frame ref]` | exact opening image anchor | user still / rendered frame |
| `@[last frame ref]` | exact landing frame anchor | user still / rendered frame |
| `@[wardrobe ref]` | outfit only | garment image |
| `@[environment ref]` | set dressing / location only | location photo |
| `@[camera ref video]` | shot behavior only | reference clip |
| `@[action ref video]` | choreography / gesture timing only | reference clip |
| `@[fx ref video]` | transition / VFX grammar only | reference clip |
| `@[rhythm ref video]` | cut cadence / pacing only | reference clip |
| `@[bgm ref audio]` | music vibe / BPM only | audio file |
| `@[voice ref audio]` | tone / energy of spoken delivery | audio file |
| `@[sfx ref audio]` | sound texture only | audio file |
| `@[typography ref]` | title-card look only | graphic still |

---

## Binding Rules

1. **One asset, one primary job.**
2. If one file influences two things, state the split explicitly.
3. Always say what to **copy** and what to **ignore**.
4. For video refs, specify whether you want **camera**, **action**, **FX**, or **rhythm** — never just “reference this video”.

---

## Copy / Ignore Syntax

Use short role statements before the 5-part spine:

```text
Use @[storyboard ref] for shot order, framing intent, screen direction, and emotional escalation.
Use @[character ref] for face, hair, body type, and outfit continuity. Ignore its background.
Use @[product ref] for shape, color, materials, and label placement. Ignore its lighting setup.
Use @[camera ref video] for lens behavior, handheld energy, and push/pull timing only. Do not copy subject or environment.
Use @[rhythm ref video] for beat cadence and cut density only. Do not copy camera angle or art direction.
Use @[bgm ref audio] for tempo and mood only. Do not synthesize lyrics unless explicitly requested.
```

---

## Role Bundles by Scenario

### A. Character + Product UGC

```text
@[storyboard ref]
@[character ref]
@[product ref]
@[environment ref] (optional)
@[rhythm ref video] (optional)
```

### B. Product Beauty Ad

```text
@[storyboard ref]
@[product ref]
@[camera ref video] (optional)
@[fx ref video] (optional)
@[bgm ref audio] (optional)
```

### C. Dialogue / Talk-to-Camera

```text
@[storyboard ref]
@[character ref]
@[voice ref audio] (optional)
@[rhythm ref video] (optional)
```

### D. Existing Video Extend/Edit/Fuse

```text
@[storyboard ref]           # if you made a planning board
@[first frame ref]          # lock the entry state
@[last frame ref]           # lock the destination state
@[camera ref video]         # optional
@[action ref video]         # optional
```

---

## Good vs Bad Binding

### Bad

```text
Reference @[video ref] for style.
```

Too vague.

### Good

```text
Use @[camera ref video] for shoulder-height handheld drift, 35mm-equivalent framing, and micro push-ins only.
Do not copy its actor, wardrobe, or color grade.
```

---

## Integration Point in `/s2s motion`

Place the binding block **after** the top-level storyboard/reference lines and **before** `[SUBJECT]`.

Recommended order:
1. Top-level authoritative refs
2. Asset-role binding lines
3. 5-part spine
4. Emotional guidance
5. Audio
6. Panel beats
7. Negative prompts

---

## Common Mistakes

1. Giving one video ref four jobs at once.
2. Using a rhythm ref without saying “rhythm only”.
3. Forgetting to tell the model to ignore background/lighting from identity sheets.
4. Treating first-frame refs as full environment refs.
5. Uploading extra assets that never get named in the prompt.
