# Version History

- **1.13.3** (2026-06-30) — **Seedance prompt to ElevenLabs v3 VO compiler**
  - Extended `/s2s vo-v3` to accept raw ideas, briefs, ad prompts, and Seedance motion prompts.
  - Added the Seedance Prompt → VO Compiler rule: extract duration, first visual action, emotion, product role, camera pacing, silent beats, and safety context before writing VO.
  - Added required output split: VO Context Card for review + ElevenLabs v3 Paste Block for direct copy-paste.
  - Cleaned remaining completed-project provenance from reusable storyboard references.

- **1.13.2** (2026-06-30) — **/s2s vo-v3 routing and tag hygiene fix**
  - Added explicit `/s2s vo-v3` trigger to SKILL frontmatter.
  - Fixed slash-command helper path: use canonical `storyboard-to-seedance-suite`, not stale `konten-s2s-skill` lookup.
  - Removed nonexistent `/s2s vo` handoff from v3 command docs.
  - Replaced invalid example audio tags with verified v3-compatible wording.

- **1.13.1** (2026-06-30) — **Pruned completed project refs after remote v1.13 merge**
  - Removed completed project names, CTAs, and case-study anchors from model-facing S2S text.
  - Deleted obsolete project snapshot references.
  - Moved cross-platform install and version history details behind reference pointers.

- **1.13.0** (2026-06-30) — **/s2s help command guide + router**
  - **NEW**: `commands/help.md` — command map, route-by-goal table, and specific explanations for every `/s2s` command.
  - **NEW**: `slash-commands/s2s-help.md` — portable `/s2s-help` wrapper for Pi/OpenCode-style command menus.
  - **UPDATED**: Capability Router adds Help row at the top.
  - **UPDATED**: Commands table adds `/s2s help`.
  - **UPDATED**: Triggers expanded +5: `s2s help`, `s2s commands`, `fungsi s2s`, `cara pakai s2s`, `command apa`.
  - **GOAL**: users can ask what a command does, describe a goal, and get routed to the smallest matching `/s2s` capability.

- **1.12.0** (2026-06-30) — **/s2s troubleshoot retake triage + model-mechanics diagnosis**
  - **NEW**: `references/seedance-retake-protocol.md` — adopted from `Emily2040/seedance-2.0` (`retake-protocol.md`, MIT, commit `7659cbd`). Adds five verdicts: Keep / Fix in post / Edit / Re-roll / Rewrite, one-variable rule, attempt budget, shot log, and sequence canon.
  - **NEW**: `references/seedance-model-mechanics.md` — adopted from `Emily2040/seedance-2.0` (`model-mechanics.md`, MIT, commit `7659cbd`). Adds eight practical mechanisms: attention budget, familiar prior, negation, trajectory, compounding, reference overlap, detail capacity, joint audio-video.
  - **NEW**: `references/seedance-failure-atlas.md` — adopted from `Emily2040/seedance-2.0` (`failure-atlas.md`, MIT, commit `7659cbd`). Adds sequence/continuation-specific repair table.
  - **UPDATED**: `commands/troubleshoot.md` now triages before regenerating, maps symptom → mechanism → one-variable repair, and outputs a shot log + stop condition.
  - **UPDATED**: Capability Router points `/s2s troubleshoot` at all four troubleshoot references.
  - **UPDATED**: Triggers expanded +5: `retake`, `reroll`, `fix in post`, `keep or regenerate`, `continuation failed`.
  - **GOAL**: stop wasteful blind regenerations. Diagnose first, change one variable, and know when to keep, post-fix, edit, reroll, rewrite, or stop.

