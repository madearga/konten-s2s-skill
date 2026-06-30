# Seedance `@` Reference Syntax — Role Binding System

**Source:** Adopted from `dexhunter/seedance2-skill` (MIT). Standardized for s2s skill v1.7.0+ to remove ambiguity when multiple assets are attached to one motion prompt.

---

## Why This Exists

When you upload N images / videos / audio to Seedance 2.0 without telling it what each one is FOR, the model assumes all attachments contribute equally to identity, environment, motion, and style. Result: faces bleed into backgrounds, motion style bleeds into identity, camera behavior bleeds into scene. **Bind each attachment to ONE job.**

---

## The `@` System (Seedance Native)

Seedance 2.0 reads `@Image1`, `@Image2`, `@Video1`, `@Audio1` as **asset placeholders**. You MUST state what each one does in your prompt. Without role assignment, the model guesses — and guesses wrong.

### Role Assignment Syntax

| Purpose                       | Example Syntax                                          |
|-------------------------------|---------------------------------------------------------|
| First frame                   | `@Image1 as the first frame`                           |
| Last frame                    | `@Image2 as the last frame`                            |
| Subject / character identity  | `@Image1's character as the subject`                   |
| Scene / environment           | `scene references @Image3`                             |
| Camera movement               | `reference @Video1's camera movement`                  |
| Action choreography           | `reference @Video1's action choreography`              |
| Effects / transitions         | `completely reference @Video1's effects and transitions` |
| Rhythm / pacing               | `video rhythm references @Video1`                      |
| Audio / BGM                   | `BGM references @Audio1`                               |
| Sound effects                 | `sound effects reference @Video3's audio`              |
| Product detail                | `product details reference @Image3`                    |
| Outfit / wardrobe             | `wearing @Image2's outfit`                             |
| Voice / narration tone        | `narration tone references @Video1`                    |
| Typography / fonts            | `font references @Image2's font`                       |

### Multi-Reference Combination Example

```text
@Image1's character as the subject, reference @Video1's camera movement
and action choreography, BGM references @Audio1, scene references @Image2
```

This sentence tells Seedance: "Person comes from Image1, camera and motion come from Video1, music comes from Audio1, the world is Image2." Four attachments, four jobs — zero ambiguity.

---

## The s2s Skill's Own Role Vocabulary

We extend Seedance's native `@` system with a **semantic layer** for our pipeline. Each role gets a stable name and a stable use case.

| Role Tag                    | Asset Type      | Use Case                                        | Example Source                          |
|-----------------------------|-----------------|-------------------------------------------------|-----------------------------------------|
| `@[storyboard ref]`         | Image           | Director-approved panel plan                    | `/s2s storyboard` output                |
| `@[character ref]`          | Image           | Identity lock across clips                      | `/s2s character-ref` output             |
| `@[product ref]`            | Image           | Product continuity lock                         | `/s2s product-ref` output               |
| `@[first frame ref]`        | Image           | Hard opening frame                              | Manual selection                        |
| `@[last frame ref]`         | Image           | Hard landing frame (FLF2V mode)                 | Manual selection                        |
| `@[camera ref video]`       | Video           | Camera behavior only (no identity bleed)        | Reference clip                          |
| `@[action ref video]`       | Video           | Movement choreography only                      | Reference clip                          |
| `@[fx ref video]`           | Video           | Transitions / VFX language only                 | Reference clip                          |
| `@[rhythm ref video]`       | Video           | Beat map / cut timing only                      | Reference clip                          |
| `@[bgm ref audio]`          | Audio           | Background music bed                            | Reference audio                         |
| `@[sfx ref video]`          | Video           | Sound effects extraction only                   | Reference clip                          |
| `@[voice ref video]`        | Video           | Narration tone / cadence                        | Reference clip                          |

### When to Use Which Role

- **Single character, single scene**: `@[character ref]` + `@[storyboard ref]` (2 attachments)
- **Multi-clip narrative**: `@[character ref]` (once) + `@[storyboard ref]` per clip + `@[bgm ref audio]` (once across all clips)
- **Camera replication**: `@[character ref]` + `@[storyboard ref]` + `@[camera ref video]` (camera behavior extracted from reference)
- **Action choreography replication**: `@[character ref]` + `@[storyboard ref]` + `@[action ref video]`
- **Music-driven cuts**: `@[character ref]` + `@[storyboard ref]` + `@[rhythm ref video]` + `@[bgm ref audio]`
- **Voice-over narration**: `@[character ref]` + `@[storyboard ref]` + `@[voice ref video]`
- **Style replication**: `@[storyboard ref]` + `@[fx ref video]` (no identity needed)

---

## Anti-Pattern: Don't Do This

❌ **Uploading 5 images with no role labels**
```text
@Image1 @Image2 @Image3 @Image4 @Image5
```
Seedance will mix all five into identity/scene/style chaos. Result: melted face, wrong room, wrong palette.

❌ **Uploading one video and expecting it to ONLY contribute camera**
```text
@Video1's camera movement
```
If you don't say "ONLY camera", Seedance may also lift identity, wardrobe, and audio from the video.

❌ **Uploading product image as if it were character**
```text
@Image1's character as the subject
```
Where Image1 is a soda can. Seedance will try to animate the can as a person.

---

## Anti-Pattern: Camera + Action on Same Video Reference

If a single reference video has both the camera work AND the action choreography you want, you CAN reference it twice:

```text
reference @Video1's camera movement,
reference @Video1's action choreography
```

This is the **multi-role single-source** pattern. Seedance handles it cleanly.

---

## Compatibility Notes

- Works on Seedance 2.0 (Jimeng/Dreamina), Volcengine `doubao-seedance-2-0-260128`, Runway `seedance2`
- Generalizes to Veo 3.1 Lite and Kling 3.0 if you substitute `@Image1` → "first attached image" in plain prose
- Pixazo's Seedance endpoint accepts the same syntax

---

## s2s Skill Integration

This is the **canonical role vocabulary** used in:
- `references/seedance-motion-prompt.md` — `ASSET ROLE BINDING` block
- `references/seedance-asset-binding.md` — legacy aliases (still supported)
- `commands/motion.md` — intake checklist
- `commands/pipeline.md` — Step 3 prompt construction

When you see `@[character ref]` in any s2s artifact, replace it with the actual asset ID (e.g., `@Image2`) when you paste the prompt into Seedance.

---

## Reference

- dexhunter/seedance2-skill — `SKILL.md` (zh/SKILL.md mirror) — Section "Core Syntax: The `@` Reference System" + "Role Assignment Syntax"
- Emily2040/seedance-2.0 — v5.5.2 — `references/reference-workflow.md` (multimodal reference role mapping)
