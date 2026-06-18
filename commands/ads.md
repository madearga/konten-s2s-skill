# /s2s ads — Ad / Commercial Motion Prompt (Dexhunter Patterns)

Generates a Seedance 2.0 / Veo / Kling motion prompt for **advertising / commercial** use cases. Embeds the 12-pattern dexhunter library, with focus on ad-relevant patterns: **Product Ad (Pattern 9), Creative Template / Effects Replication (Pattern 3), Music Beat-Sync (Pattern 6), Scene Montage (Pattern 12)**.

**Capability:** Ads (commercial / e-commerce / brand content)
**Trigger:** `/s2s ads` or auto-detect: "ad", "iklan", "commercial", "product video", "produk video", "brand content", "e-commerce", "showcase", "promo", "campaign video", "UGC ad", "TikTok shop", "Shopee", "Tokopedia"

---

## When to Use

- User wants to make a product / brand / e-commerce video
- User has product reference image ready (or wants `/s2s product-ref` first)
- Target: TikTok Shop, Instagram Reels ads, YouTube pre-roll, brand campaign
- Duration: 8-15s (standard ad) or 30-60s (longer ad with multiple beats)
- Style: cinematic / UGC / animated / hybrid

## When NOT to Use

- User wants a narrative / PSA / story-driven content — use `/s2s motion` with appropriate pattern
- User has no product or brand to feature — use `/s2s interview` first to clarify
- User wants character-driven scene (no product focus) — use `/s2s motion` standard

---

## The Dexhunter Pattern Map for Ads

dexhunter/seedance2-skill v1.0 documents **12 numbered patterns**. For ads, the most relevant are:

| Pattern # | Pattern Name                    | Ad Use Case                              |
|-----------|--------------------------------|------------------------------------------|
| 1         | Character Consistency          | Brand mascot, host consistency           |
| 2         | Camera Movement Replication     | Replicate competitor's ad style          |
| 3         | Creative Template / FX Replication | Replicate ad transitions / VFX      |
| 4         | Video Extension                | Ad continuation / cut-down versioning    |
| 6         | Music Beat-Sync                | TikTok-style beat ads                    |
| 9         | **E-commerce / Product Showcase** | ⭐ Hero pattern for product ads       |
| 11        | AI Drama / Manga               | Story-driven brand content               |
| 12        | Video Fusion / Continuation    | Multi-cut ad assembly                    |

`/s2s ads` defaults to **Pattern 9 (Product Showcase)** with options to escalate to Pattern 3 (FX Replication) or Pattern 6 (Beat-Sync) when user wants more dynamic style.

---

## Workflow

### Step 1: Gather Inputs

Ask **2 of 3** fields minimum:

| Field             | Example                                                  | Required |
|-------------------|----------------------------------------------------------|----------|
| Product           | "Soda can, hero shot, blue aluminum, condensation"        | Required |
| Ad style          | "Cinematic macro" / "UGC handheld" / "Beat-sync TikTok" / "Animated" | Required |
| Duration          | 8s / 15s / 30s / 60s                                     | Recommended |

Optional: brand voice (color palette, typography), CTA (call-to-action text), BGM reference.

### Step 2: Load Dexhunter Reference

Read `references/dexhunter-patterns-ads.md` for full 12-pattern spec + `@` reference syntax + 3s time-segment grammar.

### Step 3: Select Ad Pattern

Based on user intent, select primary pattern:

```
User wants...                  → Pattern
Standard product showcase       → Pattern 9 (E-commerce)
Multi-cut ad with FX            → Pattern 3 (Creative Template) + Pattern 9
Music-driven / TikTok-style     → Pattern 6 (Beat-Sync) + Pattern 9
Replicate competitor's ad style → Pattern 2 (Camera Replication) + Pattern 9
Brand story arc                  → Pattern 11 (AI Drama) lite + Pattern 9
```

### Step 4: Build Prompt

Apply the **7-block formula** (combining dexhunter's structured formula + Emily's Director Formula):

```text
[1. SUBJECT]     Product as the hero. Specific identity, material, lighting anchor.
[2. SCENE]       Setting (studio / lifestyle / in-use / contextual).
[3. ACTION]      Hero entrance → rotation → detail reveal → lifestyle context → CTA.
[4. CAMERA]      Slow orbit / push-in / rack focus / OTS detail. ONE primary move.
[5. TIMING]      3s segments (dexhunter default — more precise than s2s default 5s).
[6. AUDIO]       BGM + product interaction SFX. NO VO unless specified.
[7. STYLE]       Cinematic macro / UGC / animated / brand-specific.
```

### Step 5: Add `@` Reference Syntax

Per dexhunter + s2s `seedance-reference-syntax.md`:

```text
@Image1 as the hero product (front view).
@Image2 as product in lifestyle context.
@Image3 as product detail / texture close-up.
@Video1's camera movement and editing rhythm.
@Audio1 as background music bed.
```

### Step 6: Insert Anti-Slop Lexicon

Per `references/seedance-motion-vocabulary.md` § Anti-Slop Lexicon. **Mandatory** for ads (audiences detect AI instantly):

