# /s2s depth-storyboard — Direct 3×3 Depth-Only Storyboard

Generates one coherent nine-shot cinematic storyboard directly in depth-only form from:

- **IMAGE 1 — VISUAL REFERENCE**: scene, characters, objects, environment, identity, mood
- **IMAGE 2 — DEPTH REFERENCE**: grayscale convention, spatial layering, edge behavior, depth appearance

This is a separate capability from `/s2s depth-map`.

---

## Required Inputs

| Input | Role | Required? |
|---|---|---|
| IMAGE 1 — visual reference | Content and visual identity | Yes |
| IMAGE 2 — depth reference | Depth convention and appearance | Yes |
| Image-generation target model/UI | Execution surface | Recommended |

If IMAGE 2 is missing, route first to:

```text
/s2s depth-map [IMAGE 1]
```

Then use the generated depth map as IMAGE 2.

---

## Behavior

1. Verify both images exist.
2. Load `../references/depth-storyboard-system-prompt.md` in full.
3. Keep the system prompt’s eight phases and exact 3×3 shot order.
4. Attach IMAGE 1 as visual reference and IMAGE 2 as depth reference.
5. Generate exactly nine sequential shots in one 3×3 grid.
6. Validate continuity, cinematic progression, screen direction, depth convention, grid, and absence of RGB/text.
7. Return the real output image path plus pass/fail QC.
8. If the backend cannot accept both references, return the full paste-ready system prompt and upload order; do not claim generation.

---

## Shot Order

| Position | Shot | Beat |
|---|---|---|
| Top left | 1 | Establishing wide |
| Top center | 2 | Movement or intention |
| Top right | 3 | Discovery or POV |
| Middle left | 4 | Reaction |
| Middle center | 5 | Preparation |
| Middle right | 6 | Insert detail |
| Bottom left | 7 | Main action |
| Bottom center | 8 | Consequence |
| Bottom right | 9 | Resolution wide |

---

## Completion Gate

- [ ] Exactly nine panels, equal dimensions, 3×3 grid
- [ ] One coherent sequence, not nine unrelated compositions
- [ ] Same subject, environment, identity, proportions, clothing, objects, and time
- [ ] Logical action progression and stable screen direction
- [ ] Meaningful camera/shot variation
- [ ] White nearest, black farthest across all panels
- [ ] No per-panel grayscale normalization
- [ ] Brightness represents distance only
- [ ] No RGB, texture, lighting, shading, AO, labels, captions, numbering, or annotations
- [ ] Output only the completed depth-map storyboard

---

## Output

```markdown
## 3×3 Depth-Only Storyboard

**IMAGE 1:** [visual reference]
**IMAGE 2:** [depth reference]
**Execution:** [generated here | paste into capable model]

### System prompt
[full eight-phase prompt]

### Attachment order
1. IMAGE 1 — VISUAL REFERENCE
2. IMAGE 2 — DEPTH REFERENCE

### QC
[14-point result]
```

---

## Related

- `../references/depth-storyboard-system-prompt.md` — complete system prompt
- `depth-map.md` — create IMAGE 2 from IMAGE 1
- `../references/depth-map-user-flow.md` — chained and standalone flows
- `motion.md` — downstream Seedance motion handoff
