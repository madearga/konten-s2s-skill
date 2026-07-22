# Depth Map Storyboard — Composition/Style Decoupling

## Purpose

A normal storyboard carries two signal families at once:

1. **Spatial signal:** camera placement, framing, perspective, subject scale, foreground/midground/background, silhouettes, occlusion, spatial relationships.
2. **Appearance signal:** color, lighting, texture, materials, atmosphere, visual style.

Video models may treat the normal storyboard as the target appearance and reproduce its rough style. A depth map storyboard strips the appearance signal and keeps the spatial signal. A separate tone/visual reference then controls the final look.

This reference implements the **revised** workflow validated from two public July 2026 tutorials: create the normal storyboard first, then convert the complete sheet. The older direct depth-only storyboard generation method is not the default.

---

## Canonical Signal Split

| Asset | Primary job | Must not control |
|---|---|---|
| Depth map storyboard | Camera placement, framing, perspective, composition, subject scale, depth layers, silhouettes, occlusion, spatial relationships | Color, lighting, texture, material, mood, identity detail |
| Tone + visual-style reference | Color palette, lighting, texture, material, atmosphere, mood, design language | Shot sequence, framing, camera position, panel layout |
| Character sheet | Face, hairstyle/hijab, clothing, proportions, signature details | Camera path, storyboard layout, neutral sheet pose |
| Product reference | Geometry, color, material, branding, proportions | Studio background, sheet layout, camera sequence |
| Motion text | Action timing, camera movement, continuity, audio, constraints | Redefining asset roles implicitly |

Each attachment gets **one primary job**. Role overlap causes signal bleeding.

---

## Revised Workflow

Canonical shorthand: **normal storyboard → depth conversion → role-bound Seedance handoff**.

```text
1. Generate or approve a NORMAL STORYBOARD / CONTACT SHEET.
2. Freeze its layout contract.
3. Convert the COMPLETE SHEET into a neutral grayscale depth map.
4. Validate geometry and depth purity.
5. Send Seedance:
   A. tone + visual-style reference
   B. depth map storyboard
   C. character/product sheet when needed
6. State explicit role binding in the motion prompt.
```

### Why normal storyboard first

A normal storyboard lets the image model solve sequence, blocking, camera variety, and continuity in a familiar visual domain. Conversion then becomes a constrained transformation. Asking for a whole depth storyboard directly combines two hard tasks—story planning and depth inference—and commonly changes compositions or produces inconsistent panels.

**Hard rule:** conversion preserves the storyboard; it does not redesign it.

---

## Layout Contract

Before conversion, record:

- exact canvas dimensions and aspect ratio
- exact row × column grid and panel count
- panel dimensions
- divider/gutter placement and thickness
- reading order
- each panel’s crop, shot size, camera angle, perspective, and horizon
- subject positions and scale
- foreground occluders
- midground action
- background architecture/environment
- silhouettes and object overlap

The conversion is valid only if all of these remain unchanged.

---

## Canonical Conversion Prompt

Use with the normal storyboard/contact sheet attached:

```text
Transform the supplied storyboard or contact sheet into a clean monocular grayscale depth map.

Preserve exactly:
- canvas size and aspect ratio
- panel count and panel layout
- panel dimensions and divider lines
- framing, crop, camera angle, perspective, and horizon
- composition, subject placement, subject scale, object geometry, and silhouettes
- foreground, midground, and background relationships
- every visible object and every occlusion boundary

Estimate scene depth independently for each panel without changing the panel's composition. Use one consistent depth convention across the complete sheet. Do not independently normalize or remap grayscale contrast per panel:

White = closest visible surfaces
Light gray = near foreground
Mid-gray = middle distance
Dark gray = distant background
Near-black = farthest sky or horizon
Black = panel dividers

Maintain accurate depth layering, occlusion, and smooth distance transitions. Nearer parts of objects must be brighter than farther parts, including limbs, clothing, props, terrain, and thin objects angled through space.

Preserve crisp silhouettes and fine geometry such as fingers, hair, vegetation, wires, fabric edges, and object boundaries. Use smooth depth gradients on curved or angled surfaces. Do not flatten a complete person or object into one uniform gray shape.

Brightness must represent distance only. Ignore source color, lighting, highlights, shadows, reflections, texture, material patterns, fog, rain, smoke, depth-of-field blur, grain, and motion blur.

Do not create halos, outlines, double edges, ambient occlusion, embossing, normal-map shading, texture shading, edge glow, or false depth.

Output only the neutral grayscale depth-map storyboard. Add no text, labels, numbering, captions, watermarks, objects, missing objects, decorative frame, or layout changes.
```

### Interpretation note

“Estimate depth independently for each panel” means each panel is a separate camera view whose geometry must be inferred separately. It does **not** authorize changing the grid, arbitrary contrast styling, or using luminance as depth.

---

## Depth Purity Rules

### Keep

- smooth gradients on rounded and angled surfaces
- crisp object boundaries and occlusion changes
- readable foreground/midground/background separation
- thin structures and recognizable silhouettes
- nearer body/object parts brighter than farther parts
- black dividers that do not bleed into panel content

### Remove

