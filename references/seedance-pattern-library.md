# Seedance Pattern Library

Optional Step 3 patterns that **reuse the existing storyboard → ref → motion pipeline**. No new command is required; `/s2s motion` just changes the wording of the output prompt.

---

## Pattern 1 — Standard New Generation

Use for: normal brief → video runs.

Prompt signal:

```text
Treat every storyboard panel as a consecutive shot within a newly generated cinematic sequence.
```

---

## Pattern 2 — Extend Existing Video

Use for: continue a clip forward or backward.

Prompt signal:

```text
Continue the motion and continuity state from @[first frame ref] and preserve the existing environment, subject identity, lens behavior, and emotional tone.
Generate only the NEW continuation segment.
```

Best practices:
- State whether this is **forward extension** or **pre-roll extension**.
- Match the generated duration to the added duration only.
- Keep continuity variables fixed unless the brief explicitly changes one.

### Hard Frame Match — Seam-Lock Extension

For seamless continuation where the **first frame of the new clip must match the last frame of @video1 EXACTLY** (validated pattern from James Sismanes / @JamesSismanes, Jun 2026 — Brooklyn gelato truck workflow):

```text
VIDEO REFERENCE INSTRUCTION:
Extend @video1 — the FIRST FRAME of this new generation must match the FINAL FRAME of @video1 exactly.

Begin on the exact final composition from @video1: [describe final composition].
Same camera position, same subject position, same lighting, same animation style, same environment.
Do not start on a new shot. Do not jump forward. The opening must feel like a seamless continuation.

AUDIO CONTINUITY:
Carry the final audio from @video1 into the first frame with no reset, gap, or new cue.
Continue [the exact music/SFX/mood that was playing in @video1's final beat].
If dialogue was active, it must continue uninterrupted.

NEGATIVE PROMPT (lock):
- Do not start on a new shot
- Do not skip final frame continuity from @video1
- Do not change [identity/wardrobe/scene/lighting] from @video1
- Do not reset audio or introduce new music
```

When to use this variant:
- Multi-clip narrative where seam visibility breaks immersion (e.g., gelato truck scene continuing, walk-and-talk sequences, action chase)
- Series / episode continuation where each new generation must feel like continuous filming
- Anywhere the previous clip's final beat has dialogue or music that must carry forward

### Audio Carry-Over Specification

Three layers to carry forward from @video1 → new generation:

| Audio Layer | Carry Rule                                             |
|-------------|---------------------------------------------------------|
| BGM / score | Same track continues, no new cue, no reset to silence  |
| Dialogue    | If active at final beat, continue uninterrupted; if silent, hold silence |
| Foley       | Match the ambient bed (room tone, traffic, wind) — no new ambient unless scene changed |

Specify in prompt:
```text
AUDIO CONTINUITY: Continue [BGM description] from @video1's final beat.
Same ambient bed ([room tone / Brooklyn morning / etc]). No reset.
```

---

## Pattern 3 — Edit Existing Video

Use for: keep most of a source clip, but change one thing.

Prompt signal:

```text
Preserve the original shot order, environment, and overall motion grammar.
Replace only the specified variable: [character / product / wardrobe / expression / prop / text overlay / ending beat].
```

Always specify:
- what stays the same
- what changes
- which beats are affected

---

## Pattern 4 — Fuse Multiple Clips

Use for: turn 2-3 separate clips into one cohesive sequence.

Prompt signal:

```text
Fuse the attached sources into one continuous sequence with preserved screen direction and a motivated transition between sources.
Use clip A as the opening state, clip B as the middle state, and clip C as the final state.
```

Best practices:
- define the transition logic: match cut, whip, particle dissolve, camera pass-by, subject occlusion
- specify which clip controls **camera**, **action**, and **FX** if they differ

---

## Pattern 5 — Beat-Sync Montage

Use for: music-driven edits, TikTok punchy cuts, transformation montages.

Prompt signal:

```text
Map each panel beat to the cadence of @[rhythm ref video] or @[bgm ref audio].
Use cut density, impact accents, and pauses from the rhythm reference while preserving the storyboard order.
```

Add:
- downbeat / offbeat emphasis
- impact frames / settle beats / breath beats
- whether the clip should loop cleanly

---

## Pattern 6 — Dialogue / Talk-to-Camera

Use for: host-led UGC, skits, education, reaction videos.

Prompt signal:

```text
Preserve facial readability, mouth-shape clarity, and performance continuity.
Prioritize natural pauses, eye-line consistency, and gesture phrasing over flashy camera changes.
```

Optional additions:
- `@[voice ref audio]` for tone / cadence only
- subtitle or text-card guidance if needed

---

## Pattern 7 — One-Take / Single-Take

Use for: “no cuts” choreography.

Prompt signal:

```text
Render the sequence as one uninterrupted take with no hidden cuts, preserving a continuous camera path and consistent environmental geography.
```

Always specify:
- camera path
- subject path
- occluders / reveals
- ending pose or handoff frame

---

## Pattern Selector Cheat Sheet

| User asks for… | Pattern |
|---|---|
| normal ad / cinematic clip | Standard New Generation |
| continue this clip | Extend Existing Video |
| same clip but change X | Edit Existing Video |
| combine 2-3 source videos | Fuse Multiple Clips |
| music-driven pacing | Beat-Sync Montage |
| talking host / skit / explainer | Dialogue / Talk-to-Camera |
| no cuts / one shot | One-Take / Single-Take |

---

## Common Mistakes

1. Using standard-generation wording for an extension task.
2. Editing too many variables at once.
3. Fusing clips without an explicit transition logic.
4. Calling something “one-take” while also specifying cut-heavy coverage.
5. Letting rhythm references override story order.
