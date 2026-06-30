---
name: vo-v3
description: "/s2s vo-v3 — Convert a topic, brief, ad prompt, or Seedance motion prompt into an ElevenLabs v3 voiceover script. Outputs a VO context card plus plain-text lowercase bracketed audio tags for ElevenLabs Studio v3 or POST /v1/text-to-speech with model_id=eleven_v3."
---

# /s2s vo-v3 — Voiceover Script (ElevenLabs v3 Inline Audio Tags)

Converts a **topic, brief, ad prompt, or Seedance motion prompt** into a voiceover script in plain text with Eleven v3 inline audio tags (`[laughs]`, `[whispers]`, `[sighs]`, `[pause]`, emotions, accents). Strict v3-only — no SSML, no XML, no `<break>`, no `<prosody>`.

**Capability:** VO Script for ElevenLabs v3
**Trigger:** `/s2s vo-v3`, or auto-detect: "eleven v3", "v3 audio tags", "expressive voice v3", "elevenlabs v3 script", "voice acting v3", "bikin script eleven v3", "v3 pause tags"

---

## When to Use

- User wants v3-specific voiceover (most expressive model)
- User has or wants expressive delivery: `[whispers]`, `[laughs]`, `[sighs]`, `[angry]`, etc.
- User wants fine-grained pause control: `[pause]` / `[short pause]` / `[long pause]`
- Target: 15s TikTok ads, brand films, audiobooks, immersive storytelling
- Language: any of 70+ supported (Indonesian, English, etc.)

## When NOT to Use

- User wants plain vanilla TTS — use `eleven_multilingual_v2` (more stable, no tags)
- User wants SSML `<break>` or `<prosody>` syntax — v3 doesn't support; use an ElevenLabs v2 SSML workflow outside `/s2s vo-v3`
- User wants real-time / conversational (<200ms latency) — v3 is too slow, use `eleven_turbo_v2_5` or `eleven_flash_v2_5`
- User needs Professional Voice Clone (PVC) — v3 doesn't optimize PVCs yet, use IVC or Voice Design
- User has no audio context yet — start with `/s2s interview` first

---

## Companion Reference

For full verified v3 tag list + migration table from v2 SSML, load:
- `references/elevenlabs-vo-v3-tags.md`

---

## The Five Minimum Inputs

Gather these before writing. If user says "you decide", apply defaults in brackets.

| Field | Example | Required? |
|---|---|---|
| Hook | "Yang paling penting buat anak baru belajar minum, dot-nya gak gampang tumpah." | Required |
| Product / topic | "Pigeon SofTouch Straw 240ml" | Required |
| Duration | "15 detik" / "30 detik" / "60 detik" | Required |
| Tone baseline | casual mom / calm expert / hype UGC / narrator / corporate | Required |
| Language | Indonesian / English / multilingual | Required |
| Audio event intent | none / light (1-2 emotion tags) / full (with reactions [laughs] [sighs]) | Recommended |

---

## Accepted Input Modes

| Input mode | What the user gives | What this command must do |
|---|---|---|
| Raw idea | Topic/product + rough goal | Ask or infer the five minimum inputs, then draft VO |
| Brief | Creative/ad/PSA brief | Extract hook, promise, tone, duration, CTA |
| `/s2s ads` output | Product ad prompt | Convert sales arc into VO beats, keep benefit language |
| `/s2s motion` / Seedance prompt | Timeline, camera, action, visual beats | Compile visual context into speakable narration synced to the motion beats |

For Seedance prompt input, do **not** narrate the camera directions. Convert them into audience-facing meaning.

```text
Bad: "Camera dolly pushes into the mother holding the bottle."
Good: "[calm] Kalau anak lagi belajar minum sendiri, yang penting botolnya gak gampang tumpah."
```

---

## Seedance Prompt → VO Compiler Rule

When the input is a Seedance motion prompt, build this internal map before writing the final script:

| Extract from Seedance prompt | Convert into VO decision |
|---|---|
| Clip duration / timestamp | Word budget per beat |
| First visual action | Hook line, 0-3s |
| Character emotion / body language | Delivery tag: `[calm]`, `[nervous]`, `[tired]`, `[happily]`, etc. |
| Product / topic role | Benefit or message line |
| Camera movement | Pacing only, not spoken literally |
| On-screen text / CTA | Avoid duplicate wording unless it is the final spoken CTA |
| Silent visual beat | Insert `[pause]` or `[long pause]` |
| Safety-sensitive visual | Use indirect wording, never graphic description |

