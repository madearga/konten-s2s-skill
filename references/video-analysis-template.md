# Video Analysis Template — 10-Section Fill-In

Template for `/s2s analyze`. Fill each section based on frame-by-frame analysis of the input video.

---

## Section 1: CLASSIFICATION

```markdown
📋 CLASSIFICATION
Category: [UGC / Branding / Education / Entertainment]
Subtype: [e.g., "UGC selfie POV skincare review"]
Region: [Indonesia / Global / East Asia / West]
Duration: [X]s
Platform: [TikTok 9:16 / Instagram 4:5 / YouTube 16:9]
Hook Type: [product-first / emotion-first / curiosity-gap / challenge / trend-ride]
Hook Score: [1-10] — [1 sentence reasoning]
```

---

## Section 2: FORMAT DECLARATION

```markdown
📐 FORMAT
FORMAT: [DURATION]s / [SINGLE CONTINUOUS | MULTI-CUT] / [N] BEATS / [TONE LABEL]
```

Duration → Beat count guide:
| Duration | Beats | Per Beat |
|----------|-------|----------|
| 1-5s | 1-2 | 1-3s |
| 5-10s | 2-3 | 2-4s |
| 10-20s | 3-6 | 2-5s |
| 20-45s | 4-8 | 3-6s |
| 45-90s | 6-12 | 4-8s |
| 90s-3m | 8-20 | 5-10s |

---

## Section 3: PIPELINE RECOMMENDATION

```markdown
🔧 PIPELINE RECOMMENDATION
Primary: [model] — [reason]
  Cost: ~$[X] | Duration: [X]s per clip | Limit: [notes]

Alternatives:
  - [model 2] — [when to use]
  - [model 3] — [when to use]

Chaining (if >15s): [N] clips → [method]
```

Decision matrix:
| Condition | Pipeline |
|-----------|----------|
| Human face visible | Kling 3.0 |
| Product only, no face | Seedance 2.0 R2V |
| Multi-shot narrative | Seedance 2.0 9-Panel |
| Short test/draft | Seedance 2.0 Fast |
| UGC selfie ≤8s | Veo 3.1 Lite |
| Character consistency | Seedance + character-ref |

---

## Section 4: 5-PART PROMPT SPINE (Per Beat)

Template per beat:

```
BEAT [N]: "[NAME]" — [start]-[end]

SUBJECT:
[Physical description — age, ethnicity, skin tone, hair, clothing, product.
"Indonesian woman, mid-20s, warm tan skin, cream cotton t-shirt,
holding pastel pink pump bottle with white cap"]

ACTION:
[Sequential verbs, present tense. "picks up bottle → unscrews pump →
squeezes cream → applies to cheek in upward strokes → shows label to camera"]

CAMERA:
Shot: [EWS / WS / MS / MCU / CU / ECU / macro]
Movement: [static / handheld / dolly / tracking / push-in / pull-back / whip-pan]
Angle: [eye level / low / high / bird's eye / POV / over-shoulder / Dutch]
Lens: [focal length]mm

STYLE:
Lighting: [source] from [direction], [quality], [temperature]K
Grade: [warm neutral / cool blue / magenta / earthy gold / desaturated]
Texture: [film grain / clean digital / iPhone native / natural haze]
Background: [description with depth]

CONSTRAINTS:
[Ban 3-5 items]. [Duration]s. [Aspect ratio].
```

---

## Section 5: NAMED BEATS WITH TIMELINE

```markdown
⏱️ BEAT TIMELINE

BEAT 1: "[NAME]" — 0:00-0:XX
  Transition: [Opening / Match cut / Cut on action / Whip pan / Hard cut / Continuous]
  Camera: [Shot], [lens]mm, [movement]. [Action detail].
  SFX: [sound cues]
  On-screen text: "[text]" — [style] (or "none")
  Product visible: [YES/NO] — [position, label facing?]

[... repeat for each beat ...]
```

Beat naming: narrative name, not "Beat 1". Examples:
- "The Scroll Stop", "The First Pump", "The Glow Reveal", "The CTA Frame"
- "The Discovery", "The First Bite", "The Proud Moment", "The Clean Exit"

---

## Section 6: TEXT OVERLAY ANALYSIS

```markdown
📝 TEXT OVERLAYS

[N]. Text: "[exact text]"
  Font: [Impact / serif / sans-serif / handwritten / bold condensed]
  Color: [white / gold / black / custom]
  Stroke: [black stroke / no stroke / drop shadow / glow]
  Position: [center / lower-third / top / full-screen]
  Animation: [fade / pop / static / typewriter / slide / bounce]
  Timing: [X]s → [Y]s
  Emotion: [urgency / playful / informative / hype / soft sell]
```

Skip if no text overlays detected.

---

## Section 7: SCENE BIBLE

