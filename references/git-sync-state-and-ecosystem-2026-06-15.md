# S2S Skill — Git Sync State & Ecosystem Comparison (2026-06-15)

> **STATUS WARNING** — This file documents a known-out-of-sync git state. Read
> this before pushing, pulling, or claiming the repo is current. Last verified
> 2026-06-15.

## Git Sync State (Critical)

The local working tree is **AHEAD of** the GitHub remote. The remote was
**force-pushed** at some point, so commit history diverges — a plain
`git pull` will likely produce merge conflicts or rewrite local history.

| | Local | Remote (`origin/main`) |
|---|---|---|
| **Repo** | `madearga/konten-s2s-skill` (private, SSH via `github.com-konten-s2s`) | same |
| **HEAD SHA** | `75d5a10` (v1.2.0) | `e9e78ca` ("feat: enhance seedance skill docs and references") |
| **Total commits visible** | 3 (v1.0.0 → v1.1.0 → v1.2.0) | 6 (force-pushed history) |
| **Last commit date** | older | 2026-06-14 17:19 +0700 |
| **Relationship** | ahead of remote | `git status` reports `local out of date` |

### Uncommitted in working tree (NOT on remote)

```
M  SKILL.md
?? references/competition-deliverable-blueprint.md   # Kreafest 2026 "16 Putaran" case study
?? references/hook-brainstorming-social-issue.md     # 5 hook tiers, 6 eval criteria
?? references/koda-ivanna-patterns-2026-06.md       # 4 reverse-engineered patterns
?? references/monochrome-storyboard-style.md         # 4x3 12-panel DNA (v1.6.0)
?? references/notion-prompt-alignment.md            # canonical version hygiene (v1.6.1)
```

The local `SKILL.md` describes v1.6.1 (with monochrome 4x3 validation, hook
retention pattern, NO TEXT IN GRID CELLS pitfall, predicted-comments QC,
v2 patch checklist) — **none of which exists on the remote**.

### Safe Re-sync Procedure

```bash
# 1. Backup local first
cp -r /root/.hermes/skills/mlops/ai-video-production/storyboard-to-seedance-suite \
      /tmp/s2s-local-backup-$(date +%Y%m%d-%H%M%S)

# 2. Inspect divergence
git -C /root/.hermes/skills/mlops/ai-video-production/storyboard-to-seedance-suite \
    log --oneline --all
git -C /root/.hermes/skills/mlops/ai-video-production/storyboard-to-seedance-suite \
    diff origin/main --stat

# 3. Decide strategy
#    - If remote is the source of truth:  git reset --hard origin/main
#      then re-apply the 5 untracked reference files manually.
#    - If local is the source of truth:  git push --force-with-lease
#      (after backing up remote state somewhere safe).
#    - If both have unique value:  git fetch + manual merge via 3-way diff.

# 4. Verify after sync
git -C /root/.hermes/skills/mlops/ai-video-production/storyboard-to-seedance-suite \
    status
```

**Do not** `git pull` blindly — the force-pushed history means fast-forward
won't work and you'll get an opaque merge state.

---

## Ecosystem Comparison — Kukabot S2S vs Emily2040 vs dexhunter

Three open-source projects target the same niche (Seedance 2.0 / video-prompt
production). For **automation** specifically:

| Skill | Type | Scope | Automation Readiness |
|---|---|---|---|
| **Kukabot S2S** (this skill) | 3-step procedural | 1 SKILL.md + 6 refs + 6 commands + 6 tests | **5/5** — slash cmds, multi-clip, cost tracking, bundle output, resume |
| **Emily2040/seedance-2.0** | Skill OS | 24 skills + 40+ refs + 8 role artifacts + 6 langs + governance | **1/5** automation / **5/5** governance, IP-safe, multilingual |
| **dexhunter/seedance2-skill** | Quick prompt guide | 1 SKILL.md + 1 zh variant | **0/5** automation / **5/5** lightweight, transferable |

### What to take from each

| From | Take | Why | Effort |
|---|---|---|---|
| **dexhunter** | `@Image1` / `@Video1` / `@Audio1` reference syntax card | 3 lines, compact, transferable to Veo/Kling | 5 min — add to `seedance-motion-prompt.md` |
| **Emily** | `cinematography-shot-language` cross-link | S2S has `director-strip-7-track.md` but Emily has extra depth | 5 min — add See-Also link |
| **Emily** | `anti-slop-lexicon` guard pattern | Catches "stunning", "breathtaking", "vibrant" — generic AI tells | 30 min — add checklist to motion prompt template |

**Do NOT** install Emily's full set (24 skills + 40 refs = bloat), do NOT
replace S2S with Emily (regression — S2S is production-validated), do NOT
build a "hybrid" of all three (maintenance nightmare).

### Decision Matrix — which to reach for

| Use case | Pick |
|---|---|
| UGC ad single clip (8-15s) | **Kukabot S2S** |
| Multi-clip narrative (1:45+ like Kreafest) | **Kukabot S2S** |
| Monochrome 12-panel grid (16 Putaran-style) | **Kukabot S2S** |
| Batch 50+ videos/day | **Kukabot S2S** + loop script |
| Cross-harness (Hermes + OpenCode + Claude Code) | **Kukabot S2S** (`install.sh` handles all) |
| IP-sensitive commercial (brand/celebrity likeness) | **Emily2040** |
| Multi-language video prompt (6 langs) | **Emily2040** |
| Quick 1-off prompt / model exploration | **dexhunter** |

---

## Reference Artifacts (Generated 2026-06-15)

Two self-contained HTML comparison files were produced during this research
session. They live at:

- `/root/seedance-skill-comparison.html` — Emily2040 vs dexhunter
  general comparison (radar chart, bar chart, architecture SVG, file tree)
- `/root/s2s-vs-emily-vs-dex-automation.html` — automation-focused
  3-way comparison (score bars, radar, workflow side-by-side, cost matrix)

Both are dark-theme, self-contained (Chart.js via CDN), no build step. They
can be regenerated by running the comparison analysis workflow (see
`creative/claude-design` skill, "Comparison Deck" pattern).

---

## Source Verification

- `madearga/konten-s2s-skill` — git remote verified 2026-06-15 via
  `git ls-remote origin` and `git remote show origin`
- `Emily2040/seedance-2.0` — v5.5.2 (2026-06-12), MIT, 24 skills + 40 refs
- `dexhunter/seedance2-skill` — 4 commits, low activity, MIT
- All agent-reach reference files (ugc-video-pipeline-2026.md,
  veo-3.1-lite-best-practices.md, character-consistency-pipeline-2026.md)
  verified May-June 2026 dates
