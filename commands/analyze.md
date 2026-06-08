# /s2s analyze — Video Reverse-Engineering Command

Analyzes an existing video (TikTok, Instagram, competitor content) frame-by-frame and reverse-engineers it into production-ready prompts. Works as **standalone** or as **Step 0** feeding into the s2s pipeline.

---

## Trigger

- Manual: `/s2s analyze [video-path]`
- Manual with flags: `/s2s analyze --quick [video-path]` or `/s2s analyze --seedance [video-path]`
- Auto-detect: "analyze this video", "reverse engineer this TikTok", "break down this video", "extract prompt from video", "analisa video ini", "bikin prompt dari video ini"

---

## Modes

| Mode | Flag | Output | When to Use |
|------|------|--------|-------------|
| **Full Analysis** | (default) | 10-section breakdown + reverse-engineered prompt | Deep competitor study |
| **Quick Scan** | `--quick` | Classification + pipeline rec + beat list (sections 1-5 only) | Fast triage |
| **Seedance Ready** | `--seedance` | Full analysis + auto-generated Seedance 2.0 R2V motion prompt | Direct video generation |

---

## Input

**Required:**
- Video file path (mp4, mov, webm) — local file or URL

**Optional:**
- `--frames N` — extract N key frames (default: auto-calculate based on duration)
- `--output PATH` — save analysis to specific path (default: working directory)
- `--lang ID` — analysis language (default: match user's language, prompts always English)
- `--no-pipeline` — skip pipeline auto-suggestion at the end

---

## Frame Extraction Strategy

Before analysis, extract key frames using ffmpeg:

```
Video duration → Frame count → Extraction method

1-5s    → 3 frames   → uniform split
5-15s   → 5 frames   → uniform split
15-30s  → 8 frames   → uniform split
30-60s  → 12 frames  → uniform split
60-90s  → 15 frames  → uniform split + scene detection
90s-3m  → 20 frames  → scene detection (ffmpeg scene filter)
3m+     → 25 frames  → scene detection + uniform fallback
```

Use `ffmpeg -i [input] -vf "fps=1/[interval]" -frames:v [count] -q:v 2 [output_%03d.jpg]`

For scene detection (30s+): `ffmpeg -i [input] -vf "select=gt(scene\,0.3)" -vsync vfr -q:v 2 [output_%03d.jpg]`

Each extracted frame is analyzed via vision (read tool) to build the beat breakdown.

---

## Output Structure (Full Analysis — 10 Sections)

### Section 1: CLASSIFICATION

```
📋 CLASSIFICATION
Category: [UGC / Branding / Education / Entertainment]
Subtype: [specific — e.g., "UGC selfie POV skincare review", "Branding cinematic product reveal"]
Region: [Indonesia / Global / East Asia / West] — detected from environment, skin tone, language, text
Duration: [X]s
Platform: [TikTok 9:16 / Instagram 4:5 / YouTube 16:9]
Hook Type: [product-first / emotion-first / curiosity-gap / challenge / trend-ride]
Hook Score: [1-10] — [reasoning in 1 sentence]
```

Classification Rules:
- **UGC**: selfie POV, handheld shake, natural lighting, authentic setting, no professional equipment
- **Branding**: stabilized camera, studio/controlled lighting, polished transitions, logo/title cards
- **Education**: host facing camera, product demo, lower-thirds, step-by-step, voiceover
- **Entertainment**: cosplay, skit, meme, trend, dance, comedy

### Section 2: FORMAT DECLARATION

```
📐 FORMAT
FORMAT: [DURATION]s / [SINGLE CONTINUOUS | MULTI-CUT] / [N] BEATS / [TONE LABEL]

Beat count guide:
  1-5s    → 1-2 beats
  5-10s   → 2-3 beats
  10-20s  → 3-6 beats
  20-45s  → 4-8 beats
  45-90s  → 6-12 beats
  90s-3m  → 8-20 beats (group into ACTS: Act 1, Act 2, Act 3)

Videos 60s+: group beats into ACTS (2-4 beats per act)
Videos under 60s: flat beat list — no act structure
```

### Section 3: PIPELINE RECOMMENDATION

```
🔧 PIPELINE RECOMMENDATION
Primary: [model name] — [reason]
  Cost: ~$[X] | Duration: [X]s per clip | Limit: [notes]

Alternatives:
  - [model 2] — [when to use instead]
  - [model 3] — [when to use instead]

Chaining strategy (if video > 15s):
  [X]s total → [N] clips needed → [chaining method]
```

Pipeline Decision Matrix:

| Condition | Primary Pipeline | Reason |
|-----------|-----------------|--------|
| Human face visible | **Kling 3.0** | Seedance face-blocks per ByteDance policy |
| Product only, no face | **Seedance 2.0 R2V** | Best product preservation |
| Multi-shot narrative | **Seedance 2.0 9-Panel Storyboard** | Panel-by-panel control |
| Short test/draft | **Seedance 2.0 Fast** | 480p, fast iteration |
| UGC selfie style ≤8s | **Veo 3.1 Lite** | Alternative, built-in audio possible |
| Character consistency needed | **Seedance 2.0 + character-ref** | Identity lock via reference sheet |

Platform Pricing Reference (per clip):
| Platform | 5s | 10s | 15s |
|----------|-----|------|------|
| Seedance 2.0 Fast | ~$0.10 | ~$0.20 | ~$0.30 |
| Seedance 2.0 Standard | ~$0.20 | ~$0.40 | ~$0.60 |
| Seedance 2.0 R2V | ~$0.25 | ~$0.50 | ~$0.75 |
| Kling 3.0 | ~$0.15 | ~$0.30 | ~$0.45 |
| Veo 3.1 Lite | ~$0.05 | ~$0.10 | ~$0.15 |
| Mitte.ai gateway (Seedance) | ~$0.10 | ~$0.20 | ~$0.30 |

Exchange rate: 1 USD ≈ Rp 17,975

### Section 4: 5-PART PROMPT SPINE (Per Beat)

For EACH detected beat, output:

```
BEAT [N]: "[NAME]" — [start]-[end]

SUBJECT:
[Who/what in frame. Age, ethnicity, skin tone, hair, clothing, product description.
Be PHYSICALLY specific — "Indonesian woman, mid-20s, warm tan skin, dark brown hair in messy bun,
oversized cream cotton t-shirt, holding pastel pink pump bottle with white cap"
NOT "woman holding skincare"]

ACTION:
[Sequential verb phrases, present tense. Linear: "A then B" not "A while B".
E.g., "picks up bottle from pillow → unscrews pump → squeezes cream onto fingers →
rubs hands together → applies to right cheek in upward strokes → holds bottle up showing label"]

CAMERA:
Shot: [extreme wide / wide / medium / medium close-up / close-up / extreme close-up / macro]
Movement: [static / handheld / dolly / tracking / push-in / pull-back / whip-pan / tilt / crane]
Shake: [none / micro-shake / visible shake / stable]
Angle: [eye level / low angle / high angle / bird's eye / POV / over-shoulder / Dutch]
Lens: [focal length]mm — [12mm ultra-wide / 24mm wide / 35mm phone-normal / 50mm portrait / 85mm telephoto / 100mm macro]

STYLE:
Lighting: [source] from [direction], [quality], [color temperature]K
Grade: [warm neutral / cool blue / magenta-pink / earthy gold / desaturated / high contrast / flat]
Texture: [film grain / clean digital / VHS / iPhone native / ring light / natural haze]
Background: [description with depth cues — "beige wall, plant bokeh blur left, window light spill right"]

CONSTRAINTS:
[Ban list 3-5 items]: e.g., No music. No text overlays. No face (hands-only). No professional camera. No backdrop.
Duration: [X]s. Aspect: 9:16 vertical.
```

### Section 5: NAMED BEATS WITH TIMELINE

```
⏱️ BEAT TIMELINE

BEAT 1: "[NAME]" — 0:00-0:XX
  Transition: [Opening / Match cut / Cut on action / Whip pan / Reaction cut / Hard cut / Continuous]
  Camera: [Shot size], [focal length]mm, [movement]. [Action description with visual detail].
  SFX: [sound cues — what you hear or should be added]
  On-screen text: "[exact text]" — [font/color/position] (if present, else "none")
  Product visible: [YES/NO] — [position in frame, label facing camera?]

BEAT 2: "[NAME]" — 0:XX-0:YY
  Transition: [...]
  Camera: [...]
  SFX: [...]
  On-screen text: [...]
  Product visible: [...]

[...continue for ALL beats...]
```

Beat naming rules:
- Every beat needs a NARRATIVE name (not "Beat 1")
- Names convey emotional/story function: "The Scroll Stop", "The First Pump", "The Glow Reveal", "The CTA Frame"
- For 60s+ videos with ACTS: "ACT 1 / BEAT 1: The Hook"

### Section 6: TEXT OVERLAY ANALYSIS

Only if text overlays detected in any beat:

```
📝 TEXT OVERLAYS

[N]. Text: "[exact text]"
  Font: [Impact-style / serif / sans-serif / handwritten / bold condensed]
  Color: [white / gold / black / neon green / custom]
  Stroke: [black stroke / no stroke / drop shadow / glow outline]
  Position: [center / lower-third / top-third / full-screen / split]
  Animation: [fade in / pop / static / typewriter / slide / bounce]
  Timing: [X]s → [Y]s ([duration]s)
  Emotion: [urgency / playful / informative / hype / soft sell]
```

### Section 7: SCENE BIBLE (5 Continuity Variables)

```
📖 SCENE BIBLE

LIGHTING: [time of day], [source] from [direction], [quality], [color temp]K
  e.g., "mid-morning, large window camera-left, soft diffused daylight, 4800K warm white"

COLOR PALETTE: [2-3 dominant colors] + [grade direction]
  e.g., "warm beige + soft pink + muted gold → warm neutral grade, slight desaturation"

SUBJECT APPEARANCE: [consistent across all beats]
  e.g., "Indonesian woman, mid-20s, warm tan skin with golden undertone, dark brown wavy hair in low bun,
  small gold hoop earrings left ear, no watch, short natural nails with clear polish,
  oversized cream cotton t-shirt (visible in wide shots)"

CAMERA STYLE: [consistent through video]
  e.g., "iPhone handheld selfie POV, micro-shake, occasional autofocus breathing,
  ring light catchlight in eyes, native camera app (no filter), 35mm equivalent"

ENVIRONMENT: [fixed elements across all beats]
  e.g., "Indonesian middle-class bedroom, beige wall, white linen bedsheets (slightly wrinkled),
  wooden nightstand with phone charger + water glass + small succulent,
  window with thin white curtain camera-left, warm rattan pendant light above"
```

Product Continuity Lock (if product detected):
```
PRODUCT CONTINUITY:
  Name: [product name from packaging or best guess]
  Shape: [bottle / tube / jar / box / pouch / bar]
  Size: [relative to hand — palm-sized / finger-length / fist-sized]
  Primary color: [exact — e.g., "pastel pink (#FFB6C1)"]
  Secondary color: [accent — e.g., "white cap (#FFFFFF)"]
  Label: [facing camera in beats: N, N, N — not facing: N, N]
  Orientation: [upright / tilted / horizontal]
  Key features: [pump / flip-cap / squeeze tube / twist / tear]
  Consistency: [CONSISTENT / INCONSISTENT at beat N — describe drift]
```

### Section 8: UGC INDONESIA CONTEXT

Only if video is identified as Indonesian or Southeast Asian:

```
🇮🇩 INDONESIA UGC CONTEXT

Audience: [target — e.g., "Indonesian moms 25-35", "Gen Z teens 13-19", "young pregnant women"]
Setting authenticity: [matches Indonesian home? — describe specific elements]
  e.g., "keramik lantai, jendela tanpa AC (kipas angin visible),
  merk skincare lokal di background shelf, handuk batik di hook"

Skin tone accuracy: [matches Indonesian demographic? — warm tan, golden undertone]
Cultural cues: [any Indonesian-specific elements — batik, local brands, Bahasa text, etc.]
Market fit: [would this work on Indonesian TikTok? — yes/no + reasoning]
Improvement for ID market: [1-2 specific tweaks to make it more relatable]
```

### Section 9: PROMPT ENGINEERING INSIGHT

```
💡 WHAT MAKES THIS WORK (or not)

Hook strategy: [product-in-2s / emotion-first / curiosity-gap / challenge / trend]
  Effectiveness: [HIGH/MEDIUM/LOW] — [why]

UGC authenticity cues:
  - [e.g., "handheld micro-shake throughout — feels real"]
  - [e.g., "natural window light, no ring light — authentic"]
  - [e.g., "wrinkled bedsheets, water glass on nightstand — lived-in"]
  - [e.g., "natural nails, no manicure — relatable"]

Realism cues:
  - [e.g., "autofocus breathing at 0:04 — smartphone native"]
  - [e.g., "skin pores visible in close-up — no beauty filter"]
  - [e.g., "dust motes in light beam — natural environment"]

What to IMPROVE:
  1. [specific actionable fix]
  2. [specific actionable fix]
  3. [specific actionable fix]

What to KEEP:
  1. [specific element worth preserving]
  2. [specific element worth preserving]
```

### Section 10: REVERSE-ENGINEERED PROMPT

Two output formats — generic AND Seedance R2V:

#### 10A: Generic Production Prompt

```
📝 REVERSE-ENGINEERED PROMPT (Generic)

FORMAT: [declaration]

SUBJECT: [full physical description]
PRODUCT: [name + description if applicable]
ENVIRONMENT: [location + lighting]
MOOD: [emotional tone]
CAMERA ID: [device + style]
COLOR: [grade]

BEAT 1: "[NAME]" — [timestamp]
[Shot size], [focal length]mm. [Action]. SFX: [...]

BEAT 2: "[NAME]" — [timestamp]
Transition: [...] [Shot size], [focal length]mm. [Action]. SFX: [...]

[all beats...]

CAMERA: [overall language]
CONSTRAINTS: [ban list]. [Duration]s. [Aspect ratio].
AUDIO: [strategy]
ON-SCREEN TEXT: [overlays if any]
```

#### 10B: Seedance R2V Motion Prompt (if `--seedance` flag or auto-detected product)

```
🎬 REVERSE-ENGINEERED PROMPT (Seedance 2.0 R2V)

Use @[storyboard ref] as the authoritative director-approved storyboard blueprint for the sequence.
Treat every storyboard panel as a consecutive shot within a single cinematic sequence.
Follow panel order exactly and do not invent alternative coverage.
Do not render the storyboard sheet itself.
[Exclude: panel borders, headers, text, labels, project card, director strip, style swatches, page layout]
Preserve camera placement, framing, lens intent, shot scale, character staging, screen direction,
environmental geography, prop placement, action choreography, continuity, and emotional escalation.

Use @[product ref] as the authoritative product reference.
Preserve the product exactly: same shape, colors, packaging, label orientation, proportions.
Product is the #1 visual anchor. Always face camera when held.
Do not stylize, simplify, or reinterpret product design.

[SUBJECT]
[1-2 sentences from beat analysis]

[ACTION]
[2-4 sentences — linear prose from beat action chains]

[CAMERA]
P## / [focal length]mm / [shot type] / [beat name]
[Camera move map: P01 push-in -> P02 static -> ...]

[STYLE]
[visual signature + lighting + grade + texture from Scene Bible]

[CONSTRAINTS]
[ban list from analysis]
[product continuity lock]
[UGC authenticity constraints]

[EMOTIONAL GUIDANCE]
Valence: [3-5 adjectives from beat emotions]
Arousal: [arc using L1-L5 scale]

[AUDIO]
[foley per beat with sound cues]

[PANEL BEATS]
P01: [Camera] [Action]. [Emotion]. [Audio].
P02: [Camera] [Action]. [Emotion]. [Audio].
[...all beats...]

[NEGATIVE PROMPTS]
No music. No logo. No text on screen. No watermark. No frame numbers. No subtitles. No voiceover.
No studio lighting. No white background. No catalog composition. No CGI look. No black bars.
```

---

## Auto-Pipeline Detection

After analysis completes, check if this video can feed into the s2s pipeline:

```
🔗 PIPELINE FEEDER CHECK

Can this video feed into /s2s pipeline for re-creation?
  Product detected: [YES/NO]
  Human subject detected: [YES/NO]
  Scene Bible complete: [YES/NO]
  Enough visual data for storyboard: [YES/NO]

→ If all YES:
  "This video can be re-created. Run:
   /s2s pipeline "[auto-generated brief from analysis]"
   Brief: "[1-2 sentence brief extracted from analysis]"

→ If partial:
  "Partial re-creation possible. Missing: [what's missing].
   Provide [missing info] and run /s2s pipeline."

→ If NO:
  "Cannot auto-feed into pipeline. Reason: [why].
     Manual prompt engineering recommended."
```

Auto-generated brief format:
```
"[Subject description], [action summary], [duration]s, [camera style],
 [lighting], [environment], [emotional tone], [product name if present]"
```

---

## Quick Scan Mode (`--quick`)

Output sections 1-5 only:
1. CLASSIFICATION (with hook score)
2. FORMAT DECLARATION
3. PIPELINE RECOMMENDATION
4. 5-PART SPINE (condensed — per beat, not per section)
5. NAMED BEATS WITH TIMELINE (timestamps only, no SFX/text detail)

No Scene Bible, no Insight, no Reverse-Engineered Prompt.

---

## Error Handling

| Situation | Behavior |
|-----------|----------|
| Video file not found | Error: "File not found at [path]. Check path and retry." |
| Video is audio-only (no frames) | Error: "No video stream detected. Cannot analyze audio-only files." |
| Video > 3 minutes | Warn: "Video exceeds 3min. Analysis may be less detailed. Consider trimming to key section." |
| Corrupted video | Error: "ffmpeg failed to extract frames. File may be corrupted." |
| Very short video (<2s) | Warn: "Very short clip. Beat count will be 1. Analysis limited." |
| No product detected | Skip product continuity lock. Pipeline feeder = NO (unless user provides product separately). |
| No human detected | Skip subject appearance in Scene Bible. Pipeline = Seedance R2V. |
| Multiple products | List all detected products. Ask which is primary for pipeline feeder. |

---

## Output File

Save analysis to: `[working-dir]/analysis/[video-name]-analysis.md`

Filename format: `[brand-or-video-name]-analysis.md`
E.g., `bumil-ugc-analysis.md`, `fisherprice-toy-analysis.md`

If `--seedance` flag: also save `[video-name]-seedance-motion.md` with just the motion prompt.

---

## Standalone vs Pipeline Integration

```
STANDALONE:
  /s2s analyze video.mp4
  → Output: 10-section analysis file
  → User reads, learns, applies manually

PIPELINE FEEDER (auto-detected):
  /s2s analyze video.mp4
  → Output: 10-section analysis + auto-generated brief
  → User copies brief → runs /s2s pipeline "[brief]"
  → Pipeline generates new storyboard + ref + motion from extracted brief

DIRECT SEEDANCE (--seedance flag):
  /s2s analyze --seedance video.mp4
  → Output: 10-section analysis + ready-to-paste Seedance motion prompt
  → User attaches storyboard + product images → generates video directly
```

---

## Cost Estimate

| Duration | Frames Extracted | Vision Analysis | Total ~ |
|----------|-----------------|----------------|---------|
| 5s | 3 | ~$0.01 | ~$0.01 |
| 15s | 5 | ~$0.02 | ~$0.02 |
| 30s | 8 | ~$0.03 | ~$0.03 |
| 60s | 12 | ~$0.05 | ~$0.05 |
| 90s | 15 | ~$0.06 | ~$0.06 |
| 180s | 20 | ~$0.08 | ~$0.08 |

(Free if using local vision model or Claude's built-in read tool)

---

## Related

- `../SKILL.md` — entry point + decision tree
- `storyboard.md` — Step 1 (forward direction — brief → storyboard)
- `motion.md` — Step 3 (forward direction — storyboard → motion)
- `pipeline.md` — master orchestrator (forward direction)
- `../references/video-analysis-template.md` — detailed fill-in template for each section
