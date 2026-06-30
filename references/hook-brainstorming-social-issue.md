# Hook Brainstorming for Social-Issue AI Videos

Reference for generating, evaluating, and locking visual hooks for competition submissions, PSAs, and social-issue / public-safety AI videos. Built from reusable multi-clip social-issue and public-safety workflows.

## When to use

- User asks for "hook yang engaging", "hook paling ngena", "alternatif hook", "hook out of the box", or any hook brainstorming for social-issue / competition videos.
- User wants a hook for social-issue, anti-pinjol, mental health, road safety, or other Indonesian public-service topics.
- Need to integrate real national statistics into the hook.

## Workflow

### 1. Anchor on the social issue first

Before brainstorming hooks, gather 3-5 real signals:

| Signal | Where to find | Example (social issue) |
|---|---|---|
| Scale / victims | PPATK, Komdigi, BSSN, OJK, BPS | 3,1 juta pemain; 12,3 juta pernah deposit |
| Money flow | Public statistics sources | Large transaction volume |
| Human impact | Kompas, Detik, regional news | utang → pinjol → bunuh diri; kejahasan akibat judol |
| Government response | Komdigi, BSSN, Polri | 8,1 juta konten perjudian diblokir |
| Demographic | Universitas (UGM, Unisa), DPR | 60% pemain milenial/Gen Z; anak 10-16 tahun deposit |

**Rule of thumb:** if a hook can be backed by one concrete number, it is 2-3× more credible and engaging than a pure emotional hook.

### 2. Generate hooks in tiers

Tier 1 — Direct UI metaphor
- Use the app's own language (deposit, spin, cashback, withdrawal, jackpot counter, tier VIP).
- Strong for audiences who already know the app UI.
- Examples: Rolling Jackpot Counter, Deposit Button Pulse, Withdrawal Ghost, Cashback Banner Burn.

Tier 2 — Body / personal consequence
- Translate digital harm into physical sensation.
- Examples: Slot Machine Ribcage, Glass Shatter Selfie, Puzzle Face, Ink Bleed Banknote.

Tier 3 — Time / countdown
- Make the passage of time the enemy.
- Examples: 11-Second Rule, Salary Burn, Countdown Fingers, Second Hand.

Tier 4 — Social scale / macro-to-micro
- Start national, zoom to one person.
- Examples: 3.1 Million Faces, Domino Birthdate, Mosquito Swarm Phone, Referral Code Virus.

Tier 5 — Surreal / poetic metaphor
- Highest differentiation; risk of losing clarity.
- Examples: Moth to Flame, Rotting Fruit, Payung Terbalik, Ant Farm, Rupiah Origami.

### 3. Evaluate every hook against 6 criteria

| Criterion | Question | Weight |
|---|---|---|
| Clarity in 3s | Can a stranger understand it in 3 seconds? | High |
| Visual AI-ability | Can Seedance / Kling / Veo render it without heavy text? | High |
| Relevance | Is it unmistakably about the target issue (e.g. social issue)? | High |
| Emotional hit | Does it create fear, guilt, empathy, or shock? | High |
| Uniqueness | Has this visual been done to death? | Medium |
| Continuity | Can it transition naturally into the 12-panel storyboard body? | Medium |

Reject hooks that score low on Clarity, AI-ability, or Relevance, even if unique.

### 4. Lock the hook with a one-liner + 3-frame visual

Every approved hook must have:

```
TAGLINE: 7-12 kata, bisa dibaca dalam 3 detik.
FRAME 1: visual question / scale setup
FRAME 2: action / tap / trigger
FRAME 3: consequence / twist / grid / cells
```

Example (Rolling Jackpot Counter):
- TAGLINE: "Dia loading kemenangan. Yang terdownload hutang."
- FRAME 1: HP bercahaya, jackpot idle "0"
- FRAME 2: jari tap, angka berputar naik
- FRAME 3: glitch ke -100JT, 16 cell meledak

### 5. Research-backed hook phrasing

When statistics exist, lead with the number in the hook:

- Weak: "Banyak orang hancur karena social issue."
- Strong: "3,1 juta orang Indonesia. Satu tap. 16 hidup hancur."

Numbers give the audience permission to care — they prove this is not fiction.

## Common hook pitfalls

1. **Hook terlalu abstrak** — audience swipes sebelum mengerti.
2. **Hook tidak jelas issue-nya** — 3 detik pertama harus mengatakan "ini tentang social issue / pinjol / X".
3. **Hook bergantung pada teks** — Seedance hallucinasi teks; jangan pakai tagline panjang di dalam frame.
4. **Hook tidak nyambung ke body** — 16 cell grid / narasi utama harus muncul di P03-P04, bukan di akhir.
5. **Hook hanya emosional tanpa data** — PSAs kompetisi dinilai pada dampak sosial; data memperkuat credibility.
6. **Hook terlalu keras / grafis** — moderation filter akan blokir; pakai implikasi (penjara, isolasi) bukan gore.

## Prompt structure for hook-first storyboard

Once a hook is chosen, expand into the standard 12-section storyboard prompt:

```
PROJECT CARD
TITLE: [Project] — Hook: [Hook Name]
META LINE: [hook one-liner] / [social issue] / [AI showcase]
PRIORITY:
- first 3 panels must execute the hook
- P01 = [FRAME 1]
- P02 = [FRAME 2]
- P03 = [FRAME 3]
- NO text labels inside cells
MICRO BRIEF: [one sentence]

SCENE PACKET
PREMISE: [what happens in 3s + how it expands into the body]
START -> END: [sequence]
ACTION CHAIN: [beat chain]
...

EMOTIONAL ARC
Temptation -> Euphoria -> Glitch -> Dread -> Shock -> Unresolved
(or another 2-axis Valence/Arousal curve)
```

## Indonesia-specific data sources (bookmark)

- PPATK: https://www.ppatk.go.id
- Komdigi: https://www.komdigi.go.id
- BSSN: https://www.bssn.go.id
- GoodStats: https://data.goodstats.id
- Katadata Databoks: https://databoks.katadata.co.id
- OJK / regional OJK (DIY, dll)

## Example hooks for social-issue fate-grid videos

Selected and documented during 2026-06-14 session:

### Approved hook — Rolling Jackpot Counter
Visual: HP → tap → angka naik → MEGA WIN → glitch -100JT → 16 cell meledak.
Tagline: "Dia loading kemenangan. Yang terdownload hutang."
Why approved: clear, AI-able, unmistakably social issue, data-friendly, transitions into 16-cell body.

### Runner-up hooks
- **Deposit Button Pulse**: UI paling ikonik judol, tapi lebih umum.
- **3.1 Million Faces**: skala nasional → personal, kuat untuk versi 30-60s.
- **Withdrawal Ghost**: ironi "dana cair", cocok untuk bagian tengah narasi.

### Rejected hooks
- **Chatbot Confession**: terlalu meta, tidak jelas social issue.
- **Rupiah Origami**: poetis tapi transisi ke grid sulit.
- **Sleep Paralysis Demon**: visual beda tapi tidak jelas issue.

## How to continue

After hook selection:
1. Write 12-section storyboard prompt using `storyboard-to-seedance-suite` `/s2s storyboard`
2. Generate character ref using `/s2s character-ref`
3. Build Seedance motion prompt with `/s2s motion`
4. Add a NEGATIVE CONSTRAINTS block inside the motion prompt (see `references/koda-ivanna-patterns-2026-06.md`)
5. Keep Notion page clean: one current storyboard prompt + one current motion prompt only