```markdown
📖 SCENE BIBLE

LIGHTING:
  Time: [time of day]
  Source: [window / lamp / ring light / phone flash]
  Direction: [camera-left / camera-right / overhead / behind]
  Quality: [soft diffused / hard direct / mixed]
  Temperature: [K value]

COLOR PALETTE:
  Dominant: [color 1] + [color 2] + [color 3]
  Grade: [warm neutral / cool / etc.]
  Direction: [slight warm push / desaturated / high contrast]

SUBJECT APPEARANCE (consistent across all beats):
  Ethnicity: [e.g., Southeast Asian / Indonesian]
  Skin tone: [e.g., warm tan with golden undertone]
  Hair: [style, color, length]
  Clothing: [specific items, colors, fabrics]
  Distinguishing features: [earrings, watch, nails, etc.]

CAMERA STYLE:
  Device: [iPhone / Android / DSLR / unknown]
  Style: [handheld selfie / stabilized / tripod / gimbal]
  Shake: [none / micro / visible]
  Filter: [none detected / beauty filter / color grade]

ENVIRONMENT:
  Location: [bedroom / bathroom / kitchen / outdoor / car / studio]
  Fixed elements: [furniture, props that stay in all beats]
  Key details: [materials, textures, specific items]

PRODUCT CONTINUITY (if product detected):
  Name: [from packaging or best guess]
  Shape: [bottle / tube / jar / box / pouch]
  Size: [palm-sized / finger-length / fist-sized]
  Primary color: [exact hex or description]
  Label facing camera in beats: [N, N, N]
  Label NOT facing in beats: [N, N]
  Consistency: [CONSISTENT / INCONSISTENT at beat N]
```

---

## Section 8: UGC INDONESIA CONTEXT

```markdown
🇮🇩 INDONESIA UGC CONTEXT

Audience: [target demographic]
Setting authenticity: [matches Indonesian home? details]
Skin tone accuracy: [matches demographic?]
Cultural cues: [batik, local brands, Bahasa text, specific items]
Market fit: [would this work on ID TikTok? yes/no + reasoning]
Improvement for ID market: [1-2 specific tweaks]
```

Skip if video is not Indonesian/Southeast Asian.

---

## Section 9: PROMPT ENGINEERING INSIGHT

```markdown
💡 ANALYSIS

Hook strategy: [type]
  Effectiveness: [HIGH/MEDIUM/LOW] — [why]

UGC authenticity cues:
  - [cue 1]
  - [cue 2]
  - [cue 3]

Realism cues:
  - [cue 1]
  - [cue 2]

What to IMPROVE:
  1. [fix]
  2. [fix]
  3. [fix]

What to KEEP:
  1. [element]
  2. [element]
```

---

## Section 10: REVERSE-ENGINEERED PROMPT

### 10A: Generic

```markdown
📝 GENERIC PROMPT

FORMAT: [declaration]
SUBJECT: [description]
PRODUCT: [if applicable]
ENVIRONMENT: [location + lighting]
MOOD: [tone]
CAMERA ID: [device + style]
COLOR: [grade]

[Beat-by-beat prompt]

CAMERA: [overall]
CONSTRAINTS: [bans]. [Duration]s. [Aspect].
AUDIO: [strategy]
ON-SCREEN TEXT: [overlays]
```

### 10B: Seedance R2V (if --seedance or product detected)

```markdown
🎬 SEEDANCE 2.0 R2V PROMPT

Use @[storyboard ref] as the authoritative director-approved storyboard blueprint...
Use @[product ref] as the authoritative product reference...

[SUBJECT]
[ACTION]
[CAMERA]
[STYLE]
[CONSTRAINTS]
[EMOTIONAL GUIDANCE]
[AUDIO]
[PANEL BEATS]
[NEGATIVE PROMPTS]
```

Use the full Seedance motion prompt structure from `references/seedance-motion-prompt.md`.

---

## Pipeline Feeder Check (Auto)

After all 10 sections, check:

```markdown
🔗 PIPELINE FEEDER

Product detected: [YES/NO]
Human subject: [YES/NO]
Scene Bible complete: [YES/NO]
Visual data sufficient: [YES/NO]

→ [If all YES]: Auto-brief: "[1-2 sentence brief]"
→ [If partial]: Missing: [what]. Provide [info] to proceed.
→ [If NO]: Cannot auto-feed. Manual engineering recommended.
```

Auto-brief format:
`"[Subject], [action summary], [duration]s, [camera], [lighting], [environment], [tone], [product]"`

---

## Quick Scan Override (Sections 1-5 only)

When `--quick` flag is used:
- Section 1: Full classification
- Section 2: Format declaration
- Section 3: Pipeline recommendation
- Section 4: Condensed 5-part spine (per beat, not per sub-section)
- Section 5: Beat timeline (timestamps only, no SFX/text detail)
- Skip sections 6-10

---

## Frame Extraction Reference

| Duration | Frames | Method |
|----------|--------|--------|
| 1-5s | 3 | uniform |
| 5-15s | 5 | uniform |
| 15-30s | 8 | uniform |
| 30-60s | 12 | uniform |
| 60-90s | 15 | scene detection |
| 90s-3m | 20 | scene detection |
| 3m+ | 25 | scene + uniform |

ffmpeg commands:
```bash
# Uniform extraction
ffmpeg -i input.mp4 -vf "fps=1/[interval]" -frames:v [count] -q:v 2 frame_%03d.jpg

# Scene detection (30s+)
ffmpeg -i input.mp4 -vf "select=gt(scene\,0.3)" -vsync vfr -q:v 2 frame_%03d.jpg
```
