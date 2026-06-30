# /s2s help — Command Guide + Router

Helps users understand what every `/s2s` command does and which command to use next.

**Capability:** Help
**Trigger:** `/s2s help`, `/s2s-help`, "s2s commands", "s2s help", "command apa", "fungsi s2s", "cara pakai s2s"

---

## When to Use

- User asks what `/s2s` can do
- User asks the function of a specific command
- User has an unclear video/asset/audio task and needs routing
- User wants examples for command usage

---

## Behavior

If user asks general help, show the full command map.

If user mentions a command name, explain only that command:
- what it does
- required inputs
- output
- example invocation
- best next command

If user describes a goal instead of a command, route them to the smallest matching command. Ask one clarifying question only if routing is impossible.

---

## Command Map

| Command | Use when | Output |
|---|---|---|
| `/s2s help` | Need command guide or routing | Command explanation + suggested next command |
| `/s2s interview` | Idea is vague / user says "you decide" | Structured creative brief |
| `/s2s storyboard` | Need storyboard image prompt | 12-section storyboard prompt |
| `/s2s character-ref` | Need consistent human/character identity | Character reference-sheet prompt |
| `/s2s product-ref` | Need consistent product image | Product reference prompt |
| `/s2s cinematic-variations` | Need 10 composition options | Shot/composition variants |
| `/s2s motion` | Have brief/ref/storyboard, need video prompt | Seedance motion prompt |
| `/s2s ads` | Product/brand/UGC/e-commerce ad | Ad-optimized motion prompt |
| `/s2s compose-pattern` | Extend/edit/fuse/beat-sync/dialogue/one-take | Pattern-specific motion prompt |
| `/s2s analyze` | Have reference video to reverse-engineer | Video analysis + prompt strategy |
| `/s2s hook` | Need short-form hooks | Hook variants |
| `/s2s troubleshoot` | Output failed / need retake decision | Diagnosis + one-variable repair |
| `/s2s vo-v3` | Need ElevenLabs v3 voiceover script | `.txt` with `[lowercase_tags]` |
| `/s2s bundle` | Need all outputs combined | Bundled markdown package |
| `/s2s pipeline` | Want full end-to-end workflow | Interview → assets → motion package |

---

## Route by Goal

| User says | Route |
|---|---|
| "Aku punya ide tapi belum jelas" | `/s2s interview` |
| "Bikin iklan produk" | `/s2s ads` |
| "Bikin storyboard" | `/s2s storyboard` |
| "Lock karakter / wajah konsisten" | `/s2s character-ref` |
| "Lock produk" | `/s2s product-ref` |
| "Prompt video Seedance" | `/s2s motion` |
| "Banyak opsi shot" | `/s2s cinematic-variations` |
| "Analisa video ini" | `/s2s analyze` |
| "Output gagal / aneh" | `/s2s troubleshoot` |
| "Bikin VO ElevenLabs v3" | `/s2s vo-v3` |
| "Gabungkan semua file" | `/s2s bundle` |
| "Aku mau semuanya dari nol" | `/s2s pipeline` |

---

## Specific Command Explanations

### `/s2s interview`
Turns a vague idea into a usable creative brief. Best first step when user has no script, no shotlist, or says "bebas / terserah".

Example: `/s2s interview bikin iklan botol minum anak 15 detik`

### `/s2s storyboard`
Creates a storyboard image prompt, usually 12-panel / director-strip style.

Example: `/s2s storyboard from this brief: ...`

### `/s2s character-ref`
Creates a consistent character reference prompt. Use before video generation if a human/character must stay consistent.

Example: `/s2s character-ref ibu muda Indonesia, casual home outfit`

### `/s2s product-ref`
Creates product reference prompt variants: hero, multi-angle, lifestyle, in-use, or product sheet.

Example: `/s2s product-ref Pigeon straw bottle 240ml from uploaded product image`

### `/s2s motion`
Creates the actual Seedance-ready video prompt from brief/storyboard/reference assets.

Example: `/s2s motion 15s, 9:16, product demo, use @product_ref`

### `/s2s ads`
Creates product/brand/UGC ad prompts using ad-specific patterns.

Example: `/s2s ads Pigeon straw 240ml, TikTok UGC, casual mom, 15s`

### `/s2s compose-pattern`
Special prompt modes for extend, edit, fuse, beat-sync, dialogue, or one-take.

Example: `/s2s compose-pattern extend this clip, keep last frame seamless`

### `/s2s analyze`
Reverse-engineers a reference video into style, camera, motion, asset needs, and prompt strategy.

Example: `/s2s analyze /path/to/reference.mp4`

### `/s2s hook`
Generates short-form hook ideas before making full prompts.

Example: `/s2s hook skincare product for tired moms`

### `/s2s troubleshoot`
Diagnoses failed output, decides keep/fix/edit/reroll/rewrite, then writes a one-variable repair prompt.

Example: `/s2s troubleshoot face drifted and product changed color on take 2`

### `/s2s vo-v3`
Writes ElevenLabs v3 plain-text VO scripts with inline `[lowercase_tags]`. No SSML/XML.

Example: `/s2s vo-v3 Pigeon straw 240ml, 15s, Indonesian casual mom`

### `/s2s bundle`
Combines prior artifacts into one deliverable package.

Example: `/s2s bundle pigeon bottle ad project`

### `/s2s pipeline`
Runs the full guided flow. Use when user wants the whole production package from scratch.

Example: `/s2s pipeline bikin iklan produk botol minum anak 15 detik`

---

## Output Format

For general help:

```markdown
# /s2s help

## Best command for your goal
[one recommendation]

## Command map
[compact table]

## Examples
[3-5 examples]
```

For specific command help:

```markdown
# /s2s help — [command]

**Use when:** ...
**Inputs needed:** ...
**Output:** ...
**Example:** ...
**Next:** ...
```
