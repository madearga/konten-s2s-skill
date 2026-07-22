# Depth Map Storyboard — User Flow

Companion flow for `/s2s depth-map`. It shows what the user types, what the skill does, and what artifact is returned.

---

## Flow A — User Already Has a Normal Storyboard

**USER**

```text
/s2s depth-map /path/to/storyboard.png
Tone reference: /path/to/look.jpg
Character sheet: /path/to/character.png
```

**SKILL**

1. Verifies the normal storyboard exists.
2. Inspects canvas, grid, panel count, dividers, reading order, framing, and object placement.
3. Produces the canonical image-edit conversion prompt.
4. If an image-edit backend is available, converts and validates the output.
5. If not, states the backend limitation and returns a paste-ready prompt.
6. Produces strict Seedance attachment-role binding.

**USER RECEIVES**

- source layout contract
- depth-map conversion prompt
- real converted image path when generation actually ran
- pass/fail QC
- Seedance attachment-role block
- next command: `/s2s motion --bind`

---

## Flow B — User Has a Brief but No Storyboard

**USER**

```text
/s2s depth-map librarian opens a history book and enters an old classroom
```

**SKILL**

```text
Depth conversion needs a normal storyboard first.
Route: /s2s storyboard → approve image → /s2s depth-map
```

The skill does not generate a direct depth-only storyboard by default.

**USER RECEIVES**

- smallest required route
- no fabricated depth-map artifact

---

## Flow C — Active Backend Is Text-to-Image Only

**USER**

```text
/s2s depth-map storyboard.png
```

**SKILL**

```text
Active backend cannot accept a source image, so conversion was not executed.
Here is the paste-ready conversion prompt for an image-edit-capable surface.
```

**USER RECEIVES**

- honest blocker
- paste-ready prompt
- exact upload order
- QC checklist
- no claim that an output image was generated

---

## Flow D — Seedance Handoff

**USER**

```text
/s2s motion --bind
Depth: depth-storyboard.png
Look: visual-reference.jpg
Character: character-sheet.png
Duration: 10s
```

**SKILL**

Writes:

```text
Use @[depth storyboard] for composition/camera/spatial relationships only.
Use @[tone visual reference] for final look only; do not copy its framing.
Use @[character sheet] for identity only; do not copy its sheet pose/layout.
Motion timing and camera movement follow this text prompt.
```

**USER RECEIVES**

- Seedance-ready motion prompt
- ordered attachment list
- conflict-priority rules
- QC confirming one primary job per asset

---

## Flow E — Conversion Changed the Grid

**USER**

```text
The converted depth map lost panel 7 and changed the close-up.
```

**SKILL**

1. Marks layout fidelity as failed.
2. Does not proceed to Seedance.
3. Retakes the conversion with one changed variable: stronger exact-layout contract.
4. Rechecks panel count, composition, and dividers.

**USER RECEIVES**

- diagnosis: transformation drift
- one-variable repair prompt
- clear stop condition: every source panel preserved

---

## UX Rules

- Ask only for the missing normal storyboard path when blocked.
- Never ask the user to choose depth direction; canonical is white-near, black-far.
- Never silently fall back to direct depth-storyboard generation.
- Never claim image conversion when the backend rejected source-image input.
- Never let the tone reference control composition.
- Never let the depth map carry face, clothing texture, color, or material identity.
