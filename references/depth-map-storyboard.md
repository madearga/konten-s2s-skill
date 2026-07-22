# Depth Workflow Router

There are **two distinct depth capabilities**. Never merge them.

---

## Capability A — `/s2s depth-map`

**Job:** convert one existing image into a clean physically accurate grayscale linear depth map.

```text
SOURCE IMAGE
  ↓ exact geometry-preserving conversion
CLEAN DEPTH MAP
```

Canonical input can be:

- one normal image
- one visual reference that will become IMAGE 2 for depth-storyboard generation
- one complete normal storyboard/contact sheet that must be converted without changing its grid

Canonical prompt selection:

- single image/reference → `depth-map-conversion.md`
- storyboard/contact sheet → `depth-storyboard-conversion.md`

This capability does **not** invent new shots or a story.

---

## Capability B — `/s2s depth-storyboard`

**Job:** generate a new coherent 3×3 depth-only storyboard with nine sequential cinematic shots.

```text
IMAGE 1 — VISUAL REFERENCE
IMAGE 2 — DEPTH REFERENCE
  ↓ full eight-phase system prompt
ONE 3×3 DEPTH-ONLY STORYBOARD
```

Canonical prompt lives in `depth-storyboard-system-prompt.md`.

This capability analyzes the references, infers one simple story event, plans nine specified shots, maintains continuity, designs cinematic depth, and renders exactly one clean 3×3 grid.

It is **not** an alias for `/s2s depth-map`.

---

## Two Valid End-to-End Workflows

### Workflow 1 — Direct Depth-Only Storyboard

```text
VISUAL REFERENCE
  ├─ stays IMAGE 1
  └─ /s2s depth-map → DEPTH REFERENCE (IMAGE 2)

IMAGE 1 + IMAGE 2
  ↓ /s2s depth-storyboard
3×3 DEPTH-ONLY STORYBOARD
  + tone/identity references as needed
  ↓ /s2s motion --bind
SEEDANCE 2.0
```

Use when you want the system prompt to invent a coherent nine-shot sequence from one scene.

### Workflow 2 — Revised Normal-Storyboard Conversion

```text
/s2s storyboard → APPROVED NORMAL STORYBOARD
  ↓ /s2s depth-map [whole sheet]
DEPTH VERSION OF THAT EXACT STORYBOARD
  + separate tone/identity references
  ↓ /s2s motion --bind
SEEDANCE 2.0
```

Use when the shot sequence already exists and must not be redesigned. Use the full prompt in `depth-storyboard-conversion.md`; the compact single-image prompt is not a substitute for this sheet-preservation profile.

---

## Routing Test

| User intent | Command |
|---|---|
| “Convert this image to depth” | `/s2s depth-map` |
| “Convert this normal storyboard sheet to depth” | `/s2s depth-map` |
| “Create nine depth-only cinematic shots from these visual + depth refs” | `/s2s depth-storyboard` |
| “I only have a visual reference but want a depth storyboard” | `/s2s depth-map`, then `/s2s depth-storyboard` |
| “I already approved a normal storyboard” | `/s2s depth-map`, then `/s2s motion --bind` |

---

## Seedance Role Binding

After either workflow:

```text
Use @[depth storyboard] for camera placement, framing, perspective, shot scale,
foreground/midground/background layering, silhouettes, occlusion, composition,
and spatial relationships only. Ignore color, lighting, material, texture, and
identity detail from this asset.

Use @[tone visual reference] for final palette, lighting, texture, materials,
atmosphere, mood, and visual language only. Do not copy its framing.

Use @[character sheet] for face, hair or hijab, clothing, proportions, and
signature identity details only. Do not copy its sheet layout or neutral pose.

Use @[product reference] for product geometry, proportions, material, color,
and branding only. Do not copy its studio background or sheet layout.
```

Conflict priority:

1. Character/product identity → identity sheet
2. Camera/composition/spatial layout → depth storyboard
3. Look/tone/material/lighting → tone reference
4. Motion/timing/audio → motion text

---

## Non-Negotiable Distinction

```text
/s2s depth-map
= TRANSFORM an existing image

/s2s depth-storyboard
= GENERATE a new nine-shot sequence using two references
```
