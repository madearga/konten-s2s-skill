# Seedance 2.0 Best Practices (2026 Companion)

This file is a **local companion reference** for the `storyboard-to-seedance-suite` repo. It provides broader Seedance guidance that sits above the step-by-step templates.

For exact prompt format, use:
- `seedance-motion-prompt.md`
- `seedance-asset-binding.md`
- `seedance-pattern-library.md`

---

## Core Principles

1. **Text is the contract.** Attached images help, but the real control comes from explicit written panel beats, camera language, and constraints.
2. **Identity needs anchors.** If a human or product must stay consistent, attach a dedicated reference sheet.
3. **One attachment, one job.** Split camera / action / FX / rhythm references instead of overloading one clip.
4. **Short clips are more reliable.** For anything beyond ~15 seconds, split into modular clips.
5. **Music-in-post is safer.** Default to silent + diegetic foley unless baked-in music is truly required.

---

## Recommended Workflow

### New video generation
1. Build storyboard
2. Build character and/or product refs
3. Write motion prompt
4. Generate short clip
5. Review drift, continuity, pacing

### Existing video tasks
Use the same motion stage, but switch Step 3 into one of these modes:
- extend
- edit
- fuse
- beat-sync
- dialogue
- one-take

See `seedance-pattern-library.md`.

---

## Prompting Priorities

In order of importance:
1. Subject identity
2. Action chain
3. Camera grammar
4. Screen direction / geography
5. Emotional arc
6. Audio strategy
7. Negative prompts

If a prompt is too long, keep those elements before extra styling flourish.

---

## Camera / Continuity Rules

- Always specify **screen direction** for kitchens, rooms, and walkthrough spaces.
- Use per-beat shot naming instead of vague phrases like “dynamic camera”.
- If using multiple cuts, explicitly say **no drift between cuts**.
- If using one-take mode, remove all cut language and define a continuous camera path.

---

## Common Failure Modes

### 1. Generic output
Cause: storyboard image attached, but panel beats not written.

Fix: write the director-strip text into the motion prompt.

### 2. Identity drift
Cause: no dedicated reference sheet.

Fix: attach `@[character ref]` or `@[product ref]` and name it explicitly.

### 3. Style contamination
Cause: one reference video used for subject + camera + FX + rhythm.

Fix: use asset-role binding.

### 4. Pacing lock
Cause: music baked into generation too early.

Fix: generate silent and score in post.

---

## Related Local Docs

- `seedance-motion-prompt.md` — full 5-part spine
- `seedance-asset-binding.md` — role binding system
- `seedance-pattern-library.md` — scenario-specific Step 3 modes
- `video-analysis-template.md` — reverse-engineering structure

---

## Scope Note

This file intentionally stays concise and repo-local. It is not trying to replace a larger umbrella “all Seedance docs” manual; it only covers what this suite needs to remain self-contained.
