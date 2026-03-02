# Obsidian Workout Export Skill

Export logged workout sessions from Claude chat history into Obsidian-ready Markdown files with a single command.

---

## Trigger

Type **`owd`** in any Claude chat that contains workout data.

Additional triggers: `export workout`, `obsidian workout`, `save workout to obsidian`, `workout to obsidian`, `log to obsidian`

---

## What It Does

When triggered, the skill locates the workout data, extracts every logged data point, and writes a clean `.md` file ready to drop into your Obsidian `WorkoutData/` folder.

**Data captured:**

- Exercises with weight, sets, and reps
- PR flags per exercise
- Body stats (bodyweight and body fat %)
- Session notes and flags (regressions, injuries, missed exercises)

**File naming:** The `.md` file is named after the date of the chat containing the workout data, not the current date. This keeps your Obsidian vault timeline accurate.

---

## How It Works

1. Checks the current conversation for workout data first
2. If none found, searches Claude chat history for the most recent logged session
3. Extracts all completed exercises, stats, PRs, and notes
4. Builds a Dataview-compatible Markdown file
5. Delivers a download link — drop the file into `WorkoutData/` in Obsidian

---

## Output Format

```
WorkoutData/
└── YYYY-MM-DD.md
```

Each file contains:

- Session header with date, day number, and focus
- Body stats table (if logged)
- Exercise table with weight, sets, reps, and PR indicators
- PRs hit list
- Notes and flags section

---

## Rules

- Never fabricates data — if it was not in the chat, it is omitted or flagged
- Sections with no data are excluded from the file entirely
- Tables are formatted for Obsidian Dataview compatibility
- No fluff — the file is a data record, not a journal

---

## Program Context

Built for the **15 Percent Body Fat Project** — Mick's 4-day training program tracked through Claude chat history at the YMCA Springfield, TN.