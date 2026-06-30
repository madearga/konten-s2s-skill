# Seedance Model Mechanics — why prompt repairs work

**Source / attribution:** Adapted from `Emily2040/seedance-2.0` (`references/model-mechanics.md`, commit `7659cbd`, MIT License, copyright Iamemily2050). This is a working mental model, not unpublished platform architecture.

Use this before rewriting a failed prompt. Pick the dominant mechanism, then change the lever that actually controls it.

## The eight mechanisms

### 1. Attention is a budget
Every prompt word competes for conditioning influence. Visible, specific words spend budget on pixels; empty evaluators (`cinematic`, `stunning`, `beautiful`) spend it on nothing.

**Lever:** cut slop, put subject/action/reference role first, keep the prompt dense.

### 2. Generation pulls toward the familiar
The model stabilizes around familiar visual clusters. Rare combinations wobble unless staged as familiar pieces.

**Lever:** name a concrete visual cluster (`UGC handheld product demo`, `documentary realism`, `cel animation`) and repeat exact style anchors across shots.

### 3. There is no reliable NOT
Negation still activates the thing it names. `No blood` can summon blood.

**Lever:** describe the positive replacement. Use platform-parsed constraints only for simple production exclusions (`no watermark`, `no on-screen text`).

### 4. Time is a trajectory prior
Video wants cause → motion → visible consequence. Disconnected micro-directions get smoothed away.

**Lever:** one physical cause, one visible action, one endpoint.

### 5. Errors compound
Tiny identity/prop/state errors grow across a clip and get worse when generated outputs become new sources.

**Lever:** shorter clips, original-reference re-anchor, reset after several continuations.

### 6. References outrank text where they overlap
Images/videos/audio references are denser than prose. Text that re-describes a reference can conflict with it. Motion references can drag appearance along.

**Lever:** prompt only what the reference cannot show; state transfer + ignore clauses.

### 7. Detail capacity scales with screen area
Tiny faces, logos, hands, and text degrade first. If a detail matters, it needs pixels.

**Lever:** make the detail large in frame or give it its own shot.

### 8. Audio and video are generated together
Sound cues can anchor timing, but dialogue/lip-sync add joint constraints.

**Lever:** one speaker, short line, stable face, named SFX/ambience cue.

## Mechanism-indexed diagnosis

| Symptom | Dominant mechanism | Primary lever |
|---|---|---|
| Output generic despite long prompt | Attention diluted | Cut slop; reorder priorities first |
| Style/look flickers | Familiar-cluster hopping | Repeat exact anchor phrase every shot |
| Excluded thing appears | Negation summoned it | Describe what is there instead |
| Action skipped or mushy | No trajectory to ride | One cause, visible consequence, endpoint |
| Identity decays over time | Compounding error | Shorter clip; original-reference re-anchor |
| Reference fights prompt | Conflicting conditioning | Delete re-description; state non-transfer |
| Small detail breaks | Capacity starvation | Enlarge detail or isolate it in a shot |
| Lips/sound desync | Joint audio-video constraint overloaded | Lock face; shorten line; name sound cue |
