# Dexhunter Patterns for Ads — 12-Pattern Library Annotated

**Source:** Adapted from `dexhunter/seedance2-skill` (MIT) — 12 numbered patterns from `SKILL.md`. Annotated for advertising / commercial / e-commerce use cases.

Use with `/s2s ads` command. This reference is the companion doc — the command spec lives at `commands/ads.md`.

---

## Why This Exists

dexhunter's SKILL.md documents 12 numbered patterns for Seedance 2.0 prompt writing. The patterns are general-purpose, but for **ads** specifically, certain patterns dominate:

- **Pattern 9** (E-commerce / Product Showcase) — the workhorse for product ads
- **Pattern 3** (Creative Template / FX Replication) — for high-energy brand content
- **Pattern 6** (Music Beat-Sync) — for TikTok/Reels beat-driven ads
- **Pattern 12** (Video Fusion / Continuation) — for multi-cut ad assembly

This file extracts and annotates these patterns with ad-specific guidance.

---

## The 12 Patterns (dexhunter numbering)

For reference — all 12 patterns from dexhunter SKILL.md:

| # | Pattern Name | Primary Ad Relevance |
|---|--------------|----------------------|
| 1 | Character Consistency | Brand mascot / host continuity |
| 2 | Camera Movement Replication | Replicate competitor's ad style |
| 3 | Creative Template / FX Replication | ⭐ Brand transitions / VFX |
| 4 | Video Extension | Ad continuation / cut-down versioning |
| 5 | Video Editing (Modify Existing) | Update existing ad creative |
| 6 | Music Beat-Sync Montage | ⭐ TikTok-style beat ads |
| 7 | Dialogue / Voice Acting | VO-led ads (testimonial, explainer) |
| 8 | One-Take / Long Take | Cinematic single-shot brand films |
| 9 | E-commerce / Product Showcase | ⭐ **Default for product ads** |
| 10 | Science / Educational Content | Brand education / how-it-works |
| 11 | AI Drama / Manga | Brand storytelling / narrative arc |
| 12 | Video Fusion / Continuation | ⭐ Multi-cut ad assembly |

---

## Pattern 9 — E-commerce / Product Showcase (DEFAULT FOR ADS)

**dexhunter spec:**

```text
Deconstruct the reference image. Static camera. Hamburger suspended and
rotating mid-air. Ingredients gently and precisely separate while
maintaining shape and proportion. Smooth motion, no extra effects.
Hamburger splits apart — golden sesame bun top, fresh green lettuce,
dewy red tomato slices, two thick juicy beef patties with melting golden
cheddar cheese, and soft bun base — all slowly descend and perfectly
reassemble into a complete deluxe double cheeseburger. Throughout,
cheese continues to melt and drip slowly, lettuce and tomato dewdrops
glisten, maintaining ultimate appetizing food aesthetics.
```

**Ad-specific adaptation:**

- Replace "hamburger" with the user's product
- Specify material / surface / color verbatim (preserves identity)
- Add macro detail beats (texture, label, condensation if applicable)
- Add lifestyle context beat (in-use / contextual) before closing
- Specify closing frame (logo / brand text fades in last 1s)

**Template:**

```text
@Image1's [product] as the hero (preserve [color/material/surface] exactly).

SCENE: [studio / lifestyle / in-use].
DURATION: [N]s, [aspect ratio].

[3s time-segmented beats — see "Time Segmentation" below]
CAMERA: [orbit / push-in / rack focus / static with rotation]
LIGHT: [motivated practical / studio key + rim / natural ambient]
STYLE: [cinematic / UGC / commercial-grade]
AUDIO: [BGM ref / product SFX / no music]
```

---

## Pattern 3 — Creative Template / FX Replication

**dexhunter spec:**

```text
Replace @Video1's character with @Image1. @Image1 as the first frame.
Character puts on VR sci-fi glasses. Reference @Video1's camera work —
close orbit shot transitions from third-person to character's subjective
POV. Travel through the VR glasses into @Image2's deep blue universe.
Several spaceships shuttle toward the distance. Camera follows ships
into @Image3's pixel world. Low-altitude flyover of pixel mountains
where trees grow procedurally. Then upward angle, rapid shuttle to
@Image4's pale green textured planet, camera skims the planet surface.
```

**Ad-specific adaptation:**

