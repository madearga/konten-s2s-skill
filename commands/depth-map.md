# /s2s depth-map — Depth Map Storyboard

Converts an existing normal storyboard/contact sheet into a **depth-only storyboard prompt**, then prepares strict Seedance attachment-role bindings so composition and visual style stay decoupled.

**Capability:** Depth Map Storyboard  
**Aliases:** `/s2s depth-map`, `/s2s depth-storyboard`

---

## When This Is the Right Command

Use when the user:

- already has a normal storyboard/contact sheet and wants stronger camera/composition control in Seedance 2.0
- says “depth map storyboard”, “convert storyboard to depth”, “composition-first”, or “separate style from composition”
- wants the storyboard to control framing while a separate image controls tone/look

Do **not** use for:

- generating a normal storyboard from a brief → `/s2s storyboard`
- generating a depth map from one isolated style frame as the default workflow
- replacing character identity control → `/s2s character-ref`
- generic motion prompting without a storyboard → `/s2s motion`

---

## Required Inputs

| Input | Role | Required? |
|---|---|---|
| Normal storyboard/contact sheet | Exact panel geometry to convert | Yes |
| Tone + visual-style reference | Final color, lighting, texture, mood, design language | Yes for Seedance handoff |
| Character sheet | Face, clothing, proportions, defining details | If identity continuity matters |
| Product reference | Product geometry, material, color, branding | If product continuity matters |
| Target model / UI | Determines whether conversion can run here or must be pasted elsewhere | Recommended |

Ask at most one blocking question: **“Where is the normal storyboard image?”** Infer the rest from supplied assets and prior session output.

---

## Canonical Revised Workflow

The order is non-negotiable:

```text
NORMAL STORYBOARD FIRST
  ↓ preserve composition, framing, panel layout
CONVERT THE COMPLETE SHEET TO DEPTH
  ↓ remove color, lighting, texture, style
DEPTH MAP STORYBOARD
  + TONE / VISUAL-STYLE REFERENCE
  + CHARACTER / PRODUCT SHEET (when needed)
  ↓ strict role binding
SEEDANCE 2.0
```

**Never default to generating the entire storyboard directly in depth-only mode.** The revised method produces the normal storyboard first, then converts that exact sheet. Direct depth-storyboard generation is legacy/experimental only.

---

## Behavior

1. Verify the storyboard image path/URL exists.
2. Load `../references/depth-map-storyboard.md`.
3. Inspect the source sheet and record its **layout contract**:
   - canvas dimensions and aspect ratio
   - rows × columns and exact panel count
   - equal/unequal panel dimensions
   - gutter/divider thickness and color
   - reading order
   - each panel’s framing, perspective, subject scale, silhouettes, and occlusion
4. Produce the canonical conversion prompt from the reference without changing its depth convention.
5. Determine execution mode:
   - **Image-edit backend available:** attach the normal storyboard and run the conversion.
   - **Text-to-image-only backend:** do not fake conversion; return a paste-ready prompt for Nano Banana or an image-edit-capable GPT Image 2 surface.
6. Validate the output against the source layout contract.
7. Prepare the Seedance attachment-role block:
   - depth storyboard → composition/camera/spatial layout only
   - tone reference → final look only
   - character sheet → identity only
   - product sheet → product identity only
8. Output the prompt, role-binding block, QC result, and next step.

Completion criterion: the conversion prompt preserves every panel and the Seedance role block assigns exactly one primary job to each attachment.

---

## Output Format

````markdown
## Depth Map Storyboard Conversion

**Source storyboard:** [path/URL]
**Layout contract:** [canvas] · [rows × columns] · [panel count] · [reading order]
**Execution:** [generated here | paste into image-edit-capable model]

### Paste-ready conversion prompt
```text
[canonical conversion prompt]
```

### Seedance attachment-role binding
```text
Use @[depth storyboard] for camera placement, framing, perspective, subject scale,
foreground/midground/background layering, silhouettes, occlusion, and spatial
relationships only. Ignore any style or appearance cues from it.

Use @[tone visual reference] for color palette, lighting, texture, materials,
atmosphere, mood, and final visual language only. Do not copy its framing.

Use @[character sheet] for face, clothing, proportions, and defining identity
features only. Do not copy its sheet layout or neutral poses.

Use @[product reference] for product geometry, material, color, and branding only.
Do not copy its studio background or sheet layout.
```

### QC
- [ ] Exact canvas size/aspect ratio preserved
- [ ] Exact panel count/layout/dividers preserved
- [ ] White = closest; black/near-black = farthest
- [ ] Brightness represents distance only
- [ ] Crisp silhouettes and occlusion boundaries
- [ ] Smooth gradients on curved/angled surfaces
- [ ] No RGB color, texture, lighting, reflections, fog, or motion blur
- [ ] No added/missing objects, text, labels, or layout changes
- [ ] One primary role per Seedance attachment

### Next
Run `/s2s motion --bind` with the depth storyboard + tone reference + optional
character/product sheets.
````

---

## Common Failures

| Failure | Cause | Repair |
|---|---|---|
| Directly generated depth grid changes shots | Started in depth-only mode | Return to normal storyboard first, then convert the full sheet |
| Gray value follows lighting | Model made grayscale art, not depth | Reinforce “distance only”; remove shadows/highlights/texture |
| Flat cardboard people | Uniform gray per subject | Require nearer limbs/clothes/props brighter than farther parts |
| Halos/double edges | AO/outline/edge enhancement leaked in | Ban halos, outlines, AO, embossing, and false depth |
| Grid changed | Weak layout contract | Restate exact canvas, panel count, dividers, framing, perspective |
| Seedance copies storyboard style | Role bleeding | Bind depth to composition only and tone ref to look only |
| Identity drifts | Depth map contains silhouette, not identity | Add a character sheet with identity-only role binding |
| Backend rejects source image | Active backend is text-to-image only | Return paste-ready prompt; do not claim conversion succeeded |

---

## Related

- `../references/depth-map-storyboard.md` — conversion prompt, role binding, QC
- `../references/depth-map-user-flow.md` — reproducible interaction flow
- `storyboard.md` — creates the normal storyboard first
- `character-ref.md` — identity sheet when human continuity matters
- `motion.md` — Seedance handoff with role-bound attachments
