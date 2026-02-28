# fitness-log

A Claude AI skill for tracking workouts, logging fitness progress, and generating Facebook posts from session data. Triggered by typing `fit` or `workout` at the start of any message.

## Trigger

Start any message with `fit` or `workout` to activate this skill. Also triggers when mentioning logging a session, hitting a PR, updating stats, or asking about the program or fitness progress.

```
fit logged leg press 790 lbs today, 3 sets of 10
workout hit a new PR on chest press, 185 lbs
fit how much has my leg press improved since I started?
```

## What it does

This skill handles four primary workflows without asking unnecessary questions up front.

**Log a workout** — Record exercises, sets, reps, and weights. Acknowledge PRs, flag regressions, and call out anything worth noting such as skipped muscle groups or excessive volume near an injury site.

**Generate a Facebook post** — Write a post from workout data using the same rules as the fbp skill. Direct, first person, no emojis, no hyphens or em dashes, specific numbers up front, 2 to 3 hashtags.

**Adjust the program** — Suggest exercise swaps or volume changes within safety constraints. Machine alternatives preferred over free weights for any movement with axial loading or shoulder risk.

**Summarize progress** — Compare current lift numbers against baseline, calculate percentage improvements, and highlight standout gains.

## Athlete Profile

| Attribute | Value |
|---|---|
| Age | 51 |
| Bodyweight | 199 lbs |
| Body fat | 18.7% |
| Goal | Maximum muscle growth, targeting 15% body fat |
| Training location | YMCA Springfield TN + home gym |
| Home equipment | Trap bar, pull-up bar, dumbbells, bench |
| TRT | 737 ng/dL, managed by urologist |

## Program Structure

4-day split, 2-hour sessions, machine-based with some free weights.

| Day | Focus |
|---|---|
| Sunday | Upper A — Chest, Back, Shoulders |
| Monday | Lower A — Quads, Hamstrings, Calves |
| Tuesday | Upper B — Arms, Back, Delts |
| Wednesday | Lower B — Glutes, Hamstrings, Posterior |
| Thursday through Saturday | Rest |

## Current PRs

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

## Starting Baseline

| Exercise | Starting Weight |
|---|---|
| Leg Press | 465 lbs |
| Chest Press | 165 lbs |
| Pull-Ups | 0 reps |
| Seated Row | 160 lbs |
| Lateral Pulldown | 160 lbs |

## Safety Rules

- Zero axial loading on the spine — no barbell squats, barbell lunges, or overhead barbell press
- No barbell lunges under any circumstances
- Flag calf volume exceeding 5 sets (Achilles protection)
- Note shoulder pain if mentioned and suggest machine substitutions

## Notable Achievements

- Pull-ups from 0 to 8 reps in 3 months
- Leg press improved 75% from baseline (465 to 790 lbs)
- Gained 6 lbs lean muscle mass
- Body fat trending down toward 15% goal

## Workout Log Format

```
Date | Day X — Focus
- Exercise: weight x sets x reps (PR if applicable)
- Exercise: weight x sets x reps
PRs hit: [list]
Notes: [anything worth flagging]
```

## Facebook Post Examples

Good: "Hit 790 on leg press today. Started this program three months ago at 465. The numbers don't lie."

Bad: "Absolutely crushed leg day today! So proud of my progress on this fitness journey!"

Hashtags used: #StrengthTraining #MuscleBuilding #FitnessJourney #Triathlon #Cycling #ActiveLifestyle
