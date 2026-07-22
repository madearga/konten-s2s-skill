# /s2s depth-map — Image-to-Depth Converter

Converts **one supplied image** into a physically accurate grayscale linear depth map.

This command does not invent a nine-shot sequence. For that use `/s2s depth-storyboard`.

---

## Required Input

| Input | Required? |
|---|---|
| Source image path/URL | Yes |
| Image-edit-capable target model/UI | Recommended |

Ask only when blocked: **“Where is the source image?”**

---

## Behavior

1. Verify the source image exists and is readable.
2. Classify the source:
   - **single image/reference** → load `../references/depth-map-conversion.md`
   - **storyboard/contact sheet** → load `../references/depth-storyboard-conversion.md`
3. Record source dimensions, aspect ratio, geometry, silhouettes, and occlusion boundaries. For a storyboard, also record canvas, grid, panel count, dividers, framing, perspective, and reading order.
4. Use the selected canonical conversion prompt **without rewriting its depth convention**.
5. Execute only when the active backend accepts a source image:
   - image-edit/image-to-image available → convert, save, and inspect the real output
   - text-to-image only → return the exact paste-ready prompt; do not claim conversion
6. Validate:
   - white = nearest
   - black = farthest
   - smooth depth gradients
   - crisp boundaries
   - no color, texture, lighting, shading, outlines, normals, or ambient occlusion
7. Return the real output path when generated, otherwise the paste-ready prompt and blocker.

---

## Canonical Output

```markdown
## Depth Map Conversion

**Source:** [path/URL]
**Execution:** [generated here | paste into image-edit-capable model]

### Prompt profile
[single image | storyboard/contact sheet]

### Prompt
[exact selected canonical prompt]

### QC
- [ ] Geometry preserved
- [ ] Silhouettes preserved
- [ ] Occlusion boundaries preserved
- [ ] White nearest; black farthest
- [ ] Smooth surface gradients
- [ ] Crisp object edges
- [ ] No appearance/shading contamination
```

---

## Routing

```text
Need one image converted to depth?
→ /s2s depth-map

Need a new coherent 3×3 depth-only sequence from a visual ref + depth ref?
→ /s2s depth-storyboard

Already have a normal storyboard sheet and want that exact sheet converted?
→ /s2s depth-map [storyboard-sheet.png]
```

A storyboard sheet is still one source image. Preserve its complete geometry and layout; do not invent or reorder panels.

---

## Related

- `../references/depth-map-conversion.md` — exact converter prompt and QC
- `../references/depth-storyboard-conversion.md` — exact revised storyboard/contact-sheet conversion prompt
- `depth-storyboard.md` — direct 3×3 depth-only storyboard generator
- `../references/depth-map-user-flow.md` — both depth workflows
