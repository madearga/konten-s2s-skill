# /s2s troubleshoot — Failure Diagnosis + Repair

Diagnoses why a generated video looks wrong, matches to a known failure mode, applies the minimal one-variable repair, and retries.

**Capability:** Troubleshoot
**Trigger:** `/s2s troubleshoot` or auto-detect phrases like "output wrong", "doesn't look right", "video failed", "face is off", "camera is wrong", "regenerate this"

---

## When to Use

- User just generated a video and reports it doesn't match intent
- User references an output from a prior turn
- User wants to iterate on a single variable (face / camera / scene / pacing / color / audio)
- Multiple output attempts have failed

---

## Inputs to Gather

1. **Symptom description** — what specifically is wrong? (face, camera, scene, action, audio, color, etc.)
2. **Prompt used** — copy of the prompt that produced the failed output
3. **Backend used** — Seedance 2.0 / Veo 3.1 / Kling 3.0 / Pixazo / Codex
4. **Reference images / videos attached** — which assets, what roles
5. **Number of attempts** — first try? 3rd try? (impacts repair strategy)

---

## Workflow

### Step 1: Load Troubleshooting Reference

Read `references/seedance-troubleshooting.md` (canonical 10-category failure-mode taxonomy with repair patterns).

### Step 2: Identify Symptom Category

Match user description to one of 10 categories:

| Category                          | Common Symptoms                                              |
|-----------------------------------|--------------------------------------------------------------|
| 1. Identity / Face Drift          | Faces differ between clips, waxy/plastic, hands warped       |
| 2. Camera / Composition Failure   | Camera drifts, dissolves shots, extra moves, whip pan       |
| 3. Action / Motion Failure        | Too fast/slow, freezes mid-action, object floats            |
| 4. Scene / Environment Failure    | Background hallucinates, lighting inconsistent, geography flips |
| 5. Audio / Dialogue Failure       | Silent, lip-sync off, music too loud                        |
| 6. Style / Aesthetic Failure      | "AI generic", wrong palette, wrong aspect ratio             |
| 7. Model Backend Failure          | Codex empty response, Veo face hallucination, Kling over-smooth |
| 8. Content Policy / Safety Block  | Realistic face blocked, sensitive content blocked            |
| 9. Continuity / Multi-Clip Failure | Wardrobe changes, prop state inconsistent, mood drift       |
| 10. General Wrongness             | Doesn't match intent, unclear failure                        |

### Step 3: Match to Specific Failure Mode

Within the category, find the row matching the symptom → grab the repair pattern from the table.

### Step 4: Apply One-Variable Retake

Per `references/seedance-troubleshooting.md` § "One-Variable Retake Protocol":

- Change ONLY the variable that matches the symptom
- KEEP all other variables identical
- If user reaction is "face is wrong" → change character description + ref, keep camera/scene/action
- If "camera moves too much" → change camera language section, keep character/scene/action
- If "scene is wrong" → change scene description + scene ref, keep character/camera/action
- If "pacing too fast" → change time-segmented action + RHYTHM track, keep camera/scene/character
- If "mood off" → change Valence + Arousal phrasing, keep action/camera/scene
- If "color wrong" → change color spec, keep all other layers
- If "audio wrong" → change Sound line, keep all other layers

### Step 5: Regenerate

Submit the modified prompt. Do NOT change multiple variables in one retake.

### Step 6: Verify

If still wrong after 3 retakes on the SAME variable, surface to user before burning budget.

---

## Output Format

```markdown
# /s2s troubleshoot — Diagnosis Report

## Symptom
[user description of what's wrong]

## Diagnosis
**Category:** [1-10]
**Failure Mode:** [specific mode name]
**Likely Cause:** [single-line cause]

## Repair
**Variable to change:** [face / camera / scene / pacing / mood / color / audio]
**Old prompt section:**
```
[verbatim section to replace]
```

**New prompt section:**
```
[replacement with repair pattern applied]
```

## Retake Prompt
```
[full regenerated prompt with ONLY the changed variable]
```

## Verification
After 3 retakes on the same variable, escalate to user.
```

---

## Common Patterns (Cheat Sheet)

| User Says                              | Likely Category | Repair Pattern Reference |
|----------------------------------------|-----------------|--------------------------|
| "Face looks different from ref"        | 1. Identity     | `seedance-troubleshooting.md` § 1.A        |
| "Face looks plastic/AI"                | 1. Identity     | § 1.B realism texture pack                 |
| "Hand has extra fingers"               | 1. Identity     | § 1.C hand-specific                        |
| "Camera doesn't match what I asked"    | 2. Camera       | § 2.C extra moves                          |
| "Shots blend into each other"          | 2. Camera       | § 2.B HARD CUT marker                      |
| "Camera moves when it shouldn't"       | 2. Camera       | § 2.C locked qualifier                     |
| "Motion is too slow/fast"              | 3. Action       | § 3.A time-segmented                       |
| "Subject freezes mid-action"           | 3. Action       | § 3.B endpoint                              |
| "Background has random props"          | 4. Scene        | § 4.A scene specificity                    |
| "Room is different between clips"      | 4. Scene        | § 4.C geography flip / Spatial Continuity Lock |
| "No sound"                             | 5. Audio        | § 5.A duration + audio cue                 |
| "Looks too AI / generic"               | 6. Style        | § 6.A style anchors                        |
| "Codex returned nothing"               | 7. Backend      | § 7.A Codex quota pitfall (SKILL.md main file) |
| "Veo hallucinated face"                | 7. Backend      | § 7.B Veo failure                          |
| "Generation was blocked"               | 8. Safety       | § 8.A face block / § 8.B sensitive content |
| "Clothes change between clips"         | 9. Continuity   | § 9.A wardrobe lock                        |
| "Object (phone/wallet) appears/disappears" | 9. Continuity | § 9.B prop state                          |
| "Output doesn't feel right at all"     | 10. General     | Re-prompt with 1-2 disambiguating questions |

---

## Cross-Reference

- `references/seedance-troubleshooting.md` — full taxonomy (10 categories × multiple modes each)
- `references/seedance-camera-language.md` — camera failure repair patterns
- `references/seedance-motion-vocabulary.md` — anti-slop lexicon + realism texture pack
- `references/seedance-reference-syntax.md` — role binding fixes (attachment ambiguity)
- `references/seedance-no-character-ref-pov-workflow.md` — POV / hands-only fallback
- SKILL.md main file: "Pitfalls (Top 12)" + "Codex Backend Quota Pitfall" + "Sensitive Content Safety Guardrails"

---

## Related Commands

- After repair applied, user may want to re-run `/s2s motion` with the updated prompt
- If multiple outputs were bundled, run `/s2s bundle` to regenerate the bundle file
- If the repair reveals a gap in references, suggest creating a new reference or updating existing one