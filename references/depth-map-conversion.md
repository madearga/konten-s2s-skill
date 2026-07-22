# Image-to-Depth Conversion

## Purpose

Convert one supplied image—single frame, visual reference, or complete storyboard sheet—into a physically accurate grayscale linear depth map without redesigning the source.

---

## Canonical Prompt

Use exactly:

```text
Convert this image into a physically accurate grayscale linear depth map. White = nearest, black = farthest. Preserve geometry, silhouettes, and occlusion boundaries. Use smooth surface depth gradients and crisp object edges. Remove all color, texture, lighting, shading, outlines, normals, and ambient occlusion. Output only the clean depth map.
```

Do not append cinematic styling, new objects, narrative instructions, captions, or alternate depth conventions.

---

## Input Types

| Source | Behavior |
|---|---|
| Single visual frame | Convert the frame exactly |
| Visual reference for depth-storyboard workflow | Convert into IMAGE 2 — DEPTH REFERENCE |
| Complete storyboard/contact sheet | Convert the whole sheet as one image; preserve every panel and divider |

---

## QC

- [ ] Output dimensions/aspect ratio match source
- [ ] Geometry is unchanged
- [ ] Silhouettes and occlusion boundaries are unchanged
- [ ] White is nearest; black is farthest
- [ ] Intermediate gray values represent intermediate distance
- [ ] Rounded/angled surfaces use smooth gradients
- [ ] Object boundaries remain crisp
- [ ] No RGB color
- [ ] No texture/material pattern
- [ ] No lighting, highlights, cast shadows, reflections, or painted shading
- [ ] No outlines, normals, ambient occlusion, halo, or embossing
- [ ] Output contains only the clean depth map

Any geometry or convention failure blocks downstream use.

---

## Backend Rule

Actual conversion requires image-edit/image-to-image input support. A text-to-image-only backend may output the prompt but must not claim an image was converted.
