# Voice Consistency — Multi-Clip Series with Same Speaker

**Source:** Adopted from `dexhunter/seedance2-skill` (ZH mirror, § "Voice/tone" row in role assignment table) + validated pattern from James Sismanes (@JamesSismanes) Jun 2026 Brooklyn gelato workflow — `Use @audio2 to reference Grandpa Rocco's established voice and broken English accent`.

Use this when generating a multi-clip series where the same speaker appears across clips and must sound identical each time (tone, accent, cadence, vocal quality).

---

## Core Principle

> **Voice is to audio what character ref is to visuals.** Seedance 2.0 supports `@audio1`/`@audio2`/`@audio3` as role-bound references for voice continuation — but ONLY if you explicitly say "voice references @audio2" in the prompt.

Without role assignment, voice gets re-synthesized each clip = drift.

---

## The `@` Role Syntax for Voice

| Purpose                | Example Syntax                                          |
|------------------------|---------------------------------------------------------|
| Voice / narration tone | `narration voice references @Video1`                    |
| Dialogue voice (cast)  | `Use @audio2 to reference [Character]'s established voice` |
| Accent / cadence only  | `reference @Video1's voice tone and broken English accent` |
| Singing voice          | `singing voice references @Audio1`                      |

Combine with visual character ref for full consistency:
```text
@Image2's character as the subject, 
Use @audio2 to reference Nico's established voice
```

---

## Voice Reference Template (Multi-Clip Series)

For each clip where the same speaker appears:

```text
VOICE DIRECTION — [CHARACTER NAME]:
Continue [CHARACTER NAME]'s EXACT same voice as heard in @Video1.
[Character description: age, accent, vocal quality, dialect].
It is CRITICAL that [accent/voice quality] is preserved.
Use @audio2 to reference [Character]'s established voice and [specific quality].

[Character] should sound like [concrete vocal description]:
- Tone: [warm / sharp / gravelly / breathy / etc]
- Pace: [deliberate / quick / rambling]
- Accent: [broken English / regional / specific dialect / etc]
- Cadence: [theatrical / conversational / monologue-like]
- Mannerisms: [specific verbal tics, e.g., "old-world confidence", "ancient family law"]

[Specific dialogue line example]: "[the line]" should sound like [how it should land emotionally].
```

### Worked Example (from James Sismanes prompt)

```text
VOICE DIRECTION — GRANDPA ROCCO:
Continue Grandpa Rocco's EXACT same voice as heard in @video1.
Grandpa Rocco should sound like a warm elderly Italian grandfather
speaking broken English with authentic Italian inflections and cadences.
It is CRITICAL that he has a broken English accent and sounds like a migrant.
Use @audio2 to reference Grandpa Rocco's established voice and broken English accent.

His voice is round, expressive, affectionate, dry, theatrical, and clear.
The accent should feel specific, human, and lived-in — not broad parody,
not cartoonish, and not offensive. He speaks English clearly enough to
understand, with Italian sentence rhythm, softened consonants, slightly
elongated vowels, and old-world confidence.

"Saturdays begin at seven, Nico. Seven o'clock means six fifty" should
sound like ancient family law.

"Hey! No!" should be firm, immediate, and offended, directed at the
pigeon like it is a repeat offender.
```

This prompt was **validated** by James Sismanes on Jun 2026 — produces consistent Italian-elder voice across the Brooklyn gelato truck clip series.

---

## Voice Reference Patterns by Scenario

### Pattern 1: Dialogue Series (Same Cast Across Clips)

When 2+ characters converse across multiple clips:

```text
VOICE DIRECTION:
[Character A]: Use @audio1 to reference established voice.
Description: [age, tone, accent, pace, verbal mannerism].

[Character B]: Use @audio2 to reference established voice.
Description: [age, tone, accent, pace, verbal mannerism].

[For Character C, if any]: Use @audio3.

CRITICAL: Do NOT synthesize new voices. Carry the same voice quality
across every clip in this series.
```

### Pattern 2: Narration / Voice-Over (Single Speaker)

When one narrator speaks over visuals:

```text
VOICE DIRECTION — NARRATOR:
Narration voice references @audio1 (the established narrator voice).
[Description of narrator quality: warm, measured, intimate, etc].
Match the cadence, breath patterns, and emotional inflection of @audio1.
```

