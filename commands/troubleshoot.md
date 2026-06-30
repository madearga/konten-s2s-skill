# /s2s troubleshoot — Failure Diagnosis + Retake Repair

Diagnoses why a generated video looks wrong, triages whether to keep/fix/edit/reroll/rewrite, then applies the smallest one-variable repair.

**Capability:** Troubleshoot
**Trigger:** `/s2s troubleshoot` or auto-detect phrases like "output wrong", "doesn't look right", "video failed", "face is off", "camera is wrong", "regenerate this", "retake", "reroll"

---

## When to Use

- User generated a video and reports a mismatch
- User asks whether to keep, reroll, edit, or rewrite a take
- A continuation/extension drifts from the previous clip
- Multiple attempts failed and the next attempt needs a controlled repair

---

## Inputs to Gather

1. **Symptom** — what specifically is wrong? face, camera, motion, scene, audio, color, style, continuity, safety block.
2. **Prompt used** — full prompt or relevant section.
3. **Backend / surface** — Seedance 2.0, Veo, Kling, Runway, fal, Kie, etc.
4. **References used** — image/video/audio assets and intended roles.
5. **Attempt count + change log** — first try, reroll, or repeated failure?
6. **If continuation:** accepted parent clip final frame / observed end state.

If the user only says "wrong", ask for the symptom and prompt before rewriting.

---

## References to Load

Use these in order:

1. `references/seedance-retake-protocol.md` — decide keep / fix in post / edit / reroll / rewrite.
2. `references/seedance-model-mechanics.md` — identify why the failure happened.
3. `references/seedance-failure-atlas.md` — sequence and continuation-specific repairs.
4. `references/seedance-troubleshooting.md` — existing 10-category taxonomy + repair patterns.

---

## Workflow

### Step 1: Triage the take first

Do **not** automatically regenerate. Pick one verdict:

| Verdict | Use when | Next move |
|---|---|---|
| Keep | Primary purpose delivered; flaw not fatal | Lock it, log it, move on |
| Fix in post | Trim, color, overlay text, sound mix, edge-frame instability | Do not regenerate |
| Edit, don't regenerate | Composition/timing good; one layer wrong; edit mode available | Use source take; edit one layer |
| Re-roll | Prompt is right; sample unlucky | Same prompt, new seed; max 2–3 |
| Rewrite | Same flaw appears in 2+ takes | Diagnose mechanism; change prompt |

### Step 2: Diagnose mechanism

Map symptom to the dominant mechanism:

| Symptom | Mechanism | Lever |
|---|---|---|
| Generic / bland | Attention diluted | Cut slop; move priorities first |
| Style flickers | Familiar-cluster hopping | Repeat exact style anchor |
| Excluded thing appears | Negation summoned it | State positive replacement |
| Action skipped / mushy | No trajectory | One cause + visible consequence + endpoint |
| Identity decays | Compounding error | Shorter clip + original-reference re-anchor |
| Reference contaminates output | Overlapping reference conditioning | Transfer/ignore clause |
| Small detail breaks | Capacity starvation | Make it larger or isolate shot |
| Lip/audio desync | Joint audio-video overload | Shorter line + stable face + named cue |

### Step 3: Match failure category

Use `seedance-troubleshooting.md` for these categories:

1. Identity / Face Drift
2. Camera / Composition Failure
3. Action / Motion Failure
4. Scene / Environment Failure
5. Audio / Dialogue Failure
6. Style / Aesthetic Failure
7. Model Backend Failure
8. Content Policy / Safety Block
9. Continuity / Multi-Clip Failure
10. General Wrongness

For continuation/sequence failures, check `seedance-failure-atlas.md` first.

### Step 4: Apply the one-variable rule

Change exactly one thing:

- one prompt clause, OR
- seed, OR
- mode/backend, OR
- one reference asset / reference role.

Never change several at once. If the new take improves, you know why. If it fails, you know what did not work.

### Step 5: Produce the repair

Rewrite only the failing section plus a full retake prompt. Preserve all unchanged variables verbatim.

### Step 6: Log the retake

Use this one-line log:

```text
Take N · changed: [one variable] · seed: [same/new] · verdict: [keep/post/edit/reroll/rewrite] · evidence: [one sentence]
```

Two takes with the same flaw = rewrite, not another lucky reroll.

---

## Output Format

````markdown
# /s2s troubleshoot — Diagnosis Report

## Symptom
[user description]

## Triage Verdict
**Verdict:** Keep / Fix in post / Edit / Re-roll / Rewrite
**Why:** [one sentence]

## Diagnosis
**Category:** [1-10 or Failure Atlas]
**Dominant mechanism:** [attention / familiar prior / negation / trajectory / compounding / reference overlap / capacity / audio-video constraint]
**Likely cause:** [single-line cause]

## One-Variable Repair
**Variable to change:** [seed / camera clause / action endpoint / reference role / duration / mode / etc.]

**Old section:**
```
[verbatim]
```

**New section:**
```
[replacement]
```

## Retake Prompt
```
[full prompt with only the one variable changed]
```

## Shot Log
`Take N · changed: ... · seed: ... · verdict: ... · evidence: ...`

## Stop Condition
[attempt budget / when to stop / post-production fallback]
````

---

## Cheat Sheet

| User says | Likely diagnosis | First repair |
|---|---|---|
| "Face different from ref" | Identity drift / compounding | Re-anchor original character ref; keep identity phrase verbatim |
| "Looks plastic" | Style realism gap | Add concrete texture/light/environment anchors, not `realistic` alone |
| "Camera moves too much" | Extra camera verbs | One camera move with endpoint; add `camera locked` if static |
| "Action skipped" | No trajectory | One cause, visible consequence, explicit end state |
| "Object floats" | Physics missing | Name weight/gravity/contact/settle |
| "Background random" | Scene under-specified | Add scene anchors; remove vague setting adjectives |
| "No sound" | No audio cue / unsupported surface | Add one explicit sound line or move audio to post |
| "Lip sync bad" | Audio-video overload | One speaker, <8 words, stable face, less camera motion |
| "Looks AI generic" | Attention diluted by slop | Cut empty evaluators; name observable details |
| "Continuation restarts" | Parent observed state missing | Begin from observed end state; mark completed beat |
| "Future event appears early" | Event density leak | Remove reserved future beat from prompt |
| "Reference brought wrong look" | Reference role contamination | Add transfer + ignore clause |

---

## Related Commands

- `/s2s motion` — regenerate motion prompt after repair
- `/s2s ads` — rebuild ad prompt with lower event density
- `/s2s bundle` — rebundle accepted prompt + retake log
