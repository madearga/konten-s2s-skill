# Seedance Failure Atlas — sequence and continuation failures

**Source / attribution:** Adapted from `Emily2040/seedance-2.0` (`references/failure-atlas.md`, commit `7659cbd`, MIT License, copyright Iamemily2050).

Use this for connected clips, continuation, extension, and multi-shot outputs.

| Symptom | Likely cause | Primary repair variable |
|---|---|---|
| Continuation begins from planned ending | Parent observed state was not reviewed | Replace opening with observed end state |
| Action restarts | Completed beat was not marked already happened | Add completed beat exclusion |
| Future event appears early | Reserved beat leaked into prompt | Remove future beat from current prompt and endpoint |
| Identity drifts through extensions | Continuity source displaced canonical identity reference | Re-anchor identity from original character/product image |
| Screen direction flips | Axis was not locked or reset intentionally | State screen direction or declare axis reset |
| Open motion stops | Motion vector was not inherited | Carry subject/camera speed and direction |
| Camera phase restarts | Camera endpoint from parent was missing | Start from observed camera phase |
| Prop contradicts prior clip | Prop owner/position/condition was not tracked | Add prop state handoff |
| Dialogue repeats | Completed dialogue was not logged | Mark line completed and continue audio phase |
| Extension quality degrades | Extension depth/drift ignored | Re-anchor or create intentional next shot |
| Reference roles contaminate | Transfer/ignore clauses absent | Split reference roles and exclusions |
| Event density too high | Several beats compiled into one prompt | Reassign future beats to later clips |