```text
NEGATIVE PROMPT:
- No plastic / waxy product surface
- No floating disconnected shadows
- No Western brand logo / app brand / readable text
- No anime / 3D / illustration style (unless requested)
- No unrealistic perfection (subtle wear, asymmetry, real texture)
- No music baked in unless specified
- No snap zooms / whip pan (cinematic) / excessive shake (UGC)
```

---

## Default Prompt Template (Pattern 9: E-commerce / Product Showcase)

```text
@Image1's product as the hero subject (preserve exact appearance, label, color).

SCENE: [studio black acrylic / Indonesian kitchen / outdoor lifestyle setting].
DURATION: 15 seconds, vertical 9:16 / 16:9 landscape / 1:1 — user choice.

0-3s:  Product enters frame, dynamic entrance, lighting establishes brand mood.
3-6s:  Slow rotation, hero angle, macro texture visible, color catches light.
6-9s:  Detail reveal — surface / texture / label / key feature visible.
9-12s: Lifestyle context — product in use, real human hand (optional), natural setting.
12-15s: Hero closing shot, product holds frame, [optional: brand logo/text fades in last 1s].

CAMERA: slow orbit (360° over 12s) OR push-in (medium → macro detail) OR locked wide with rack focus.
LIGHT: motivated practical (window light / studio key + rim / phone screen glow / kitchen ambient).
STYLE: cinematic macro / commercial-grade / photorealistic.
AUDIO: [BGM reference if specified] + product interaction SFX (cap pop / pour / click / texture).

CONSTRAINTS:
- Preserve @Image1 product identity exactly (no redesign, no recolor, no shape change)
- ONE primary camera move + endpoint (no whip pan, no snap zoom)
- No baked-in music if user wants post-production control
- Brand text / logo ONLY in final 1s closing frame

NEGATIVE PROMPT:
- No plastic surface, no waxy skin (if human hand shown), no airbrushed look
- No readable foreign brand, no real app logo, no readable slur
- No anime, no cel-shading, no painterly look (unless user wants)
- No Japanese / Korean / Western text hallucination
- No floating disconnected shadows
- No unreal perfection (no subtle wear, no asymmetry)
- No snap zooms, no whip pan for cinematic style
```

---

## Variant Templates

### Variant A: Beat-Sync TikTok Ad (Pattern 6 + 9)

```text
@Image1's product as the hero. Match cuts to @Audio1's beat positions.

0-1s:   Hook — product silhouette + beat drop (tight close-up)
1-2s:   Cut — rotation 90° + beat 2 (medium shot)
2-3s:   Cut — detail macro + beat 3 (extreme close-up)
3-4s:   Cut — lifestyle hand-in-use + beat 4 (medium shot)
4-5s:   Hold — product hero + accent beat
5-6s:   ...

Adjust cut density to @Audio1's BPM:
- Slow track (60-90 BPM): cut every 4-8s
- Mid track (90-120 BPM): cut every 2-4s
- Fast track (120+ BPM): cut every 1-2s
```

### Variant B: UGC Hand-Holding Product (Pattern 1 + 9)

```text
@Image2's hand as the holder. @Image1's product in hand.

Scene: Indonesian kitchen / bedroom / outdoor. Natural lighting (window light, morning golden hour).
Handheld — visible micro-shake, organic movement.

0-3s: hand enters frame from screen-right, picks up product
3-6s: hand rotates product showing label to camera (UGC-style)
6-10s: hand opens product / uses product / pours / applies
10-15s: hand places product back, exits frame (HARD CUT)

AUDIO: ambient room tone (no music unless specified), hand-object interaction SFX.
STYLE: TikTok UGC, authentic, lived-in.
NO professional lighting. NO studio look. Real hands, real setting.
```

### Variant C: Cinematic Macro Product Hero (Pattern 9 + dexhunter Camera Replication)

```text
@Video1's camera work (orbit + macro push). @Image1's product.

Scene: studio black acrylic, single key light + cool rim.
Camera: 12-second orbit 360° around product, ending on macro label detail.
Locked frame composition throughout — no cuts.

0-3s:   Wide establishing, product centered, key light catches hero surface
3-6s:   Slow orbit 90°, lighting transitions (key from left → back-left)
6-9s:   Continue orbit 180°, push-in starts (medium → medium close-up)
9-12s:  Orbit 270°, push-in continues (close-up → macro)
12-15s: Macro lock on label / texture, condensation visible (if beverage), HOLD 3s

AUDIO: no music. Subtle ambient: soft hum, slow breath, surface texture SFX.
STYLE: Apple-keynote-grade, photorealistic, cinematic.
NEGATIVE: no plastic surface, no waxy look, no readable foreign text, no snap zooms.
```

### Variant D: Multi-Cut Ad Assembly (Pattern 12 + 9)

