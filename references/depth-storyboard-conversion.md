# Storyboard/Contact-Sheet to Depth — Revised Conversion Prompt

Use this profile when the supplied source image is already a normal storyboard or contact sheet.

```text
Transform the supplied storyboard or contact sheet into a clean monocular grayscale depth map. Preserve the exact canvas size, aspect ratio, panel layout, divider lines, framing, perspective, composition, and object silhouettes.

Estimate depth independently for each panel.

Use this depth convention:

White = closest surfaces
Light gray = near foreground
Mid-gray = middle distance
Dark gray = distant background
Near-black = farthest sky or horizon
Black = panel dividers
Maintain accurate depth layering, occlusion, and smooth distance transitions. Nearer parts of objects should be brighter than farther parts, including limbs, clothing, props, terrain, and thin objects angled through space.
Preserve crisp silhouettes and fine details such as fingers, hair, vegetation, wires, and object edges. Use smooth gradients on curved surfaces without flattening subjects into uniform gray shapes.
Depth values must represent distance only. Ignore color, lighting, highlights, shadows, reflections, texture, fog, rain, smoke, and motion blur.
Avoid halos, outlines, double edges, ambient occlusion, embossing, texture shading, and false depth.
Output only the neutral grayscale depth map with no text, labels, added objects, missing objects, or layout changes.
```

## Selection Rule

- Single normal image/reference → `depth-map-conversion.md`
- Existing storyboard/contact sheet → this prompt

Do not use this prompt to invent panels. It transforms the supplied sheet exactly.
