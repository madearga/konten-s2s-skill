# Camera Language Reference — Seedance 2.0 / Veo 3.1 / Kling 3.0

**Source:** Composite from `dexhunter/seedance2-skill` + `Emily2040/seedance-2.0` v5.5.2, deduped and aligned with s2s skill's 19-vocab cinematic composition library.

Use this when writing Step 3 motion prompts. Every shot should declare camera language explicitly — Seedance drifts without it.

---

## Core Principle

> One primary camera move per shot. State the endpoint. Pair with a HARD CUT marker for fences.

```text
slow dolly-in from medium product shot to macro label detail (HARD CUT)
```

Single move, named verb, explicit endpoint, cut fence. Three-second read for the model.

---

## Basic Movements

| Movement              | Description                                              | When to Use                            |
|-----------------------|----------------------------------------------------------|----------------------------------------|
| **Push in / dolly in**| Camera moves toward subject                              | Tension, intimacy, reveal              |
| **Pull back / dolly out** | Camera moves away                                     | Reveal context, isolation, breath      |
| **Pan left/right**    | Horizontal rotation on fixed axis                        | Follow subject, reveal environment     |
| **Tilt up/down**      | Vertical rotation on fixed axis                          | Reveal height, power dynamic           |
| **Track / follow**    | Camera moves alongside subject                           | Chase, walk, pursuit                   |
| **Orbit / revolve**   | Camera circles subject                                   | Hero moment, product showcase          |
| **Pedestal up/down**  | Camera rises/lowers vertically without rotating          | Reveal scale, change eye-level         |
| **Crane up/down**     | Camera moves through space on boom arm                   | Epic reveal, transition                |
| **Static / locked**   | No camera movement                                       | Dialogue, portrait, tension hold       |

---

## Advanced Techniques

| Technique                  | Description                                            | Use Sparingly                          |
|----------------------------|--------------------------------------------------------|----------------------------------------|
| **Hitchcock zoom / dolly zoom** | Push in + zoom out simultaneously = vertigo effect | Psychological tension, realization     |
| **Fisheye lens**           | Ultra-wide distortion                                  | Surreal, horror, dream-state           |
| **Whip pan**               | Fast horizontal pan with motion blur                   | Transition, energy shift               |
| **Crash zoom**             | Fast push-in with shake                                | Impact, shock, comedy beat             |
| **Roll**                   | Camera rotates around lens axis                        | Disorientation, transition             |
| **Dutch angle**            | Tilted horizon                                         | Unease, instability                    |
| **Low angle / hero shot**  | Camera below subject looking up                        | Power, dominance, threat               |
| **High angle / bird's-eye**| Camera above subject looking down                      | Vulnerability, overview                 |
| **POV / first-person**     | Camera = character's eyes                              | Immersion, video-game aesthetic        |
| **Over-the-shoulder (OTS)**| Behind one character framing another                   | Dialogue, connection, observation      |
| **Handheld**               | Visible shake, organic movement                        | Realism, urgency, doc-style            |
| **Gimbal / stabilized**    | Smooth gliding movement                                | Premium cinematic, beauty shot         |
| **Steadicam follow**       | Subject tracked through environment                     | One-take, continuous scene             |
| **Drone aerial**           | High-altitude establishing                             | Scale, geography, opening              |
| **Macro**                  | Extreme close-up of small detail                       | Texture, emotion detail, product focus |
| **Telephoto / compressed** | Long lens flattens depth                               | Surveillance, voyeurism, voyeur POV    |
| **Wide / establishing**    | Shows full environment                                  | Context, geography, scale              |

---

## Shot Sizes (Film Grammar)

| Term                | What's in Frame                                  | Emotional Read         |
|---------------------|--------------------------------------------------|------------------------|
| **Extreme wide (EWS)**| Vast environment, subject tiny or absent        | Isolation, scale       |
| **Wide (WS)**       | Full body + environment                         | Context, geography     |
| **Full shot (FS)**  | Full body, minimal environment                  | Posture, action read   |
| **Medium wide (MW)**| Knees-up                                          | Action + relationship  |
| **Medium (MS)**     | Waist-up                                          | Conversation, gesture  |
| **Medium close (MCU)**| Chest-up                                         | Emotion + reaction    |
| **Close-up (CU)**   | Face fills frame                                 | Emotion, intimacy      |
| **Extreme close-up (ECU)**| Eyes, mouth, hands, tiny detail              | Intensity, detail      |

**Rule of thumb:** the closer the shot, the more emotional weight. The wider the shot, the more environmental context.

---

## One-Take / Oner

Continuous shot, no cuts. Used for:
- **Walk-and-talk** dialogue scenes
- **Chase sequences** through environment
- **Time-passage** single room transformation
- **Hero entrances** that build to a beat

```text
ONE-TAKE / ONER, no cuts, 8-15s
continuous tracking shot from [A] to [B],
passing through [C], [D], [E]
```

Add `(ONE-TAKE — NO CUTS — DO NOT DISSOLVE)` in CONSTRAINTS.

---