### Pattern 3: Singing / Music Performance

When a character sings:

```text
VOICE DIRECTION — SINGER:
Singing voice references @audio1 (the established singer's voice).
Carry vocal timbre, vibrato, and breath support from @audio1.
Match phrasing and emotional arc of the lyrics.
```

### Pattern 4: Accent-Only Carry (Cross-Language)

When same character speaks different languages across clips:

```text
VOICE DIRECTION:
Voice tone, accent, and cadence reference @video1 (original language).
Translate dialogue to [target language], but PRESERVE:
- Accent (broken English / regional / specific dialect)
- Vocal quality (gravelly / breathy / etc)
- Speech rhythm
- Verbal mannerisms

DO NOT replace voice — the SAME voice, different words.
```

---

## Common Pitfalls

❌ **Don't say "use voice from @video1" without specifying WHAT to carry** — model may carry BGM, sound effects, AND voice. Specify "voice tone and broken English accent" only.

❌ **Don't upload the actual speaker's audio as @audio2 if Seedance has face policy** — voice reference alone is fine, but face-blocked source audio may cause edge cases.

❌ **Don't combine voice ref with conflicting style hints** — "voice from @audio2 but sound like a young British woman" = drift.

❌ **Don't assume voice carries across automatic audio generation** — if the Seedance generation creates its own audio bed (no `@audio2` specified), voice WILL be re-synthesized.

❌ **Don't skip voice ref for short clips** — voice drift happens even on 8s clips if no role is bound.

---

## Voice Reference vs Lip-Sync

These are different features:

| Feature             | What it does                                    | When to use                                  |
|---------------------|--------------------------------------------------|----------------------------------------------|
| **Voice reference** | Carries voice tone/accent across generations    | Multi-clip series with same speaker          |
| **Lip-sync**        | Animates mouth to match specific dialogue line  | Single clip with locked dialogue            |

Seedance 2.0 supports both. Voice reference uses `@audio2`. Lip-sync is automatic when dialogue is in the prompt + face is visible.

**For POV / hands-only (no face visible):** voice reference still works (audio track plays regardless of visual). Lip-sync is irrelevant since no mouth is shown.

---

## Compatibility Notes

| Model          | Voice ref support | Notes                              |
|----------------|--------------------|------------------------------------|
| Seedance 2.0   | ✅ Full            | Best with explicit `@audio2` + accent description |
| Veo 3.1 Lite   | ⚠️ Partial         | Inherits audio tone but accent drift possible |
| Kling 3.0      | ✅ Good            | Strong on dialogue tone            |
| Pixazo Seedance| ✅ Same as Jimeng  | Identical syntax                   |

---

## Voice Reference Anti-Slop Lexicon

When generating dialogue, avoid these AI-tells:

❌ **No breathy whisper ASR narration** — robotic whisper that sounds like documentary voice-over
❌ **No podcast-host cadence** — forced enthusiasm + rhetorical question pattern
❌ **No audiobook-monotone** — flat pitch, no emotional arc
❌ **No corporate-narration** — "In today's fast-paced world..."
❌ **No caricature accent** — Italian = "Mamma mia!", Chinese = "Ching chong", etc.

✅ **Specific human qualities:** "broken English from a 70-year-old migrant", "old-world confidence", "warm elderly tone with Italian sentence rhythm"

---

## Cross-Reference

- `references/seedance-pattern-library.md` § "Pattern 6 — Dialogue / Talk-to-Camera" — base dialogue pattern
- `references/seedance-reference-syntax.md` — full `@`-role binding system (including `@audio1/2/3`)
- `references/seedance-motion-vocabulary.md` § "Emotional Guidance Phrases" — Valence + Arousal
- `commands/compose-pattern.md` § "Pattern 5: dialogue" — full dialogue template
- `references/seedance-troubleshooting.md` § "5. Audio / Dialogue Failure" — repair patterns

---

## Reference

- dexhunter/seedance2-skill — `SKILL.md` — "Voice/tone" row in role assignment table
- Emily2040/seedance-2.0 — v5.5.2 — `references/seedance-copyright.md` (voice-IP considerations)
- James Sismanes (@JamesSismanes) — Jun 2026 Brooklyn gelato truck tweet — validated `Use @audio2` pattern
