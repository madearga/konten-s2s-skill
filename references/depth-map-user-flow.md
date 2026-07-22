# Depth Capabilities — User Flow

---

## Flow A — Convert One Image

**USER**

```text
/s2s depth-map /path/to/image.png
```

**SKILL**

1. Verifies the image.
2. Loads the exact physical linear-depth conversion prompt.
3. Converts only when image-edit input is supported.
4. Verifies geometry, silhouettes, boundaries, depth direction, and appearance removal.

**OUTPUT:** one clean depth map or an honest paste-ready prompt if blocked.

---

## Flow B — Build Direct 3×3 Depth Storyboard

**USER**

```text
/s2s depth-storyboard
IMAGE 1: /path/to/visual-reference.png
IMAGE 2: /path/to/depth-reference.png
```

**SKILL**

1. Loads the complete eight-phase system prompt.
2. Uses IMAGE 1 for scene/identity/content.
3. Uses IMAGE 2 for depth convention/layering/edge behavior.
4. Generates exactly nine sequential shots in one 3×3 depth-only grid.
5. Runs the 14-point QC gate.

**OUTPUT:** one coherent 3×3 depth-map storyboard.

---

## Flow C — Only Visual Reference Exists

**USER**

```text
I have visual-reference.png but no depth reference.
```

**SKILL ROUTE**

```text
/s2s depth-map visual-reference.png
  ↓ generated depth-reference.png
/s2s depth-storyboard visual-reference.png depth-reference.png
```

The first output becomes IMAGE 2. The original remains IMAGE 1.

---

## Flow D — Convert an Approved Normal Storyboard

**USER**

```text
/s2s depth-map approved-storyboard.png
```

**SKILL**

Treats the full sheet as one source image and converts it exactly. It does not infer a different nine-shot sequence.

Loads `depth-storyboard-conversion.md`, including exact canvas/grid/divider preservation and panel-specific depth rules.

**OUTPUT:** depth version of the approved storyboard with identical canvas, grid, panel geometry, silhouettes, and occlusions.

---

## Flow E — Seedance Handoff

**USER**

```text
/s2s motion --bind
Depth: depth-storyboard.png
Look: visual-reference.jpg
Character: character-sheet.png
Duration: 10s
```

**ROLE BINDING**

```text
Depth storyboard = composition/camera/spatial layout only.
Tone reference = color/lighting/material/mood only.
Character sheet = identity only.
Motion text = action/timing/audio only.
```

---

## Flow F — Backend Is Text-to-Image Only

The skill returns:

- exact prompt
- exact attachment order
- target-backend requirement
- QC checklist

It does not claim a depth map or storyboard was generated.

---

## UX Rules

- Never use `/s2s depth-map` to invent nine new shots.
- Never use `/s2s depth-storyboard` for a plain one-image conversion.
- Never treat the two command names as aliases.
- If depth reference is missing, generate it from IMAGE 1 with `/s2s depth-map`.
- Keep white-near and black-far across both capabilities.
- Preserve the complete eight-phase system prompt when exact behavior is requested.
