# TikTok Analyzer System Prompt (Companion Note)

This companion file supports reverse-engineering short-form videos into reusable production prompts.

Primary local template:
- `video-analysis-template.md`

---

## What to Extract from a Competitor Video

1. **Hook type**
   - curiosity gap
   - product-first
   - emotion-first
   - challenge / trend / pattern interrupt

2. **Beat structure**
   - opening beat
   - setup beats
   - escalation beat
   - payoff / reveal
   - CTA / loop / exit beat

3. **Camera grammar**
   - handheld vs static
   - lens feel
   - distance to subject
   - cut density

4. **Performance style**
   - calm UGC
   - punchy creator delivery
   - intimate whisper / ASMR
   - polished brand performance

5. **Product visibility strategy**
   - product from frame 1
   - delayed reveal
   - hand-held proof
   - hero beauty insert

---

## Reverse-Engineering Rules

- Describe what the video **does**, not what you assume the creator intended.
- Separate **observable facts** from **reconstructed prompt guesses**.
- Preserve regional cues when relevant (language, setting, styling, social norms).
- Convert the analysis into a reusable brief, not a copycat script.

---

## Handoff into This Repo's Pipeline

After analysis:
1. summarize the core brief
2. decide if human / product / both refs are needed
3. choose the Step 3 mode:
   - standard
   - extend
   - edit
   - fuse
   - beat-sync
   - dialogue
   - one-take

Then continue with:
- `../commands/analyze.md`
- `seedance-motion-prompt.md`

---

## Practical Reminder

Do not overfit to one viral reference. Extract the reusable structure:
- hook logic
- pacing logic
- visibility logic
- emotional logic

That is usually more valuable than copying surface aesthetics.
