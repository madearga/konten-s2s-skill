# /s2s bundle — Assemble Multi-Capability Output into Single File

Bundles all artifacts from a session into a single markdown file for archival, Notion upload, or submission packaging.

**Capability:** Bundle
**Trigger:** `/s2s bundle` or auto-detect: "bundle everything", "package this", "save as one file", "upload to notion"

---

## When to Use

- User wants all prompts + outputs from a session in one file
- User is preparing for competition submission (Kreafest etc.)
- User wants to upload to Notion as a single page block
- User wants a portable artifact (copy-paste anywhere)
- Multi-clip narrative (5-7 clips) needs all 35 artifacts in one file

---

## What Gets Bundled

The bundle aggregates from the most recent outputs in the session:

| Section                 | Source                                       |
|-------------------------|----------------------------------------------|
| Brief                   | User's original request                      |
| Concept notes           | `/s2s hook` output (if any)                  |
| Storyboard prompts (N)  | `/s2s storyboard` outputs (one per clip)     |
| Storyboard images (N)   | Generated image paths                        |
| Character ref prompt    | `/s2s character-ref` output                  |
| Character ref image     | Generated image path                         |
| Product ref prompt      | `/s2s product-ref` output (if any)           |
| Product ref image       | Generated image path (if any)                |
| Motion prompts (N)      | `/s2s motion` or `/s2s compose-pattern` outputs |
| Cinematic variations    | `/s2s cinematic-variations` output (if any)  |
| Analysis                | `/s2s analyze` output (if any)               |
| Troubleshoot repairs    | `/s2s troubleshoot` reports (if any)         |
| QC summary              | Aggregated checks                            |
| Cost + time summary     | Per-capability totals                        |
| Resume instructions     | How to continue from any step                |

---

## Workflow

### Step 1: Inventory

Scan the session for artifacts. Identify which capabilities were invoked and what was generated.

### Step 2: Re-emit Each Artifact

For each artifact, include:
- The prompt (verbatim, copy-paste-ready)
- The output (image path, video path, or analysis text)
- The timestamp
- The command that produced it

### Step 3: Aggregate QC

Pull QC checks from each capability's checklist into a single section:
- Hook score (if applicable)
- Storyboard panel count
- Character ref consistency check
- Motion prompt pattern match
- Multi-clip continuity verification
- Sensitive content guardrails applied (if applicable)
- Backend usage + cost

### Step 4: Cost + Time Summary

| Capability                  | Cost (USD) | Wall Time     |
|-----------------------------|------------|---------------|
| [list each invoked]         | [sum]      | [sum]         |
| **TOTAL**                   | [sum]      | [sum]         |

### Step 5: Resume Instructions

For each phase, provide the exact command to continue:
```bash
# To regenerate storyboard image for clip 3:
/s2s storyboard --clip=3 --regenerate

# To regenerate motion prompt for clip 5:
/s2s motion --clip=5 --regenerate

# To re-run full pipeline from scratch:
/s2s pipeline "[original brief]"
```

### Step 6: Write to File

Save as `s2s-bundle-YYYYMMDD-HHMMSS.md` in the session's working directory.

---

## Output Format

