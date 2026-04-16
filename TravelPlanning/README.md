# travel-planning

A Claude skill for planning solo travel. Encodes personal constraints, preferences, and active trip context so every itinerary output is personalized from the first message — no generic tourist advice.

---

## Overview

This skill activates whenever travel planning is in scope — building itineraries, researching destinations, estimating budgets, or working through logistics. It is pre-loaded with hard constraints (private rooms, BNA routing, endurance activity anchors, value-over-luxury mindset) and includes reference files for active trips.

All planning defaults to **solo travel** unless a specific trip is noted as having a companion.

---

## Trigger

Context-based. Activates on:

- Phrases like `trip to`, `travel to`, `planning a visit`, `what should I do in`
- Questions about flights, hotels, itineraries, visas, border crossings, or ferry routes
- References to any of the active trips listed below
- Budget comparison or destination research requests

---

## Hard Constraints

| Constraint | Rule |
| --- | --- |
| Accommodation | Private rooms only — no dorms, no shared baths |
| Home airport | BNA (Nashville) — all flights route through BNA unless stated otherwise |
| Travel default | Solo — budgets and logistics are for one person |
| Budget mindset | Value-optimized — best experience per dollar, not budget-backpacker and not luxury |
| Activity anchor | Endurance or adventure activity anchors every trip when one is available |

---

## Reference Files

Trip-specific research files are stored in the `references/` folder and loaded when relevant. The skill works for any destination — reference files simply pre-load context for trips already in planning.

| File | Contents |
| --- | --- |
| `references/europe-2026.md` | TdF Grand Départ (Barcelona), Running of the Bulls (Pamplona), Morocco extension (Tangier, Chefchaouen), Madrid return, Portugal option, budget estimate, booking priority order |
| `references/colorado-2026.md` | Longs Peak, Grays + Torreys, Bierstadt summit profiles, acclimatization sequence, Theodore Roosevelt NP logistics, Half Dome status, gear checklist, budget estimate |

---

## Output Format

**Full itinerary requests** produce a day-by-day breakdown with accommodation type and price range, transport between cities with method and cost, budget breakdown by category, and logistics flags (visas, booking windows, crowd warnings).

**Single destination or activity queries** are answered directly without the full itinerary structure.

**Budget comparisons** use a side-by-side table with per-day costs and totals.

---

## File Structure

```
travel-planning/
├── README.md
├── SKILL.md
└── references/
    ├── europe-2026.md
    └── colorado-2026.md
```