- **1.11.0** (2026-06-30) — **/s2s vo-v3 command + ElevenLabs v3 inline audio-tagged VO**
  - **NEW**: `commands/vo-v3.md` — `/s2s vo-v3` capability (Eleven v3 plain-text VO scripts with inline `[lowercase_tags]`, ready to paste into ElevenLabs Studio v3 input or POST to `/v1/text-to-speech` with `model_id: "eleven_v3"`)
  - **NEW**: `references/elevenlabs-vo-v3-tags.md` — verified v3 audio tag list (emotions, delivery, reactions, pacing/cognitive) + v2 SSML→v3 migration table. Verified against official sources: `elevenlabs.io/blog/v3-audiotags`, `blog/eleven-v3-audio-tags-expressing-emotional-context-in-ai-speech`, `blog/eleven-v3-audio-tags-precision-delivery-control-for-ai-speech`, `blog/eleven-v3`, `help.elevenlabs.io/hc/en-us/articles/35869142561297`
  - **NEW**: `assets/vo-script-template-v3.txt` — blank plain-text template (4-segment UGC arc pre-tagged)
  - **NEW**: `slash-commands/s2s-vo-v3.md` — `/s2s vo-v3` slash command entry
  - **UPDATED**: Capability Router adds "VO v3" row after Ads
  - **UPDATED**: Reference Library adds "Voiceover / ElevenLabs v3 References" subsection
  - **UPDATED**: Commands table adds `/s2s vo-v3` entry
  - **UPDATED**: Triggers expanded +10 keywords: `elevenlabs v3`, `eleven v3`, `v3 audio tags`, `v3 voice`, `v3 pause`, `expressive voice v3`, `elevenlabs v3 script`, `voice acting v3`, `v3 inline tags`, `bikin script eleven v3`
  - **UPDATED**: SKILL frontmatter description adds ElevenLabs v3 to backend list + `/s2s vo-v3` to commands list
  - **GOAL**: complete the audio side of the production loop. `/s2s motion` covers video; `/s2s ads` covers ad motion; `/s2s vo-v3` covers Eleven v3 voiceover. Pairs with `/s2s bundle` to ship complete ad package.
  - **WHY v3-only**: PVC optimization pending, IVC/Voice Design preferred per official blog. v3 is the most expressive model — `[whispers]`, `[laughs]`, `[sighs]`, `[pause]`, `[emphasized]`, `[short pause]`, `[long pause]` etc. enable voice-acting quality that v2 SSML cannot reach. Tested with sub-agent worker against 3 tone variants (casual mom / hype UGC / calm expert) — all valid, all pass QC, ~40 spoken words per 15s script.