```markdown
# s2s Bundle — [Project Name]

**Generated:** YYYY-MM-DD HH:MM:SS
**Project:** [brief or project name]
**Total cost:** $X.XX
**Total wall time:** Xh Ym

---

## Brief
[original user request, verbatim]

## Capabilities Invoked
- [x] /s2s hook
- [x] /s2s character-ref
- [x] /s2s storyboard × N
- [x] /s2s motion × N
- [ ] /s2s product-ref
- [ ] /s2s analyze
- [ ] /s2s cinematic-variations

---

## 1. Hook Variant Report
[/s2s hook output]

## 2. Character Reference
### Prompt
[/s2s character-ref output]

### Image
![character-ref](path/to/character.png)

## 3. Storyboards

### Clip 1 — [Name]
#### Prompt
[/s2s storyboard clip=1 output]

#### Image
![storyboard-1](path/to/storyboard-1.png)

### Clip 2 — [Name]
[same]

[... N clips]

## 4. Motion Prompts

### Clip 1 — [Name]
#### Pattern
[standard / extend / edit / fuse / beat-sync / dialogue / one-take]

#### Prompt
[/s2s motion clip=1 output]

#### Video
[video-1.mp4](path/to/video-1.mp4)

### Clip 2 — [Name]
[same]

[... N clips]

## 5. QC Summary

### Hook
- Score: X/25
- Tier: [1-5]
- Recommendation: [primary / fallback / both]

### Storyboards
- Panel count: 12 per clip (verified)
- Style consistency: [monochrome 4×3 / cinematic / other]
- Continuity lock: [applied / not applied]

### Character Reference
- Used in N motion prompts
- Angles covered: front / 3/4 / profile

### Motion Prompts
- Pattern coverage: standard / extend / etc.
- Time segmentation: applied to all clips > 10s
- HARD CUT markers: present at end of each shot
- Spatial Continuity Lock: applied across clips

### Multi-Clip Continuity
- Same character ref across all clips
- Geography locked: [room/street]
- Screen direction consistent: [yes/no]
- Wardrobe unchanged: [yes/no]
- Audio bed: diegetic foley only (no music baked in)

### Sensitive Content Guardrails (if applicable)
- 6-point guardrails applied: [yes/no]
- Help line CTA present: [yes/no]
- POV / hands-only fallback used: [yes/no]

### Backend Usage
- Storyboard images: [Codex / Pixazo Flux / Pixazo GPT Image 2]
- Character ref: [same]
- Motion generation: [Seedance 2.0 / Veo 3.1 / Kling 3.0]

---

## 6. Cost + Time Breakdown

| Capability              | Cost  | Wall Time |
|-------------------------|-------|-----------|
| /s2s hook               | $0.00 | 5m        |
| /s2s character-ref      | $0.02 | 2m        |
| /s2s storyboard × 7     | $0.14 | 15m       |
| /s2s motion × 7         | $3.50 | 90m       |
| /s2s troubleshoot × 2   | $0.00 | 10m       |
| **TOTAL**               | **$3.66** | **2h 2m** |

---

## 7. Resume Instructions

To regenerate any artifact:
```bash
# Regenerate hook variants:
/s2s hook --regenerate

# Regenerate character ref:
/s2s character-ref --regenerate

# Regenerate storyboard for clip 3:
/s2s storyboard --clip=3 --regenerate

# Regenerate motion for clip 5:
/s2s motion --clip=5 --regenerate

# Re-run full pipeline from scratch:
/s2s pipeline "[original brief]"
```

To troubleshoot any output:
```bash
/s2s troubleshoot --target=[prompt-or-image-path]
```

---

## 8. File Inventory

- `s2s-bundle-YYYYMMDD-HHMMSS.md` (this file)
- `character-ref.png`
- `storyboard-{1..N}.png`
- `motion-{1..N}.mp4`
- [other generated assets]

---

## 9. Submission Checklist (Competition)

If submitting to competition (Kreafest etc.):

- [ ] All 7 clips generated and reviewed
- [ ] Multi-clip continuity verified
- [ ] No text in grid cells (except end card)
- [ ] End card help line CTA included (if sensitive content)
- [ ] Composite in CapCut/DaVinci
- [ ] Color grade + audio bed applied
- [ ] Export at competition-required resolution
- [ ] Hashtags + caption prepared
- [ ] Submission form fields filled
- [ ] Backup copy in cloud storage

---

**License:** MIT — anonymized methodology
**Generated by:** storyboard-to-seedance-suite v1.7.0
```

---

## File Naming

```text
s2s-bundle-YYYYMMDD-HHMMSS.md

Examples:
s2s-bundle-20260618-143022.md
s2s-bundle-kreafest-saksi-di-layar-v2-20260618.md (project-name variant)
```

---

## Cross-Reference

- All commands — bundles outputs from any combination
- `commands/pipeline.md` — the legacy `/s2s pipeline` automatically calls `/s2s bundle` at the end
- SKILL.md main file — full capability router + cost references

---

## Related Commands

- After bundle created, user can:
  - Upload to Notion via `notion` skill (page block under 2000 chars — split if longer)
  - Archive to local storage
  - Share via git commit
  - Submit to competition form (manual step)