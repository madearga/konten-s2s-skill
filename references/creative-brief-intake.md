# Creative Brief Intake — Vague Idea → Structured Brief

**Source:** Adopted from `Emily2040/seedance-2.0` v5.5.2 (`seedance-interview` sub-skill) + s2s internal accumulated intake patterns from "16 Putaran" + "Gaji 3 Detik" + "SAKSI DI LAYAR v2" sessions.

Activated when user arrives with a vague idea — no full brief, no locked character, no script. Bridges to `/s2s storyboard`, `/s2s motion`, or `/s2s hook` after intake.

---

## Why This Exists

Most AI video requests start vague:
- "Bikin video AI buat tugas sekolah"
- "I want something viral"
- "Bikinin PSA tentang judi online"
- "Cinematic opening buat company profile"

Without intake, the agent guesses and produces a generic prompt. With intake, the agent gets a structured creative brief that prevents drift.

This is the **first capability** to invoke when brief is incomplete. Use BEFORE `/s2s storyboard` or `/s2s motion`.

---

## The 5-Field Brief (Core)

Always gather these 5 fields minimum. Stop early if all 5 are filled.

| Field        | Question (Bahasa Indonesia)              | Question (English)                       | Example                                    |
|--------------|------------------------------------------|------------------------------------------|--------------------------------------------|
| **Concept**  | Mau bikin video tentang apa?             | What's the video about?                  | "Anti cyberbullying untuk SMA"             |
| **Character**| Ada karakter manusia di video?           | Is there a human character?              | "Bystander SMP, 15 tahun, no face shown"  |
| **Location** | Di mana setting-nya?                     | Where is it set?                         | "Koridor sekolah, ruang kelas, kamar"      |
| **Duration** | Berapa detik?                            | How many seconds?                        | "60 detik (4 clip × 15s)"                  |
| **Energy**   | Vibe-nya gimana?                         | What's the energy/vibe?                  | "Brutal hook → intimate slow → restorative" |

**Rule:** If user provides a full brief in first message, skip intake. If user says "you decide" or "kamu yang tentukan", generate creative brief from common patterns (Indonesian PSA defaults) and ask user to confirm/override.

---

## Extended Intake (7 Additional Fields)

For richer output, ask these 7 optional fields. Combine into one batch of up to 4 questions to avoid overwhelming the user.

| Field            | Question                                            | Default if skipped              |
|------------------|-----------------------------------------------------|----------------------------------|
| **Audience**     | Siapa penontonnya?                                  | "Indonesian mobile-first viewers" |
| **Format**       | 9:16 vertikal / 16:9 landscape / 1:1?              | 9:16 vertical (mobile-first)     |
| **Tone**         | Contemplative / energetic / sad / hopeful?          | Match energy field                |
| **Forbidden**    | Ada yang nggak boleh ditampilin?                    | None stated                       |
| **Reference**    | Ada video/film/acuan yang mirip vibe-nya?           | None                              |
| **Budget**       | Budget kira-kira berapa USD?                       | $5 (mid)                          |
| **Deadline**     | Deadline-nya kapan?                                 | "No rush"                          |

---

## Intake Modes

### Mode 1: Question-First (Default)

Agent asks 3-5 clarifying questions, waits for answers, then generates brief.

Best when user explicitly vague: "bikin video AI dong" / "bantu bikinin sesuatu".

### Mode 2: Brief-First (Auto-Generate)

Agent generates creative brief from common patterns + keywords, surfaces it for confirmation.

Best when user gives topic + audience but no specifics:
- "Bikinin PSA anti judi online buat remaja Indonesia" → agent generates full brief, asks for adjustment

### Mode 3: Hybrid (Recommended for Indonesian PSA)

Agent generates brief based on Indonesian PSA conventions (validated patterns from "16 Putaran" + "SAKSI DI LAYAR"), asks for 1-2 key overrides.

Best when topic = social issue / PSA / competition.

---

## Intake Question Bank (Indonesian)

Use these question templates. Mix and match based on what user has provided.

