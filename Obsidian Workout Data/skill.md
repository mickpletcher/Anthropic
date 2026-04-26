---
name: obsidian-workout-export
description: Export workout data to an Obsidian-formatted Markdown file. Always trigger immediately when the user types "owd" — this is the primary shortcut to activate this skill. Also trigger on "export workout", "obsidian workout", "save workout to obsidian", or any variation of exporting workout data to Obsidian. When triggered, read the workout data from the CURRENT conversation first before searching chat history. The file is named after the date of the chat containing the data.
---

# Obsidian Workout Export Skill

Export Mick's logged workout into a Markdown file for his Obsidian vault WorkoutData folder.

## Primary Trigger

**`owd`** — When Mick types this in a chat that contains workout data, immediately export that session to a `.md` file. No clarifying questions. Execute immediately.

Other triggers: "export workout", "obsidian workout", "save workout to obsidian", "workout to obsidian", "log to obsidian"

## Step-by-Step Workflow

### Step 1 — Locate the Workout Data

**Always check the current conversation first.** If the current chat contains logged workout data (exercises, sets, reps, weights), use it directly — do not search chat history.

If the current chat does NOT contain workout data, use `conversation_search` to find the most recent session:
- "workout log sets reps"
- "leg press chest press fitness"
- "Day 1 Day 2 upper lower workout"

Note the `updated_at` date from whichever chat contains the data — this is the **filename date**.

### Step 2 — Extract All Data

Pull every available data point from the session:

**Session Info**
- Date of the workout (from chat content or updated_at)
- Day number and focus (e.g., Day 2 — Lower A)

**Exercises** — every completed exercise:
- Exercise name
- Weight
- Sets
- Reps
- PR flag (yes/no)

**Body Stats** (if present)
- Bodyweight (lbs)
- Body fat %

**PRs Hit**
- Each PR with the weight/reps achieved

**Session Notes & Flags**
- Regressions, injuries, missed exercises, anything flagged

### Step 3 — Build the Markdown File

**Filename:** `YYYY-MM-DD.md` using the date of the chat containing the data.

```markdown
# Workout Log — [DAY NAME & FOCUS]
**Date:** YYYY-MM-DD
**Program:** 15 Percent Body Fat Project

---

## Body Stats
| Metric | Value |
|---|---|
| Bodyweight | XXX lbs |
| Body Fat | XX.X% |

---

## Session — [Day X: Focus]

| Exercise | Weight | Sets | Reps | PR? |
|---|---|---|---|---|
| Exercise Name | XXX lbs | X | X | ✅ / — |

---

## PRs Hit
- Exercise: XXX lbs / X reps

---

## Notes & Flags
- [Factual session notes, regressions, flags]

---

*Exported to Obsidian WorkoutData/ on YYYY-MM-DD*
```

**Omit sections with no data** — if no body stats were logged, remove that section. If no PRs, write "None this session."

### Step 4 — Create and Present the File

1. Save to `/mnt/user-data/outputs/YYYY-MM-DD.md` using the source chat date
2. Use `present_files` to deliver the download link
3. Confirm: filename, session date, and that it goes into `WorkoutData/` in Obsidian

## Rules

- **Never fabricate data.** If a field wasn't in the chat, omit it or flag it as unlogged.
- If sets/reps are ambiguous, note exactly what was logged.
- If weight is missing for an exercise, note as "bodyweight" or "unlogged."
- No fluff. This is a data record, not a journal entry.
- Markdown tables must be Dataview-compatible for Obsidian query use.