The VO is an **off-screen audio layer**, not a caption track. Say what the viewer needs to understand or feel, not everything already visible.

---

## Pacing + Word Budget

Formula: `target_words ≈ duration_seconds × wpm / 60`.

**English baseline:**

| Duration | Word count | Default pace |
|---|---|---|
| 15s | 35–45 | ~150 wpm |
| 30s | 75–100 | ~150 wpm |
| 60s | 150–200 | ~150 wpm |

**Indonesian correction**: Bahasa Indonesia is ~10–15% word-denser per idea (postpositions, affixes, sentence-final particles like `dong`, `sih`, `kan`, `deh`). Apply ~85–90% multiplier.

| Duration | Word count (Indonesian, ~130 wpm effective) |
|---|---|
| 15s | 30–38 |
| 30s | 60–85 |
| 60s | 125–170 |

Per-tone adjustments:
- casual mom / UGC: 145–165 wpm (Indonesian ~125–140 wpm)
- calm expert / narrator: 120–135 wpm (Indonesian ~105–115 wpm)
- hype / energetic: 165–180 wpm (Indonesian ~140–155 wpm)
- corporate / announcer: 140–155 wpm (Indonesian ~120–135 wpm)

Under-budget is fine — v3 fills the time with delivery variation. Over-budget: cut weakest line, never pad.

---

## Workflow

### Step 1: Pull context

If user has prior `/s2s motion` output, Seedance prompt, storyboard, or `/s2s ads` brief, **read it first** — the VO needs to sync with the video timeline. Map each motion beat (0-3s, 3-7s, etc.) to one VO segment.

If the user only pasted a Seedance prompt, infer missing fields from the prompt instead of asking unless duration, language, or speaker type is impossible to determine.

If user starts fresh, ask the 5 minimum inputs above.

### Step 2: Draft script in plain prose

Apply the UGC arc (4 segments):

```
HOOK (0-3s) → problem expansion (3-7s) → product intro + benefit (7-11s) → soft CTA (11-15s)
```

Tone per user input. Cut to fit budget.

For Seedance prompts, first write a private VO beat map:

```text
0-3s visual: <what happens on screen>
0-3s VO job: <hook / context / contrast>
0-3s spoken idea: <one sentence>
```

Then collapse the beat map into the final paste block.

### Step 3: Apply v3 inline tags

4-segment tag map:

| Segment | Mood | Recommended v3 tags |
|---|---|---|
| Hook | confident / urgent | `[calm]` or `[cheerfully]` — neutral energy, sets tone |
| Problem | relatable frustration | `[tired]` (physical/emotional exhaustion), `[resigned tone]` (acceptance), or `[frustrated]` (sharp annoyance). Pick: `[tired]` for mom-of-toddler weariness, `[resigned tone]` for "udah-kapok" energy, `[frustrated]` for sharp edge. |
| Product intro | warm, informative | `[calm][cheerfully]` — shift to positive |
| Specific benefit | proud moment | `[emphasized]` or `[happily]` — peak energy on key beat |
| Soft CTA | reassuring | `[calm][cheerfully]` — close on grounding |

### Step 4: Insert v3 pause syntax

v3's only pause control is **bracketed audio tags** (NOT `<break>`):

- `[short pause]` — micro-pause (~0.3s); use between clauses
- `[pause]` — standard pause (~0.7s); use at scene transitions
- `[long pause]` — explicit silence (~1.5–2s); use only before key reveals or after the final CTA

Do NOT use `<break>`, em-dash, ellipsis for pauses in v3. The tags are reliable; the older patterns are inconsistent in v3.

### Step 5: Spell numbers as words

Per ElevenLabs docs (applies to v3 same as v2):

> Numbers and symbols are written the same across many languages but pronounced differently. Writing out the number in text removes the need for the AI to interpret what it is supposed to do.

`"240ml"` → `"dua ratus empat puluh mili"` (Indonesian). Same rule across all languages.

### Step 6: Validate before save