### Concept
- "Mau bikin video tentang apa?"
- "Topik utamanya apa?"
- "Ceritanya tentang siapa?"
- "Apa yang pengen kamu sampaikan?"

### Character
- "Ada karakter manusia di video ini?"
- "Karakter utamanya siapa? (umur, sifat, appearance)"
- "Kalau ada karakter, wajahnya perlu ditampilin atau nggak?"
- "Boleh pake character reference image atau fully AI-generated?"

### Location
- "Setting-nya di mana?"
- "Ada lokasi spesifik? (sekolah, rumah, jalan, kantor, alam)"
- "Lokasinya indoor atau outdoor?"
- "Butuh suasana Indonesia kah? (warung, kos-kosan, angkot, sekolah, dll)"

### Duration
- "Berapa detik total?"
- "Single clip atau multi-clip?"
- "Format output: 9:16 vertikal / 16:9 landscape / 1:1?"

### Energy
- "Vibe-nya gimana? (energetic / contemplative / sad / hopeful / tense)"
- "Pacing-nya fast cuts atau slow cinematic?"
- "Mood arc-nya: ada perubahan mood di tengah?"

### Audience
- "Penontonnya siapa? (remaja / orang tua / profesional / umum)"
- "Tujuan-nya viral, atau kompetisi, atau tugas?"
- "Platform-nya TikTok / Instagram / YouTube / presentasi?"

### Forbidden
- "Ada yang nggak boleh ditampilin?"
- "Metode/isi tertentu yang mau dihindari?"
- "Untuk konten sensitif: boleh nggak tampilin wajah korban?"

### Reference
- "Ada video/film yang mirip vibe yang kamu mau?"
- "Style referensi: cinematic, anime, UGC, monochrome?"
- "Punya contoh AI video yang bagus sebagai acuan?"

---

## Creative Brief Template (Output)

After intake, output this structured brief. User can edit before passing to next capability.

```markdown
# Creative Brief — [Project Name]

## Core
- **Concept:** [one-line summary]
- **Character:** [description or "no character"]
- **Location:** [specific Indonesian setting]
- **Duration:** [N seconds, M clips]
- **Energy:** [vibe + arc]

## Extended
- **Audience:** [demographic + platform]
- **Format:** [9:16 / 16:9 / 1:1]
- **Tone:** [primary + secondary emotion]
- **Forbidden:** [list or "none stated"]
- **Reference:** [video/film/style or "no reference"]
- **Budget:** [USD estimate]
- **Deadline:** [date or "no rush"]

## Indonesian Context Anchors
- [prop/setting detail 1: e.g., "batik blanket", "warung tenda"]
- [prop/setting detail 2: e.g., "angkot route", "kantin sekolah"]
- [social/cultural detail: e.g., "bahasa sehari-hari", "seragam putih abu-abu"]

## Style Lock (if specified)
- [style anchor 1: e.g., "OAK macro cinematic", "Dexter montage", "monochrome sepia"]
- [reference image: path or URL]
- [color palette: e.g., "warm amber + cool blue"]

## Safety Guardrails (if sensitive content)
- [content type: cyberbullying / self-harm / gambling / etc]
- [6-point guardrails applied: yes / no]
- [help line CTA: 119 ext 8 / @janganbunuhdiri / etc]

## Suggested Next Capability
- [ ] `/s2s hook` — if opening not locked yet
- [ ] `/s2s storyboard` — if storyboard image needed
- [ ] `/s2s character-ref` — if human character present
- [ ] `/s2s product-ref` — if product present
- [ ] `/s2s motion` — if brief is final + have refs
- [ ] `/s2s cinematic-variations` — if want 10 composition sweep first
```

---

## Worked Examples

### Example 1: Vague → Brief

**User input:** "bikin video AI dong"

