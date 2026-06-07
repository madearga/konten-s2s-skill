# 12-Section Storyboard Template (GPT Image 2)

Drop this into GPT Image 2 (or any image-gen model) as a single prompt.
Replace `[PLACEHOLDERS]` with your content. Keep section order intact.

---

```
Create a 16:9 image.

[PROJECT CARD]
Create a compact designed masthead, not a table.
TITLE: [SHORT PUNCHY TITLE]
META LINE: [vibe in slash-separated tags, e.g., warm kitchen / high-rhythm smash-cut / loopable match]
PRIORITY: [3-5 must-haves as bullet list]
MICRO BRIEF: [1-sentence story arc, e.g., "C1 turns [activity] into a [X], starting with [hook] and ending on [payoff]."]

[CONTINUITY HEADER]
SEQUENCE ID: [unique-tag-with-panel-count]
REFERENCE PRIORITY: [Provided image controls C1 face, body, wardrobe, proportions, hair, silhouette]; [this storyboard controls staging, motion, geography, camera order, rhythm].

[SCENE PACKET]
PREMISE: [What happens in plain prose]
LOCATION: [Geography with screen direction: window screen left, X rear/right, Y foreground, Z left, W right]
START -> END: [Narrative arrow]
ACTION CHAIN: [comma-separated beats with arrows: beat1 -> beat2 -> beat3]
PROP / EFFECT STATE: [full prop inventory including state changes]
MUST READ: [Tone/POV notes that override defaults]

[CHARACTER SANITIZATION]
C1: [age], [hair], [build], [outfit], [posture], [movement quality].
Remove contradictory traits, invisible psychology, excessive costume detail, and backstory that cannot appear in a panel.

[IDENTITY CONSISTENCY]
Identity reference controls [face/body/wardrobe/proportions/hair/silhouette]; storyboard controls [staging only].
Keep [key visual anchors] consistent.
Do not redesign, age-shift, beautify, duplicate, merge, or add another character.

[STORYBOARD PURITY]
Panel images are visual-only low-detail monochrome light-gray rough sketches.
Put panel numbers, beat names, and lens tags in the header strip OUTSIDE each panel image.
No color, labels, arrows, captions, subtitles, logos, watermarks, timing marks, diagrams, UI, ghost poses, duplicate bodies, or technical overlays inside panels.

[MASTER SHOT RULE]
P02 shows full playable geography: [window screen left, island center, sink left, C1 at center, teal cabinets rear/right, oven screen right, X path].
OR (for loops) "No wide master shot: this is intentionally intimate. P02 anchors waist-up layout with C1 at counter, [bokeh] background."

[EMOTIONAL ARC]
[State 1] -> [state 2] -> [state 3] -> [state 4] -> [state 5], shown through [camera distance, body cues, prop states].

[STYLE LOCKS]
STYLE LOCK: [visual style: "clean monochrome rough-sketch panels on off-white paper, light-gray gesture lines, simplified shapes, no rendered lighting"]
EFFECT LOCK: [effects inside panels in monochrome: "flour dust, steam, crumbs are simple shapes only; final-video intent is warm daylight bloom, soft steam, glossy batter folds"]
ENVIRONMENT LOCK: [set dressing: "large window screen left, stone counter island foreground, teal cabinets rear/right"]

[SPATIAL CONTINUITY LOCK]
P[##], P[##], P[##] share the same [location] layout. C1 stays [position], mostly [back-to-camera / facing] except [P## exception]. [Subject] moves [path]. [Key elements] remain [screen direction]. Allowed changes: [camera distance, height, pose, gaze, prop state, steam, crumb state]. Forbidden: new locations, redesigned rooms.

[DIRECTOR STRIP]
Bottom animatic track board aligned to panel columns. Tracks: BEAT LINE, CAMERA PATH, ACTION PATH, RHYTHM TRACK, ESCALATION MAP, STATE TRACK, STYLE TRACK. Use shot chips, thin lines, rhythm blocks, small intensity bars, one-to-three-word labels. No seconds or timestamps.

RHYTHM TRACK format: `RHY P##: [hold|slow reveal|build|burst|impact|pause|recover|final hit] / [short block|medium block|long block] / [clean beat|match beat|smash beat|held beat|whip beat]`.