- **1.10.0** (2026-06-18) — **/s2s ads command + dexhunter-patterns-ads.md reference**
  - **NEW**: `commands/ads.md` — `/s2s ads` capability (product/brand/UGC/e-commerce motion prompts, embeds dexhunter's 12-pattern library)
  - **NEW**: `references/dexhunter-patterns-ads.md` — full 12-pattern spec annotated for ads (Pattern 9 E-commerce default, Pattern 3 FX Replication, Pattern 6 Beat-Sync, Pattern 12 Multi-Cut Assembly)
  - **UPDATED**: Capability Router adds "Ads" row
  - **UPDATED**: Reference Library adds "Ad Patterns" subsection
  - **UPDATED**: Commands table adds `/s2s ads` entry
  - **UPDATED**: Triggers expanded +13 keywords: `iklan`, `product video`, `produk video`, `brand content`, `e-commerce`, `showcase`, `promo`, `campaign video`, `UGC ad`, `TikTok shop`, `Shopee`, `Tokopedia`
  - **GOAL**: when user asks for product/brand/e-commerce ad, agent auto-loads dexhunter's quick-prompt patterns instead of generic motion template. Default to Pattern 9 (Product Showcase), escalate to Pattern 6/3/12 when user wants dynamic style.

- **1.9.0** (2026-06-18) — **Voice consistency + 2-3s beat grid + Seam-lock extend pattern**
  - **NEW**: `references/seedance-voice-consistency.md` — `@audio1/2/3` voice reference pattern for multi-clip series with same speaker. 4 patterns (Dialogue Series, Narration, Singing, Accent-Only Carry). Validated from James Sismanes (@JamesSismanes) Jun 2026 Brooklyn gelato truck workflow using `Use @audio2 to reference [Character]'s established voice and broken English accent`.
  - **UPDATED**: `references/seedance-pattern-library.md` § Pattern 2 Extend — added **Hard Frame Match — Seam-Lock Extension** subpattern (first frame of new clip = last frame of @video1 EXACTLY) + **Audio Carry-Over Specification** (3 layers: BGM/dialogue/foley). Validated from same James Sismanes workflow.
  - **UPDATED**: `references/seedance-motion-vocabulary.md` § Block Sizes — added **Fine-Grain Beat Grid (2-3s segments)** option alongside existing 5s default. For scripted comedy, dialogue, character performance. Documented when-to-use matrix.
  - **GOAL**: incorporate 3 non-trivial techniques from real production workflows. Voice consistency enables series-quality continuity; seam-lock extend enables seamless multi-clip narrative; 2-3s beat grid enables comedic timing precision.

- **1.8.0** (2026-06-18) — **Creative brief intake capability (interview)**
  - **NEW**: `commands/interview.md` — `/s2s interview` command (vague idea → structured brief)
  - **NEW**: `references/creative-brief-intake.md` — 5 core fields (concept/character/location/duration/energy) + 7 extended fields, 3 intake modes (Question-First / Brief-First / Hybrid), Indonesian PSA defaults, OAK workflow defaults, sensitive content guardrails at intake stage
  - **UPDATED**: Capability Router adds "Interview" row at top
  - **UPDATED**: Decision Flowchart routes vague input → `/s2s interview` first
  - **UPDATED**: Reference Library adds "Intake Reference" subsection
  - **UPDATED**: Commands table adds `/s2s interview` entry
  - **UPDATED**: Triggers expanded with 16 new keywords: `bikin video AI`, `bantuin bikin video`, `bikinin video`, `bikinin sesuatu`, `you decide`, `kamu yang tentukan`, `bebas`, `terserah kamu`, `creative brief`, `brief intake`, `vague idea`, `interview video`, `wawancara video`, `PSA kompetisi`, `tugas sekolah video`
  - **GOAL**: adopt Emily's `seedance-interview` sub-skill as first-class capability in s2s. Activates when user has incomplete brief — bridges to other capabilities after intake.

- **1.7.0** (2026-06-18) — **Library restructure: pipeline → capability router**
  - **BREAKING (mental model only, not file structure)**: skill is no longer framed as a 3-step pipeline. New **Capability Router** section maps user intent → references → commands. Each capability is independently invocable.
  - **NEW**: `references/seedance-reference-syntax.md` — adopted from `dexhunter/seedance2-skill` (MIT) — canonical `@`-role binding system with s2s semantic layer (`@[character ref]`, `@[storyboard ref]`, `@[camera ref video]`, etc.)
  - **NEW**: `references/seedance-camera-language.md` — adopted from `dexhunter/seedance2-skill` + `Emily2040/seedance-2.0` v5.5.2 — basic + advanced camera moves, shot sizes, lens vocabulary, POV rules, one-take patterns, time-segmented camera direction, failure modes, cross-model compatibility.
  - **NEW**: `references/seedance-motion-vocabulary.md` — adopted from `Emily2040/seedance-2.0` v5.5.2 — body-part action verbs, object interaction patterns (phone/door/light/wallet), rhythm + beat vocabulary, escalation curves, valence + arousal, cinematic imperfect realism texture pack, anti-slop lexicon, continuity lock vocabulary.
  - **NEW**: `references/seedance-troubleshooting.md` — adopted from `Emily2040/seedance-2.0` v5.5.2 (`seedance-troubleshoot` + `model-mechanics` + `retake-protocol` sub-skills) — 10-category failure-mode taxonomy (identity/camera/action/scene/audio/style/backend/safety/continuity), repair patterns, one-variable retake protocol.
  - **UPDATED**: SKILL.md description now reads "Modular AI video production skill library" instead of "3-step procedural workflow".
  - **UPDATED**: description + triggers in frontmatter expanded to expose new entry points (`/s2s hook`, `/s2s troubleshoot`, `/s2s compose-pattern`, `/s2s bundle`).
  - **UPDATED**: "When to Use" table replaced with full Capability Router + Routing Questions + Decision Flowchart.
  - **BACKWARD COMPAT**: `/s2s pipeline` still works as legacy chained mode (explicit user request only). All existing commands + references unchanged.

- **1.6.5** (2026-06-16) — Sensitive content guardrails + Codex quota + A/B hook pattern
  - NEW section: "Sensitive Content Safety Guardrails" — 6-point production standard for self-harm / suicide / cyberbullying / graphic violence motion prompts.
  - NEW section: "Codex Backend Quota Pitfall" — `gpt-image-2-medium` soft hourly quota, NOT 429. Symptom + 4-step recovery.
  - NEW section: "A/B Hook Variant Pattern" — generate 3 frozen-first-3-seconds storyboard images (one per hook strategy) before committing to motion generation.
  - Learning source: 16 Jun 2026 sensitive-content and multi-clip hook sessions.

- **1.6.3** (2026-06-15) — Character consistency ordering + script-mode cinematic variations + composite script
  - NEW: Pitfall #11 — generating cinematic-variations images WITHOUT character ref first = every image has a different face.
  - NEW: `references/cinematic-variations-script-mode.md`.
  - NEW: `scripts/storyboard_composite.py`.

- **1.6.2** (2026-06-15) — Two-layer style system clarification + script-to-storyboard workflow
  - NEW: Pitfall #9 — two-layer style system confusion.
  - NEW: Pitfall #10 — writing motion prompts without generating Steps 1-2 first.
  - NEW: Script-to-Storyboard Workflow section.

- **1.6.1** (2026-06-14) — Notion prompt alignment + current/final hygiene.

- **1.6.0** (2026-06-14) — Monochrome 4×3 12-panel storyboard style validated.

- **1.5.0** (2026-06-13) — 2026-06-13 v2 patches from competition validation.

- **1.4.0** (2026-06-13) — Multi-clip storyboards + competition deliverable pattern.

- **1.3.0** (2026-06-11) — Koda + Ivanna pattern adoption.

- **1.2.0** (2026-06-08) — Video reverse-engineering + Edge cases & safety + Product sheet variant.

- **1.2.0** (2026-06-07) — Edge cases & safety.

- **1.1.0** (2026-06-07) — Cinematic composition vocabulary.

- **1.0.0** (2026-06-07) — Initial release.