**Intake (Mode 1, Question-First):**
```
Q1: Mau bikin video tentang apa?
    A) PSA / social issue
    B) Produk / UGC
    C) Kompetisi / lomba
    D) Tugas sekolah / presentasi
    E) Lainnya

Q2: Untuk platform mana?
    A) TikTok (9:16, < 60s)
    B) Instagram Reels (9:16, < 90s)
    C) YouTube Shorts (9:16, < 60s)
    D) YouTube long (16:9, > 60s)
    E) Presentasi offline

Q3: Ada karakter manusia di video?
    A) Ya, 1 karakter
    B) Ya, 2+ karakter
    C) Tidak ada (produk/objek only)
    D) POV / hands-only (karakter implied, no face)

Q4: Berapa detik target?
    A) 8-15s (1 clip)
    B) 30-60s (2-4 clip)
    C) 60-120s (4-8 clip)
    D) 120s+ (long-form)
```

**Output brief:** (generated after answers)

### Example 2: Topic-First → Brief

**User input:** "PSA anti judi online buat remaja Indonesia"

**Intake (Mode 3, Hybrid — Indonesian PSA defaults):**

Agent auto-generates brief based on validated patterns:

```markdown
# Creative Brief — Anti Judi Online PSA (Auto-Generated)

## Core
- **Concept:** "30 hari cari nafkah, 3 detik menghancurkan" — gaji masuk → deposit → balance drop → kehidupan runtuh
- **Character:** Indonesian male, 20-25, casual, no specific identity (POV + hands only to avoid Seedance face blocking)
- **Location:** Kos-kosan + warung + HP screen, realistic Indonesian urban
- **Duration:** 105 detik (7 clip × 15s)
- **Energy:** Brutal hook (Clip 1) → fast escalation (Clip 2-5) → devastation (Clip 6) → contemplative resolve (Clip 7)

## Indonesian Context Anchors
- Gaji transfer via mobile banking notif
- Warung / angkringan setting
- Kos-kosan kecil dengan kasur single + kipas angin
- Bahasa sehari-hari: "Nak, makan dulu"

## Safety Guardrails
- 6-point OAK guardrails applied (no face, no method, no blood)
- Help line CTA: 119 ext 8 Into The Light
- Subtle, contemplative tone — not dramatic

## Suggested Next Capability
- [x] `/s2s hook` — generate 5 hook variants, pick strongest
- [ ] `/s2s storyboard` — after hook locked
- [ ] `/s2s motion` — after storyboard generated

## Override These If Needed:
- Concept: OK / adjust
- Character: POV only OK? / show face?
- Duration: 105s (7 clip) OK? / shorter?
- Energy: brutal → contemplative OK? / different arc?
```

User confirms or adjusts 1-2 fields, then proceeds.

---

## Intake Anti-Patterns

❌ **Asking too many questions at once** — max 4 multi-choice per batch
❌ **Asking open-ended when multi-choice possible** — provide options, let user override
❌ **Skipping intake when brief is partial** — even partial briefs benefit from confirmation
❌ **Auto-generating brief without surfacing for confirmation** — user must see + approve
❌ **Ignoring Indonesian context** — defaults should be Indonesian settings, props, language
❌ **Treating "bebas" as no input** — "bebas" = "kamu pilih yang terbaik, dengan preferensi umum", still generate + surface

---

## Integration with Library

This reference is used by `/s2s interview` command.

Output brief → feeds into:
- `/s2s storyboard` (12-section prompt fills from brief)
- `/s2s character-ref` (character description from brief)
- `/s2s product-ref` (product description from brief)
- `/s2s motion` (5-part spine fills from brief + refs)
- `/s2s hook` (brief + audience → hook variants)
- `/s2s cinematic-variations` (brief → 10 composition sweep)

---

## Reference

- Emily2040/seedance-2.0 — v5.5.2 — `skills/seedance-interview/` (creative brief intake sub-skill)
- s2s internal — accumulated intake patterns from "16 Putaran", "Gaji 3 Detik", "SAKSI DI LAYAR v2"
- s2s internal — `references/cinematic-composition-vocabulary.md` (19 styles for energy/format)
- s2s internal — `references/hook-brainstorming-social-issue.md` (social-issue intake patterns)
- s2s internal — `templates/oak-no-character-pov-workflow.md` (Indonesian PSA defaults)