ESCALATION MAP format: `ESC P##: [L1 calm|L2 tension|L3 rise|L4 surge|L5 peak] / [flat|rise|spike|drop|release|unresolved]`.

PANEL HEADERS: P[##] / [focal length]mm [shot type] / [beat name] -> P[##] / [focal length]mm [shot type] / [beat name] -> ...

CAMERA + LENS PLAN: P[##] [camera move] -> P[##] [camera move] -> ...

ACTION PATH: P[##] [physical action] -> P[##] [physical action] -> ...

RHYTHM TRACK: P[##] RHY P[##]: [option] / [option] / [option] -> P[##] RHY P[##]: [option] / [option] / [option] -> ...

ESCALATION MAP: P[##] ESC P[##]: [L#] / [option] -> P[##] ESC P[##]: [L#] / [option] -> ...

STATE TRACK: P[##] [state] -> P[##] [state] -> ...

STYLE TRACK: P[##] [visual signature] -> P[##] [visual signature] -> ...

[SEQUENCE]
Grid: [N] panels in a compact [MxN] cinematic storyboard sheet; [artwork style stays monochrome rough sketch] while the director strip shapes [arc description] with [key visual beats], [transitions], and [finale].
```

---

## Companion: Seedance 2.0 Video Prompt Template

After generating the storyboard image, copy the relevant text into Seedance:

```
Use @[storyboard ref] as the authoritative director-approved storyboard blueprint for the sequence.
Treat every storyboard panel as a consecutive shot within a single cinematic sequence.
Follow panel order exactly and do not invent alternative coverage.
Do not render the storyboard sheet itself.
[Exclude: panel borders, headers, text, labels, project card, director strip, style swatches, page layout]
Preserve camera placement, framing, lens intent, shot scale, character staging, screen direction, environmental geography, prop placement, action choreography, continuity and emotional escalation shown by the storyboard.
The storyboard is the primary source of truth for visual storytelling.
Recreate the filmed sequence implied by the panels rather than the physical storyboard artwork.

Use @[character ref] as the authoritative C1 character reference.

EMOTIONAL GUIDANCE: Valence: [3-5 adjectives]. Arousal: [arc in arrow notation].
AUDIO: [No background music or score. Use only diegetic ambience, foley, impacts, texture, and silence.]
       OR
       [Music: [genre] with [BPM]; diegetic foley for [key actions]; peak at P##, drop at P##]

PANEL BEATS:
P01: [Shot description with motion + camera move + foley]. [emotional beat]. [audio cue].
P02: [...]
...
P##: [Final shot]. [Loop match if applicable: "the new crumb lands near her lip like P01 for a hard loop."]
```

---

## Example: Cooking Montage (Filled-In)

See `references/banana-bread-worked-example.md` for a fully-filled example — 16-panel sequence + 14-panel loop, all 12 sections completed.

---

## Common Pitfalls When Filling This Template

1. **Forgetting screen direction in LOCATION** — without it, Seedance flips geometry
2. **Banning color inside panels (yes, you want monochrome)** — let the model render color in video, not in storyboard
3. **Skipping MASTER SHOT** — every storyboard needs P02 = geography anchor
4. **Loose RHYTHM/ESCALATION brackets** — always include the bracket options explicitly
5. **Vague EMOTIONAL GUIDANCE** — split into Valence + Arousal, never just "happy"
6. **Forgetting loop endpoint = startpoint** for loopable clips
7. **Copy-pasting director strip text into video prompt** — yes, do this. The image is documentation; the text is the contract
8. **Trying to make one storyboard do 60s of content** — split into multiple shorter storyboards, reuse `@[character ref]`
