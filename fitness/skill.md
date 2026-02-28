---
name: fitness-log
description: Track workouts, log fitness progress, generate Facebook posts from workout data, adjust the training program, and summarize progress over time. Always trigger immediately when the user's message starts with "fit" or "workout". Also trigger when the user mentions logging a session, hitting a PR, updating stats, or asking about their program or fitness progress.
---

# Fitness Log Skill

Track and manage Mick's fitness program. He is 51 years old, trains at YMCA Springfield TN, and has home equipment including a trap bar, pull-up bar, dumbbells, and bench. He is on TRT at 737 ng/dL managed by a urologist. He has a back limitation requiring zero axial loading, and a 2002 shoulder injury he pushes through. He had bariatric surgery and manages nutrition carefully.

## Current Stats

- **Bodyweight**: 199 lbs
- **Body Fat**: 18.7%
- **Goal**: Maximum muscle growth, targeting 15% body fat

## Current Lift Numbers (Personal Records)

| Exercise | Weight |
|---|---|
| Leg Press | 790 lbs |
| Calf Raise | 1,108 lbs |
| Chest Press | 180 lbs |
| Lateral Pulldown | 180 lbs |
| Seated Row | 180 lbs |
| Ab Crunch | 195 lbs |
| Back Extension | 220 lbs |
| Torso Oblique | 207.5 lbs |
| Press Down | 210 lbs |
| Farmers Carry | 210 lbs |
| Bicep Curl | 105 lbs |
| Hammer Curl | 50 lbs |
| Face Pull | 57.5 lbs |
| Lateral Raise | 30 lbs |
| Pull-Ups | 8 reps |

## 4-Day Program Structure

**Sunday: Day 1 — Upper A (Chest, Back, Shoulders)**
**Monday: Day 2 — Lower A (Quads, Hamstrings, Calves)**
**Tuesday: Day 3 — Upper B (Arms, Back, Delts)**
**Wednesday: Day 4 — Lower B (Glutes, Hamstrings, Posterior)**
**Thursday/Friday/Saturday: Rest**

Sessions are 2 hours. Machine-based with some free weights. No axial loading on the back.

## Primary Workflow

When triggered with "fit" or "workout", determine what Mick needs and handle it immediately without asking unnecessary questions. Common workflows:

### Log a Workout

When Mick shares what he did, record the session with exercises, sets, reps, and weights. Acknowledge any PRs, note any regressions, and flag anything that looks off (e.g., skipped muscle groups, excessive volume on a previously injured area).

Format the log summary like this:

**Date | Day X — Focus**
- Exercise: weight x sets x reps (note if PR)
- Exercise: weight x sets x reps
- PRs hit: [list]
- Notes: [anything worth flagging]

### Generate a Facebook Post

When Mick wants to post about a workout, apply the same rules as the fbp skill: no hyphens or em dashes, no emojis, no quotes, first person casual tone, 2 to 3 hashtags, lead with a specific number or milestone. See Facebook Post voice guidelines — write like he talks, not like a fitness influencer.

Good example: "Hit 790 on leg press today. Started this program three months ago at 465. The numbers don't lie."

Bad example: "Absolutely crushed leg day today! So proud of my progress on this fitness journey!"

Use hashtags from: #StrengthTraining #MuscleBuilding #FitnessJourney #Triathlon #Cycling #ActiveLifestyle

### Adjust the Program

When Mick asks about changing an exercise or adding volume, consider his constraints: no axial loading, shoulder caution, TRT-enhanced recovery. Suggest machine alternatives when free weight movements are risky. Do not recommend barbell lunges under any circumstances.

### Summarize Progress

When asked for a progress summary, compare current lift numbers against the baseline below and calculate percentage improvements. Note body composition changes and highlight standout gains.

## Starting Baseline (Program Start)

| Exercise | Starting Weight |
|---|---|
| Leg Press | 465 lbs |
| Chest Press | 165 lbs |
| Pull-Ups | 0 reps |
| Seated Row | 160 lbs |
| Lateral Pulldown | 160 lbs |

## Safety Rules

- Zero axial loading on the spine — no barbell squats, barbell lunges, or overhead barbell press
- Flag any calf volume exceeding 5 sets (Achilles protection)
- Note shoulder pain if mentioned and suggest machine substitutions
- Never recommend anything that contradicts back safety

## Notable Achievements

- Pull-ups from 0 to 8 reps in 3 months
- Leg press improved 75% from baseline
- Gained 6 lbs lean muscle mass
- Body fat reduced from 18.3% to 18.7% (currently trending down toward 15% goal)

## Tone

When logging or summarizing, be direct and data-focused. No motivational fluff. State what happened, note what improved, flag what needs attention. Mick knows what he is doing — treat him like an athlete, not a beginner.