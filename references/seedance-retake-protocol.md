# Seedance Retake Protocol — the iteration economy

**Source / attribution:** Adapted from `Emily2040/seedance-2.0` (`references/retake-protocol.md`, commit `7659cbd`, MIT License, copyright Iamemily2050).

Use this after a generation comes back. Most takes are partially good; don't burn money regenerating what post can fix.

## Five verdicts

| Verdict | When | Next move |
|---|---|---|
| **Keep** | The primary purpose of the shot is delivered and no flaw is fatal. | Lock it, log it, move on. |
| **Fix in post** | Flaw is trim, color, text overlay, sound mix, or a few unstable edge frames. | Do not regenerate; mark post fix. |
| **Edit, don't regenerate** | Composition/timing are right; exactly one layer is wrong and edit mode supports it. | Use the take as source; edit only failing layer. |
| **Re-roll** | Prompt is right; sample was unlucky. | Same prompt, new seed. Max 2–3. |
| **Rewrite** | Same flaw appears in 2+ takes. | Systematic failure: diagnose by model mechanism, change prompt. |

## One-variable rule

Change exactly one thing per retake: one prompt clause, OR seed, OR mode, OR one reference. Never change several at once; otherwise the result teaches nothing.

## Attempt budget

Default budget: **5 standard-tier takes** or **10 fast-tier drafts**. Define “good enough” before take one: primary purpose delivered; secondary issues are postable.

At half budget with no progress on the same flaw, stop and change strategy: different mode, simpler shot, shorter clip, stronger reference, or a real-world/post-production solution.

## Shot log

One line per take:

```text
Take N · changed: [one variable] · seed: [same/new] · verdict: [keep/post/edit/reroll/rewrite] · evidence: [one sentence]
```

Two logged takes with the same flaw = rewrite, not a third lucky attempt.

## Sequence canon

Accepted observed state overrides planned state.

- **Accept:** record observed start/end state; it may become parent source.
- **Accept with deviation:** record deviation; update downstream beats.
- **Repair:** do not advance sequence until the repaired tail/layer is accepted.
- **Reject:** do not update canon and do not use the take as parent source.

If a clip accidentally completes a future beat, mark it completed and remove it from later prompts.

## When not to generate

Dense on-screen text belongs to post. Exact product behavior may belong to real footage. A shot that failed its budget after decomposition needs a different idea, not infinite retakes.