- Use `@Video1` as **competitor ad / brand reference / style template**
- Keep `@Image1` (user's product) as the hero inserted into the template
- Specify which elements to replicate: camera? VFX? Transitions? Color grading?

**Template:**

```text
@Video1's [camera work / VFX / transitions / color grading].
@Image1 as the hero [product] replaces [competitor's product in @Video1].

Replicate:
- Camera: [specific move from @Video1]
- VFX: [specific effect from @Video1]
- Transitions: [cut style from @Video1]
- Color: [color grade from @Video1]

Duration: [N]s
Scene: [user's product context]
```

---

## Pattern 6 — Music Beat-Sync

**dexhunter spec:**

```text
@Image1 @Image2 @Image3 @Image4 @Image5 @Image6 @Image7 — match the
keyframe positions and overall rhythm of @Video1 for beat-synced cuts.
Characters should have more dynamic movement. Overall visual style more
dreamlike with strong visual tension. Adjust shot sizes and add lighting
changes based on music and visual needs.
```

**Ad-specific adaptation:**

- Use `@Audio1` for BGM (recommended over `@Video1` for ads)
- Specify cut density by BPM
- Per-beat shot changes (subject angle, lighting, scale)
- Product must remain visible in every cut

**BPM-to-cut-density rule:**

| BPM Range   | Cut Every | Use For                                |
|-------------|-----------|----------------------------------------|
| 60-90       | 4-8s      | Cinematic / luxury / slow build        |
| 90-120      | 2-4s      | Lifestyle / mid-energy                  |
| 120-140     | 1-2s      | TikTok / Reels / youth / energetic      |
| 140+        | 0.5-1s    | Hyper-cut / strobe / hype              |

**Template:**

```text
@Image1's [product] as the hero. Match cuts to @Audio1's beat positions.
BPM: [N], cut every [N]s.

[Per-beat beats — 0-1s, 1-2s, 2-3s, ...]

Visual variations per cut:
- Subject rotation: [X°]
- Camera angle: [orbit X° / push-in / pull-back]
- Lighting shift: [cool → warm / dark → bright]
- Shot size: [wide → close → macro]
- Depth of field: [shallow on odd beats, deep on even]

CONSTRAINTS:
- Product visible in every cut
- @Audio1 audible throughout
- Cut rhythm locked to audio, not subject action
```

---

## Pattern 12 — Video Fusion / Multi-Cut Ad Assembly

**dexhunter spec:**

```text
Video1中由粒子组成的马逐渐具象化，粒子变密，逐渐过渡到视频2，
视频2中的马在奔跑过程中逐渐变为视频3，并逐渐消散，画面唯美，
背景音是马蹄声和科技感粒子音效。
```

(translated: particle horse in Video1 gradually materializes into Video2's running horse, which dissolves into Video3 — beautiful aesthetic, hooves + tech particle SFX)

**Ad-specific adaptation:**

- Use `@Image1, @Image2, @Image3` as different product angles / lifestyle shots
- Specify transition type (match cut / whip pan / dissolve / particle FX)
- Often combined with Pattern 6 (Beat-Sync) for music-driven assembly

**Template:**

```text
@Image1, @Image2, @Image3 — fuse into one continuous ad sequence.

SEQUENCE:
0-3s:    @Image1 — [role in sequence]
3-6s:    @Image2 — [role]
6-9s:    @Image3 — [role]
9-12s:   [back to Image1 or new Image]
12-15s:  [closing]

TRANSITIONS:
- Between 3-6s: [match cut on product geometry]
- Between 6-9s: [whip pan to handheld UGC]
- Between 9-12s: [dissolve to/from macro]

AUDIO: BGM @Audio1, peak intensity at [N-Ns], taper at [N-Ns].
```

---

## Pattern 1 — Character Consistency (Brand Mascot / Host)

**Ad-specific use:** Brand mascot continuity across multiple ad variations.

**Template:**

```text
@Image1's character as the brand mascot / host (preserve identity exactly across all cuts).

[Multiple short segments stitched in post — each segment 4-15s with same @Image1 character anchor]

Scene: [consistent setting across all segments]
Voice: [consistent voice @audio1]
```

---

## Pattern 2 — Camera Movement Replication

**Ad-specific use:** Replicate competitor's ad camera style.

**Template:**

```text
Reference @Video1's camera movement exactly.
@Image1's [product] as the subject.

Apply @Video1's camera pattern to new product / new setting.
Preserve: camera angle, lens, movement type, transition style.
Change: subject (product), setting, color palette (optional).
```

---

## Pattern 4 — Video Extension (Ad Cut-Down Versioning)

**Ad-specific use:** Create 6s / 15s / 30s cut-downs from a 60s master.

**Template:**

```text
@Video1 is the master ad (60s).

Extract the [first 6s / last 8s / specific beat 0:15-0:21] as a cut-down version.
Match @Video1's visual style exactly: lighting, color, camera, transitions, audio.

Cut-down duration: [N]s
Must work standalone (no context required).
```

---

## Pattern 7 — Dialogue / VO (Testimonial / Explainer)

**Ad-specific use:** Customer testimonial, founder story, how-it-works explainer.

**Template:**

```text
[Speaker]: "[exact testimonial line]"
Tone: [sincere / excited / contemplative / confident]

Scene: [matching speaker context — home / office / outdoors]
Shot: medium close-up, locked frame, natural micro-gesture
Audio: clean VO + ambient room tone
Cut: alternate speaker (B-roll product) every 4-8 words
```

---

## Pattern 8 — One-Take / Long Take (Cinematic Brand Film)

**Ad-specific use:** Apple / Nike / Aesop style single-shot cinematic brand films.

**Template:**

```text
ONE-TAKE / ONER — no cuts, no dissolves.

Camera path: [start A → travel → reveal B → travel → end C]
Subject path: [carries product through space]
Duration: [15s full shot]

Spatial lock:
- Screen direction: locked
- Anchor geography: [specific landmarks]
- Lighting: continuous motivated practical
```

---

## Time Segmentation (dexhunter 3s default)

dexhunter defaults to **3-second time segments** for prompts > 8s:

```text
0-3s:  [opening]
3-6s:  [mid-section development]
6-10s: [climax or key action]
10-15s: [resolution / closing]
```

s2s default is 5s, but for ads (especially beat-sync), **3s is preferred** for tighter pacing.

---

## Reference System for Ads (`@` Syntax)

Ad-specific `@` role assignments:

| Role               | Ad Use                                          |
|--------------------|-------------------------------------------------|
| `@Image1`          | Hero product (preserve identity)                |
| `@Image2`          | Product lifestyle / in-use context              |
| `@Image3`          | Product detail / texture / macro                |
| `@Image4`          | Brand asset / logo / typography                 |
| `@Video1`          | Competitor ad / brand style reference           |
| `@Video2`          | Camera movement template                        |
| `@Video3`          | Sound effects / audio bed source                |
| `@Audio1`          | BGM reference                                   |
| `@Audio2`          | VO / testimonial voice                          |

**Multi-role single-source pattern:**
```text
reference @Video1's camera movement,
reference @Video1's editing rhythm,
reference @Video1's color grading
```

---

## Output Spec Compatibility

| Backend          | Read 3s segments? | Read `@` syntax? | Read NEGATIVE block? | Best For                |
|------------------|-------------------|------------------|----------------------|-------------------------|
| Seedance 2.0     | ✅                | ✅               | ✅                   | All patterns             |
| Veo 3.1 Lite     | ✅                | Partial (use prose) | ✅               | Pattern 3, 8, 9         |
| Kling 3.0        | ✅                | ✅               | ✅                   | Pattern 6, 9             |
| Pixazo Seedance  | ✅                | ✅               | ✅                   | All patterns             |

---

## Common Mistakes for Ads

1. **Vague product identity** — "a can of soda" instead of "blue aluminum can with condensation, white logo, 330ml"
2. **Too many camera moves** — orbit + push-in + pan in same 15s = chaos. ONE primary move.
3. **Music baked in** — locks post-production flexibility. Specify BGM ref + generate silent, layer in post.
4. **Brand text in mid-clip** — Seedance hallucinates text. Brand text ONLY in final 1s closing frame.
5. **Wrong aspect ratio** — TikTok = 9:16, YouTube pre-roll = 16:9, Instagram feed = 1:1.
6. **Duration outside Seedance limits** — single clip 4-15s. For 30-60s, split into multiple clips.
7. **Generic anti-slop** — must be specific: "no plastic surface, no waxy look" beats "no bad quality".

---

## Reference

- `dexhunter/seedance2-skill` — `SKILL.md` — 12-pattern library source (MIT)
- s2s internal — `references/seedance-reference-syntax.md` — `@`-role binding system
- s2s internal — `references/seedance-camera-language.md` — orbit / push-in vocabulary
- s2s internal — `references/seedance-motion-vocabulary.md` — anti-slop lexicon
- s2s internal — `commands/ads.md` — `/s2s ads` command spec