- File is `.txt`, not `.xml`
- No `<speak>`, `<break>`, `<prosody>`, `<emphasis>` anywhere
- Numbers spelled as words
- No emoji, no special symbols (`→`, `&`, `<`, etc. inside text body)
- All tags lowercase `[lowercase]`
- Each tag matches verified v3 reference (see companion file)
- Word count within budget
- Total chars ≤ 3,000 (v3 limit)
- Voice choice is IVC, Voice Design, or stock Voice Library — NOT PVC

### Step 7: Save

Path: `~/Downloads/vo_scripts/<slug>.txt` (default). Honor user-specified path; create parent dir with `mkdir -p`.

Slug format:
```
<product>-<duration>-<platform>-<tone>-v3.txt
# e.g. pigeon-straw-240ml-tiktok-15s-casual-mom-v3.txt
# e.g. serum-bb-cream-reels-30s-casual-mom-v3.txt
```

### Step 8: Tell user the model + voice needs

Always end with:
- **Model**: `eleven_v3` (already assumed)
- **Voice**: Voice Design ID or IVC ID or Voice Library stock
- **Studio UI**: paste script into v3 text box, set model dropdown to "Eleven v3"
- **API call shape**:
  ```
  POST /v1/text-to-speech/<voice_id>
  Headers: xi-api-key: <key>
  Content-Type: application/json

  Body:
  {
    "model_id": "eleven_v3",
    "text": "<plain text with bracketed v3 tags>",
    "voice_settings": {
      "stability": 0.50,
      "similarity_boost": 0.75,
      "style": 0.00
    }
  }
  ```

---

## Voice Settings (API JSON)

```json
{
  "stability": 0.50,
  "similarity_boost": 0.75,
  "style": 0.00
}
```

For natural casual: stability 0.45–0.55.
For cinematic / emotional high: stability 0.35–0.45 (more variable re-rolls).

---

## Output Format

Return two blocks:

1. **VO Context Card** — for the user to review, not pasted into ElevenLabs.
2. **ElevenLabs v3 Paste Block** — plain text with inline bracketed v3 tags. This is the only block the user copies into ElevenLabs. Save as `.txt`. **Not XML, not SSML.**

Context card format:

```text
VO CONTEXT CARD
Duration: <15s / 30s / 60s>
Language: <Indonesian / English / ...>
Speaker: <casual mom / narrator / calm expert / ...>
Emotional arc: <hook → problem → relief → CTA>
Sync source: <Seedance prompt / storyboard / ad brief / raw idea>
Do not paste this card into ElevenLabs.
```

Paste block format:

```text
ELEVENLABS V3 PASTE BLOCK
[calm] Spoken line. [pause]

[cheerfully] Next spoken line.
```

Minimal example:

```
[calm][cheerfully] Yang paling penting buat anak baru belajar minum, dot-nya gak gampang tumpah. [short pause]

[tired] Pas anak gue lagi belajar pakai sedotan, biasa tuh banyak yang rembes [pause] atau sedotan ngambang doang. [long pause]

[cheerfully] Tapi ini Pigeon yang pake straw dua ratus empat puluh mili. [short pause] Ada bandul di bawah sedotan, [pause] susunya tetep keangkat [emphasized] sampai tetes terakhir. [pause]

[calm] Beli satu [pause] beres. [short pause] Gak ada drama ganti baju tiga kali sehari.
```

---

## Worked Example

### Worked Example 1: Pigeon Bottle 15s TikTok — Casual Mom (Indonesian)

User: `/s2s vo-v3 — 15 detik, Pigeon straw 240ml, casual mom, light audio events`

Output saved to `~/Downloads/vo_scripts/pigeon-straw-240ml-tiktok-15s-casual-mom-v3.txt`:

```
[calm][cheerfully] Anak baru belajar minum, dot-nya sering tumpah. [short pause]

[tired] Biasanya sedotan ngambang, [pause] gak ngangkat susu ke bawah. [long pause]

[cheerfully] Tapi Pigeon straw dua ratus empat puluh mili ada bandulnya, [emphasized] jadi susunya tetap keangkat sampai tetes terakhir. [pause]

[calm] Beli satu, [short pause] beres. [short pause] Gak ada drama ganti baju.
```

Word count: 40 (Indonesian budget 30–38 — slight over, acceptable for clarity). 391 chars total. All v3 tags verified.

### Worked Example 2: Hype UGC Variant