- RGB or residual tint
- source lighting and painted grayscale shading
- highlights, cast shadows, reflections
- material texture and patterns
- fog/rain/smoke interpreted as depth
- depth-of-field and motion blur
- grain, sketch lines, annotations
- ambient occlusion and edge outlines

### Convention

```text
near camera                                             far horizon
white → light gray → mid-gray → dark gray → near-black
```

Black is reserved for panel dividers and the farthest valid depth where appropriate.

---

## Seedance Role-Binding Block

Paste near the top of the motion prompt:

```text
REFERENCE ROLE BINDING

Use @[depth storyboard] for camera placement, framing, perspective, shot scale,
foreground/midground/background layering, silhouettes, occlusion, composition,
and spatial relationships only. Preserve its panel reading order. Ignore visual
style, color, lighting, material, texture, and identity detail from this asset.

Use @[tone visual reference] for final color palette, lighting, texture,
materials, atmosphere, mood, and design language only. Do not copy its camera
position, framing, crop, or subject arrangement when those conflict with the
depth storyboard.

Use @[character sheet] for face, hair or hijab, clothing, proportions, and
signature identity details only. Do not copy its neutral pose, blank background,
or sheet layout.

Use @[product reference] for product geometry, proportions, material, color,
and branding only. Do not copy its studio background or sheet layout.

Priority on conflict:
1. Identity/product facts → character or product sheet
2. Camera/composition/spatial layout → depth storyboard
3. Look/tone/material/lighting → tone visual reference
4. Motion/timing/audio → this text prompt
```

Omit unused attachment lines rather than leaving placeholders.

---

## Recommended Nine-Shot Story Logic

When the normal storyboard is a 3×3 sequence, a stable cinematic order is:

| Panel | Beat | Typical framing |
|---|---|---|
| 1 | Establish scene | Establishing wide |
| 2 | Movement/intention | Medium-wide or full body |
| 3 | Discovery/POV | OTS, POV, profile |
| 4 | Reaction | Medium close-up or close-up |
| 5 | Preparation | Anticipatory cinematic angle |
| 6 | Insert detail | Hand/object/eye/footstep/environment detail |
| 7 | Main action | Most dynamic depth layering |
| 8 | Consequence | Result/reaction/spatial change |
| 9 | Resolution | Wider reconnecting shot |

This is a planning pattern for the **normal storyboard**. The conversion phase must not rewrite these beats.

---

## QC Gate

### Layout fidelity

- [ ] Same canvas size and aspect ratio
- [ ] Same number of panels
- [ ] Same grid, panel dimensions, and divider lines
- [ ] Same framing, perspective, crop, horizon, and composition per panel
- [ ] No object added, removed, duplicated, or moved

### Depth fidelity

- [ ] White is nearest and black/near-black is farthest
- [ ] Brightness represents distance only
- [ ] Foreground, midground, and background separate clearly
- [ ] Occlusion boundaries are crisp
- [ ] Curved/angled surfaces have smooth depth gradients
- [ ] Thin structures and silhouette details survive
- [ ] People/objects are not flat uniform-gray cutouts

### Purity

- [ ] Neutral grayscale only
- [ ] No source lighting, shadow, highlight, reflection, or texture
- [ ] No fog/rain/smoke/motion blur encoded as depth
- [ ] No halos, outlines, double edges, AO, embossing, or false depth
- [ ] No text, labels, captions, watermark, or decorative frame

### Seedance binding

- [ ] Depth storyboard controls composition only
- [ ] Tone reference controls look only
- [ ] Character/product sheet controls identity only
- [ ] Motion text controls timing/action/audio only
- [ ] Conflict priority is explicit

Any failed layout-fidelity item blocks the handoff. Regenerate the conversion; do not “fix” changed composition in the Seedance text prompt.

---

## Failure Atlas

| Symptom | Diagnosis | Single repair variable |
|---|---|---|
| Source shadows remain | Grayscale conversion, not depth inference | Reassert “brightness = distance only” |
| Person is one gray cutout | Object-level flat fill | Require per-surface/limb depth gradients |
| White halo around subjects | Edge enhancement/AO artifact | Ban halo, AO, outline, embossing |
| Panels changed or disappeared | Model treated task as regeneration | Strengthen exact layout contract |
| Divider becomes gray | Divider not bound separately | Set panel dividers = black |
| Sky is brighter than foreground | Luminance leaked into depth | Set farthest sky/horizon = near-black |
| Style ref changes framing | Asset roles overlap | Add “do not copy framing” to tone role |
| Depth map changes costume/face | Depth asset asked to carry identity | Add character sheet; bind identity separately |
| Video ignores composition | Depth asset role absent/weak | Put depth-role binding first in motion prompt |

---

## Backend Reality

This capability can always produce the conversion prompt. Actual conversion requires an image-edit/image-to-image surface that accepts the normal storyboard as input.

- If the active tool accepts source images: run conversion and inspect the result.
- If the active tool is text-to-image only: return the paste-ready prompt and attachment checklist.
- Never fabricate a converted image or report success without a real output file.

---

## Provenance

Method structure validated against two public tutorials published in July 2026: an initial direct depth-only storyboard method and its revised successor. The revised normal-storyboard-first conversion is canonical here. Creator branding, examples, and project-specific imagery are intentionally omitted; only the reusable production method is retained.
