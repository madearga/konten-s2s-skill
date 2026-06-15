# Notion Prompt Alignment Checklist

Use this when the page has both storyboard and Seedance prompts and the canonical version may have changed during review.

## Rule
- The **generated storyboard** is the source of truth for the motion prompt.
- If a newer storyboard changes the hook, composition, or panel order, rebuild the motion prompt from that storyboard.
- Do not leave stale prompt drafts visible on the page.

## Clean-up steps
1. Find the current storyboard prompt block.
2. Find the current motion prompt block.
3. Delete old v2 / debug / duplicate prompt blocks before appending the new ones.
4. Use clear labels like `Current`, `Final`, or `Approved`.
5. Re-read the page after edits and verify only one active storyboard prompt and one active motion prompt remain.

## Reality locks for the common failure mode
When the user says the result looks like AI, tighten the motion prompt with:
- `photorealistic live-action`
- `cinematic realism`
- `natural skin texture`
- `realistic room lighting`
- `real lens behavior`
- `subtle handheld movement`
- `practical shadows`
- `imperfect human motion`
- `lived-in bedroom details`

## What to avoid
- `3D stylized` when the target is live-action realism
- keeping an older Seedance draft after the storyboard has changed
- mixing a monochrome storyboard style with a motion prompt that still describes a different project or older narrative arc
- multiple visible prompt versions on the same page without a clear current label
