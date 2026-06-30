---
name: elevenlabs-vo-v3-tags
description: "Eleven v3 audio tag reference, verified against official blog + help center — for /s2s vo-v3 capability. Companion to commands/vo-v3.md."
---

# ElevenLabs v3 Audio Tag Reference

Verified from official ElevenLabs sources (June 2026):
- Blog: `https://elevenlabs.io/blog/v3-audiotags`
- Blog: `https://elevenlabs.io/blog/eleven-v3-audio-tags-expressing-emotional-context-in-ai-speech`
- Blog: `https://elevenlabs.io/blog/eleven-v3-audio-tags-precision-delivery-control-for-ai-speech`
- Blog: `https://elevenlabs.io/blog/eleven-v3`
- Help: `https://help.elevenlabs.io/hc/en-us/articles/35869142561297-How-do-audio-tags-work-with-Eleven-v3`

## Why v3 Tags

Eleven v3 reads inline `[lowercase]` tags in plain text — **no SSML, no XML wrapper**. Each tag modulates emotion, delivery, or non-verbal reaction. Different from v2 SSML `<break>` / `<prosody>` which v3 doesn't support.

## Categories

### Emotions
```
[sad] [happy] [angry] [excited] [calm] [nervous] [frustrated]
[tired] [sorrowful] [cheerfully] [playfully] [deadpan] [flatly] [resigned tone]
```

### Delivery
```
[whispers] [shouts]
[x accent]   # e.g. [British accent] [French accent] [Southern US accent]
```

### Reactions (non-verbal)
```
[laughs] [laughs harder] [light chuckle] [big laugh] [giggle]
[sighs] [sigh of relief] [clears throat] [gulps] [gasps]
[breathes]
```

### Pacing / cognitive
```
[pause] [short pause] [long pause]   # v3 pause syntax (replaces <break>)
[hesitant] [timidly] [stammers] [drawn out] [rushed] [slows down]
[rapid-fire] [deliberate] [repeats] [understated]
[emphasized] [stress on next word] [pauses] [hesitates]
```

### Combining (works)
```
[hesitant][nervous] I... I'm not sure this is going to work.
[whispers][pause] Did you hear that? [rushed] Hide! Now!
[whispers][breathes] Something's coming... [sighs] I can feel it.
[tired] I've been working fourteen hours. [sighs] My hands are numb.
[happily][shouts] We did it! [laughs]
```

### Multi-speaker dialogue
For multi-speaker, use the dedicated `/v1/text-to-dialogue` endpoint (NOT `/v1/text-to-speech`). Format is JSON array of `{speaker_id, text}`.

```json
[
  {"speaker_id": "scarlett", "text": "(cheerfully) Perfect! And if that pop-up is bothering you..."},
  {"speaker_id": "lex", "text": "You are a hero. An actual digital wizard."},
  {"speaker_id": "scarlett", "text": "(laughs) Glad we could stop that in time."}
]
```

Note: `(laughs)` style `(parenthetical)` works in dialogue mode, distinct from `[laughs]` inline tag in single-speaker.

## Caveats

- **PVC (Professional Voice Clone) not optimized for v3** — use IVC or Voice Design
- **3,000 char limit** per request (vs 10K for multilingual_v2)
- **Higher latency** — not for real-time / conversational use cases
- Tags are **voice and context dependent** — same script renders differently per voice
- Test with re-rolls; v3 prompt engineering is more iteration-heavy than v2

## v2 SSML → v3 Inline Migration

| v2 SSML | v3 inline tag |
|---|---|
| `<break time="0.3s" />` | `[short pause]` |
| `<break time="1.0s" />` | `[pause]` |
| `<break time="2.0s" />` | `[long pause]` |
| `<prosody rate="0.95">` | `[slows down]` then continue with normal prose |
| `<prosody rate="1.05">` | `[rushed]` then continue with normal prose |
| `<emphasis level="strong">` | `[emphasized]` |
| `—` (em-dash) | `[short pause]` or `[pause]` |
| `--` | `[long pause]` |
| `...` (ellipsis) | `[hesitant]` + `[pause]` |

## Voice Selection (per official blog)

For v3 production:
1. **IVC (Instant Voice Clone)** — fastest, decent quality
2. **Voice Design** — text-prompted synthetic voice, no samples needed
3. **PVC** — flagged "not fully optimized for v3" per blog; skip until 2026+

For Indonesian:
- Voice Library has limited Indonesian options
- Recommended: Voice Design dengan prompt deskriptif
- Example: `"Indonesian female, calm maternal tone, 30s, warm and reassuring"`

## See Also

- `commands/vo-v3.md` — full `/s2s vo-v3` command spec with workflow + worked examples
- `assets/vo-script-template-v3.txt` — blank template with 4-segment structure pre-tagged
- Official blog series: "Eleven v3 Audio Tags" (4 parts, June 2026)