```text
@Image1, @Image2, @Image3 — different product angles / lifestyle shots.
Fuse into one continuous ad sequence with music-driven cuts.

SEQUENCE:
0-3s:   @Image1 — product hero entrance (slow push-in from wide)
3-6s:   @Image2 — product in lifestyle (handheld UGC)
6-9s:   @Image3 — product detail macro (locked frame)
9-12s:  @Image1 — product in use (rotate 180°)
12-15s: @Image1 — hero closing (locked, brand text fades in)

TRANSITIONS: match cuts on product geometry, whip pan between UGC segments,
             dissolve to/from macro segments.

AUDIO: BGM @Audio1, peak intensity at 9-12s (use beat), taper at 12-15s.
```

---

## Inputs to Gather

| Field             | Example                                              | Required     |
|-------------------|------------------------------------------------------|--------------|
| Product           | "Soda can / perfume / lipstick / snack"               | Required     |
| Ad style          | "Cinematic / UGC / Beat-sync / Animated"             | Required     |
| Duration          | 8s / 15s / 30s / 60s                                 | Recommended  |
| Aspect ratio      | 9:16 / 16:9 / 1:1                                    | Optional (default 9:16) |
| BGM reference     | Path / URL / "no music" / "energetic pop"            | Optional     |
| Reference video   | Competitor ad / brand reference / "no reference"    | Optional     |
| CTA text          | "Beli sekarang" / brand hashtag / "no text"          | Optional     |

If user says "you decide", use defaults: 15s vertical cinematic macro with prompt-driven style.

---

## Output Format

```markdown
# /s2s ads — [Product Name] Ad Prompt

## Inputs
- Product: [description]
- Style: [cinematic / UGC / beat-sync]
- Duration: [N]s, [aspect ratio]
- BGM: [reference / description / none]

## Pattern Selected
- Primary: Pattern N — [name]
- Secondary: Pattern N — [name] (if applicable)

## References Attached
- @Image1: [role description]
- @Image2: [role description]
- @Video1: [role description]
- @Audio1: [role description]

## Full Motion Prompt
[copy-paste-ready prompt, ≤ 4000 chars]

## QC Checklist
- [ ] Product identity preserved (no redesign, no recolor)
- [ ] ONE primary camera move specified
- [ ] Time segmentation in 3s blocks (dexhunter default)
- [ ] Anti-slop lexicon applied
- [ ] No readable foreign brand / text hallucination
- [ ] Audio: BGM ref + product SFX (if applicable)
- [ ] Aspect ratio declared
- [ ] Aspect ratio: 9:16 / 16:9 / 1:1 matches target platform
- [ ] Duration: 8s / 15s / 30s / 60s within Seedance limits (4-15s single clip)
```

---

## Worked Example

### Example 1: Soda Can — Beat-Sync TikTok Ad

**User input:** `/s2s ads — soda can, beat-sync TikTok, 15s`

**Pattern selected:** Pattern 6 (Beat-Sync) + Pattern 9 (E-commerce)

**Generated prompt:**

```text
@Image1's soda can as the hero (preserve aluminum blue, condensation, label).

0-1s:    Hook — silhouette + beat drop, tight close-up on label
1-2s:    Cut — rotation 90° + beat 2, medium shot
2-3s:    Cut — condensation macro + beat 3, extreme close-up
3-5s:    Hold — product hero + accent, slow push-in starts
5-7s:    Cut — hand picks up can + beat, UGC handheld
7-10s:   Hand opens can, fizz visible + build-up beats
10-13s:  Pour sequence, liquid motion + peak beat
13-15s:  Closing — can placed on table + final beat, brand visible

CAMERA: cuts every 1-2 beats (high-energy BPM ~120-140), handheld for UGC segments.
AUDIO: BGM @Audio1 (energetic pop), can SFX (crack, fizz, pour, ice clink).
STYLE: TikTok UGC + cinematic hybrid. Real hands, real setting.

NEGATIVE:
- No plastic surface, no waxy can
- No readable foreign brand text
- No anime / 3D look
- No unreal perfection
- No snap zooms during pour sequence
```

### Example 2: Perfume — Cinematic Macro Hero

**User input:** `/s2s ads — perfume bottle, cinematic macro, 15s`

**Pattern selected:** Pattern 9 (E-commerce) primary, Pattern 2 (Camera Replication) for orbit technique

**Generated prompt:** (see Variant C above)

---

## Cross-Reference

- `references/dexhunter-patterns-ads.md` — full 12-pattern spec adapted for ads
- `references/seedance-reference-syntax.md` — `@`-role binding system
- `references/seedance-camera-language.md` — orbit / push-in / rack focus vocabulary
- `references/seedance-motion-vocabulary.md` — action verbs for product interaction, anti-slop lexicon
- `commands/product-ref.md` — generate product reference image first
- `commands/motion.md` — for non-ad motion (narrative, PSA, etc.)
- `commands/hook.md` — if ad needs a strong hook for first 3 seconds

---

## Companion Reference: dexhunter-patterns-ads.md

This command relies on `references/dexhunter-patterns-ads.md` (to be created) which contains the full 12-pattern library annotated for ad use cases.

---

## Related Commands

- `/s2s product-ref` — generate product reference image first (most ads need this)
- `/s2s motion` — for non-ad content
- `/s2s hook` — strong opening for TikTok/Reels ads (first 3s retention critical)
- `/s2s bundle` — assemble ad campaign outputs into one file