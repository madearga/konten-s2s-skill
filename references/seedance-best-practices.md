# Seedance Best Practices

High-level guidance for writing better Seedance prompts and avoiding common generation problems.

---

## Best Practices

### Be explicit about reference purpose
Bad:

```text
Reference this video.
```

Good:

```text
Use this video for camera behavior only. Do not copy its actor, location, or grade.
```

### Use prose for action, not fragments only
Turn shot lists into readable action chains:

```text
She enters frame, sets the bowl down, cracks the egg, folds the batter, then turns toward the oven.
```

### Match complexity to duration
- 4-6s: one hook, one payoff
- 8-12s: 3-6 beats
- 12-15s: 6-12 beats max

### Keep emotion two-dimensional
Always define:
- **Valence** — what it feels like
- **Arousal** — how the energy rises/falls over time

### Keep audio intentional
Choose one:
- silent + diegetic foley
- baked-in music with explicit BPM / energy / peak points

---

## Minimal Quality Checklist

- clear subject
- clear action chain
- per-beat camera language
- continuity / geography notes
- explicit constraints
- negative prompts

---

## Recommended Companion Docs

- `seedance-motion-prompt.md`
- `seedance-asset-binding.md`
- `seedance-pattern-library.md`
- `banana-bread-worked-example.md`