## POV Rules

POV = first-person from character's eyes. The camera IS the character. Things to lock:

- **Eye-line** — where the character is looking
- **Hand visibility** — hands enter frame when subject reaches
- **Body exclusion** — never see own body unless looking down
- **Head movement** — corresponds to character's head turns
- **Blink / breath** — micro-movements sell immersion

```text
POV from character's eyes, looking down at phone screen
in character's hand, screen glow lights face area (no face visible — only glow on hands and chest)
```

**For cyberbullying/PSA where face must not be shown**: `POV looking down — DO NOT show face, only hands + phone screen + ambient reflection on chest`.

---

## Time-Segmented Camera Direction

For shots longer than 10s, break camera language into time buckets:

```text
0-3s: locked wide establishing, character center frame, ambient room tone
3-6s: slow push-in to medium shot, footsteps audible
6-10s: tight close-up on hands/phone, breath rising
10-15s: pull back to wide, character exits frame (HARD CUT TO BLACK)
```

This is how you prevent the model from picking ONE camera move and running it for 15s without variation.

---

## Common Failure Modes

| Failure                          | Fix                                              |
|----------------------------------|--------------------------------------------------|
| Camera drifts between clips      | Add `Spatial Continuity Lock` section, restate anchor geography |
| Camera dissolves between shots   | Add `(HARD CUT)` after each shot's camera line   |
| Camera ignores stated move       | Move verb to start of sentence, remove adjectives before it |
| Camera does extra moves          | Specify ONE primary move + endpoint only         |
| Wide → close without transition  | Add intermediate shot OR explicit cut marker    |
| Pan becomes whip / shake         | Add `(smooth, controlled)` qualifier             |
| Push-in becomes crash-zoom       | Specify `slow` and add `(no shake)`              |
| Dutch angle requested but not delivered | Add `(tilted horizon, 15-20° roll)`         |

---

## Lens Vocabulary

Lens affects perspective and depth compression. State it when it matters:

| Lens          | Effect                                              | Use Case                  |
|---------------|-----------------------------------------------------|---------------------------|
| **14mm ultra-wide** | Distortion, exaggerated depth                | Horror, dream, POV action |
| **24mm wide** | Natural wide, slight distortion                     | Establishing, action      |
| **35mm**      | Standard wide, natural perspective                  | Documentary, UGC          |
| **50mm**      | "Normal" human eye perspective                      | Portrait, dialogue        |
| **85mm**      | Portrait lens, slight compression                   | Beauty, interview         |
| **135mm telephoto** | Strong compression, isolated subject          | Voyeur, surveillance, beauty |
| **200mm+**    | Extreme compression, flat planes                    | Sports, distant subject   |
| **Macro**     | Life-size reproduction of small object              | Texture, detail, product  |

**Default**: omit lens unless the shot REQUIRES it. Specifying lens constrains the model — use it as a precision tool.

---

## Composite Camera Prompts (Worked Examples)

### Example 1 — Slow Reveal Product

```text
locked medium shot of perfume bottle on black acrylic,
label preserved exactly,
3s hold — no movement,
3-6s: slow push-in from medium to close-up on label detail,
6-10s: macro ECU of glass texture, condensation visible,
10-12s: hold on macro,
12-15s: pull back to wide, bottle exits frame (HARD CUT TO BLACK)
```

### Example 2 — POV Handheld Pursuit

```text
POV from character chasing subject through narrow alley,
handheld — visible shake, organic movement,
character breathing audible,
eye-line locked on subject 3 meters ahead,
wet walls, tungsten practical lights passing frame left to right,
no face visible (POV only — DO NOT show protagonist face)
15s (HARD CUT TO BLACK)
```

### Example 3 — Dialogue Two-Shot

```text
two-shot over-the-shoulder from character A framing character B,
locked frame — no movement,
warm practical key from frame right,
character A out of focus in foreground (shoulder + back of head),
character B in focus mid-frame, lips moving, natural micro-gestures,
diegetic room tone, dialogue audio mix
8s (HARD CUT)
```

---

## Cross-Model Compatibility

| Model          | Reads `push-in`? | Reads `(HARD CUT)`? | Reads `(ONE-TAKE)`? | Notes                              |
|----------------|------------------|---------------------|---------------------|------------------------------------|
| Seedance 2.0   | Yes              | Yes (as cut fence)  | Yes                 | Best with explicit endpoint        |
| Veo 3.1 Lite   | Yes              | Partial             | Yes                 | Verbose single-move prompts best   |
| Kling 3.0      | Yes              | Yes                 | Yes                 | Strong on handheld / POV           |
| Pixazo Seedance| Yes              | Yes                 | Yes                 | Same syntax as Jimeng              |

---

## Reference

- dexhunter/seedance2-skill — `SKILL.md` — "Camera Language Reference" section
- Emily2040/seedance-2.0 — v5.5.2 — `references/multishot-grammar.md` + `references/shot-list-continuity.md`
- s2s internal — `references/cinematic-composition-vocabulary.md` (19 cinematic styles, complementary vocabulary)