```
[excited][happily] Ini literally game-changer buat anak baru belajar minum! [laughs]

[resigned tone] Biasanya sedotan ngambang, [pause] dot tumpah, [sighs] drama tiap jam. [long pause]

[rushed] Tapi Pigeon straw dua ratus empat puluh mili ada bandulnya, [emphasized] susu tetap ngangkat sampai tetes terakhir! [laughs]

[happily] Trust me, [short pause] satu botol, [short pause] beres semua.
```

### Worked Example 3: Calm Expert Narrator

```
[calm] Hai moms, [short pause] ini review botol minum untuk si kecil. [pause]

[slows down] Masalahnya, [pause] sedotan biasa tidak mengangkat sisa susu di dasar botol. [long pause]

[calm][cheerfully] Pigeon straw dua ratus empat puluh mili punya bandul di ujung sedotan, [emphasized] sehingga setiap tetes bisa diminum. [pause]

[calm] Solusi praktis dan higienis untuk aktivitas harian anak.
```

---

## Companion Commands

Pair with other s2s capabilities:

| Task | Capability | Output |
|---|---|---|
| Get full motion prompt first | `/s2s motion` | video prompt |
| Get storyboard first | `/s2s storyboard` | storyboard image |
| Get VO script for v3 | `/s2s vo-v3` (this) | `.txt` with v3 tags |
| Get VO script for v2 SSML | Not handled by this command | `.xml` with SSML |
| Bundle everything into one file | `/s2s bundle` | combined markdown |

---

## QC Checklist

- [ ] File is `.txt`, not `.xml`
- [ ] No `<speak>`, `<break>`, `<prosody>`, `<emphasis>` anywhere
- [ ] Numbers spelled as words (`dua ratus empat puluh mili`, not `240ml`)
- [ ] No emoji in body
- [ ] All tags are lowercase, e.g. `[calm]`, `[pause]`, `[cheerfully]`
- [ ] Tag reference is in the verified v3 list (see `references/elevenlabs-vo-v3-tags.md`)
- [ ] Word count within duration budget (English ~150 wpm, Indonesian ~130 wpm effective)
- [ ] Total chars ≤ 3,000 (v3 limit)
- [ ] Voice choice is IVC, Voice Design, or stock Voice Library — NOT PVC
- [ ] Output starts with a tone baseline tag (`[calm]`, `[cheerfully]`, `[calm][cheerfully]`, etc.)
- [ ] Final CTA closes on a grounding tag (`[calm]` or `[calm][cheerfully]`). Bright tags like `[happily]` are acceptable as positive resolution; avoid leaving `[frustrated]` / `[nervous]` mid-thought

---

## Common Mistakes

| Mistake | Why it breaks | Fix |
|---|---|---|
| Wrap in `<speak>...</speak>` XML | v3 reads **plain text only** | Strip XML wrapper |
| `<break time="..." />` | SSML, not in v3 | Replace with `[pause]` / `[short pause]` / `[long pause]` |
| `<prosody>` rate/pitch | SSML, not in v3 | Replace with `[rushed]` / `[slows down]` / `[drawn out]` |
| Raw digits like `240` | Multilingual can't disambiguate | Write as words |
| Emoji in body | Breaks model | Strip |
| Custom tag like "fluttering eyelashes" | Made-up, ignored | Use only verified list |
| Using PVC for v3 | "Not fully optimized for v3" per blog | Switch to IVC or Voice Design |
| 4,000+ char script | v3 has 3,000 char limit | Split into 2 requests or trim |
| `model_id: "eleven_multilingual_v2"` | Won't pick up v3 audio tags | Set to `"eleven_v3"` |

---

## Related References

- `references/elevenlabs-vo-v3-tags.md` — full verified v3 tag list + v2 SSML→v3 migration table
- `assets/vo-script-template-v3.txt` — blank template
- Official blog: `https://elevenlabs.io/blog/v3-audiotags` (overview)
- Official blog: `https://elevenlabs.io/blog/eleven-v3-audio-tags-expressing-emotional-context-in-ai-speech` (emotions)
- Official blog: `https://elevenlabs.io/blog/eleven-v3-audio-tags-precision-delivery-control-for-ai-speech` (pacing)
- Help center: `https://help.elevenlabs.io/hc/en-us/articles/35869142561297`
