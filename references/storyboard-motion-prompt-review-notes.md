# Storyboard / Motion Prompt Review Notes

## What this class of task needs to remember
- Treat the generated storyboard as the source of truth once it exists. If there is an older prompt draft in Notion, do not preserve it blindly.
- Keep storyboard prompt and Seedance motion prompt as separate contracts:
  - storyboard prompt = what the storyboard image should look like
  - motion prompt = how Seedance should animate the generated storyboard
- For story-driven competition pieces, the strongest opening is usually **shock-first**: consequence first, origin later.
- If the user asks for "cinematic realistic like real, not AI", the motion prompt must explicitly lock:
  - photorealistic live-action
  - cinematic realism
  - natural skin texture
  - realistic room lighting
  - real lens behavior
  - subtle handheld movement
  - practical shadows
  - not AI-looking / not 3D / not illustration / not poster
- For bedroom / interior sequences, always restate screen direction and room geography in the motion prompt so the model does not flip the layout.
- When a reference image already exists, rebuild the motion prompt from its actual panel order and composition before generating video.

## Useful negative words for realism lock
- 3D render
- illustration
- poster
- fantasy image
- AI-looking
- clean digital sharpness
- glossy synthetic skin
- waxy skin
- over-stylized lighting

## Good review question
Before generating video, ask: "Does this motion prompt recreate the storyboard as real footage, or does it drift back into an old draft?"
