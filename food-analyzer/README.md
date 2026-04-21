# Food Analyzer Skill

Claude skill for analyzing food photos, nutrition labels, and ingredient lists with nutritional breakdowns, blood sugar impact, medication interaction warnings, meal timing guidance, ultra-processed food scoring, and healthier alternative suggestions.

## Overview

Food Analyzer gives Claude the ability to interpret images of real food, plated meals, packaged product labels, and ingredient lists. A single photo returns a structured report covering macros, FDA percent daily values, glycemic index and load, NOVA ultra-processed food classification, medication and supplement interaction warnings, meal timing suitability, and actionable swap suggestions when the food scores poorly.

The skill targets a standard FDA 2,000 kcal daily reference diet. All percent daily values match what is printed on Nutrition Facts labels in the United States. Users can declare personal targets, medications, supplements, or meal timing context at the start of a session and the skill applies those throughout.

## Triggers

| Trigger | Description |
| --- | --- |
| `fa` | Primary shorthand |
| `food` | Natural language prefix |
| Uploaded food image | Any photo of a meal, plate, label, or ingredient list |
| `analyze this food` | Direct request |
| `scan this label` | Nutrition label scan |
| `how many calories is this` | Calorie query |
| `what are the macros` | Macro query |
| `will this spike my blood sugar` | Glycemic query |
| `can I eat this on my meds` | Medication interaction query |

---

## Output Sections

Every analysis produces the following blocks. Sections are omitted when they do not apply to the identified food.

### Nutrition Estimate

Calories, protein, carbs, fat, fiber, sugar, and sodium. Values are extracted directly from visible labels or estimated visually using standard portion heuristics when no label is present.

### Fitness Alignment

Percent daily values for calories, protein, total fat, carbohydrates, and sodium against the FDA 2,000 kcal reference. Includes a one to two sentence assessment of macro balance for the meal.

### Ingredient Flags

Flags additives, allergens, and problem ingredients when a label or ingredient list is visible. Covers high fructose corn syrup, seed oils, artificial dyes, trans fats, MSG, and the eight major allergens.

### NOVA Ultra-Processed Food Score

NOVA 1 through 4 classification indicating the degree of industrial processing. Includes the category label, the specific factors that determined the score, and a line-by-line list of any additives present with E-numbers where applicable. NOVA 4 results always include a note on associated health risks from large cohort studies.

### Blood Sugar Impact

Glycemic index score with Low / Medium / High classification. Estimated glycemic load per serving calculated from GI and net carbs. Blood sugar response descriptor. Diabetic suitability rating. Notes on GI modifiers present in the meal such as fiber, fat, vinegar, cooking method, and ripeness.

### Meal Timing Assessment

Suitability rating of Optimal, Acceptable, Poor, or Not Recommended for the declared timing context. Reasoning for the rating and a specific swap suggestion if the timing is a poor fit. Timing contexts: pre-workout, post-workout, before bed, with medication, or general.

### Medication and Supplement Interactions

Universal flags for clinically significant food-drug interactions that apply regardless of declared medications. Includes grapefruit and CYP3A4 inhibition, Vitamin K and blood thinners, tyramine and MAOIs, calcium timing with thyroid medications and antibiotics, alcohol, caffeine, and licorice root interactions.

When the user declares specific medications, the skill cross-references the identified food against known absorption interference, metabolism interference, additive effects, and antagonistic effects for those drugs.

Supplement interaction coverage includes iron, magnesium, Vitamin D, zinc, B12, fish oil, CoQ10, Vitamin C, probiotics, and melatonin.

Every interaction section closes with a pharmacist and physician disclaimer.

### Healthier Alternatives

Specific, quantified swap suggestions generated only when the food scores poorly across defined thresholds. The section is omitted entirely for food that scores well. Swaps follow the format:

```text
Swap [specific item] for [specific alternative] → [numeric benefit]
```

Swap libraries cover high calorie and carb reduction, saturated fat reduction, sodium reduction, NOVA 4 to lower NOVA transitions, high GI reduction, and meal timing alignment. Maximum four swaps per analysis. Swap priorities order NOVA improvement first, then GI reduction, then macros, then sodium, then timing.

---

## Input Modes

| Mode | What Claude Sees | Behavior |
| --- | --- | --- |
| Meal or Plate | Actual food, plated dish, restaurant item | Visual portion estimation using standard heuristics |
| Nutrition Label | FDA-style Nutrition Facts panel | Direct value extraction from label |
| Ingredient List | Text list of ingredients | Additive flagging, allergen detection, NOVA classification |
| Mixed | Label and product both visible | Label data takes precedence over visual estimates |

---

## Session Context

The skill asks the user once per session for two pieces of context that personalize the output:

**Medications and supplements** — declared once, applied to every subsequent analysis in the session for personalized interaction warnings.

**Meal timing** — asked after the first analysis if not volunteered. Options are pre-workout, post-workout, before bed, with medication, or general. Applied to every subsequent analysis unless the user changes it.

If the user declines to share either, the skill falls back to universal flags only.

---

## NOVA Classification Reference

| Group | Name | Description | Examples |
| --- | --- | --- | --- |
| 1 | Unprocessed or Minimally Processed | Natural foods with no added substances | Fresh fruit, plain meat, eggs, plain yogurt |
| 2 | Processed Culinary Ingredients | Extracted substances used in cooking | Oils, flour, sugar, salt, spices |
| 3 | Processed Foods | NOVA 1 or 2 foods with added salt, sugar, or oil | Canned fish, artisan bread, simple cheese |
| 4 | Ultra-Processed | Industrial formulations with additives not used in home cooking | Packaged chips, soft drinks, flavored yogurt, protein bars |

NOVA 4 marker categories: emulsifiers, artificial sweeteners, artificial colors, flavor enhancers, preservatives, industrial thickeners, flavor compounds (natural and artificial flavors), and modified starches.

---

## Glycemic Index Reference

| Classification | GI Range | GL Range |
| --- | --- | --- |
| Low | Under 55 | Under 10 |
| Medium | 56 to 69 | 11 to 19 |
| High | 70 and above | 20 and above |

Glycemic load is calculated as `(GI x net carbs per serving) / 100`. GI modifiers applied automatically: fiber, fat, protein, vinegar, cooking method, particle size, ripeness, and food form.

---

## Confidence Levels

| Level | Condition |
| --- | --- |
| High | Nutrition label clearly readable, values extracted directly |
| Medium | Recognizable dish, standard portion visible |
| Low | Partial view, obscured label, mixed or layered dish, unusual item |

---

## Daily Reference Values

All percent daily values use the FDA standard 2,000 kcal reference diet.

| Nutrient | Daily Reference Value |
| --- | --- |
| Calories | 2,000 kcal |
| Total Fat | 78g |
| Saturated Fat | 20g |
| Cholesterol | 300mg |
| Sodium | 2,300mg |
| Total Carbohydrate | 275g |
| Dietary Fiber | 28g |
| Total Sugars | 50g |
| Protein | 50g |
| Vitamin D | 20mcg |
| Calcium | 1,300mg |
| Iron | 18mg |
| Potassium | 4,700mg |

Users can declare custom daily targets at any point in the session. The skill applies those targets for the remainder of the session.

---

## Repository Structure

```text
food-analyzer/
|-- skill.md       # Full skill instructions, output format, and reference tables
|-- README.md      # This file
```

---

## Installation

Copy the `food-analyzer` folder into your Claude skills directory.

```text
skills/
|-- food-analyzer/
|   |-- skill.md
|   |-- README.md
```

Or install from the packaged `.skill` file:

```text
food-analyzer.skill
```

The skill activates automatically when Claude detects a food-related image or a recognized trigger phrase in the conversation.

---

## Related Repositories

| Repo | Description |
| --- | --- |
| [mickpletcher/Anthropic](https://github.com/mickpletcher/Anthropic) | Full Claude skills library including this skill and all others |

---

## Blog

Technical posts about automation, AI tooling, and homelab projects at [mickitblog.blogspot.com](https://mickitblog.blogspot.com).

---

## License

This project is licensed under the MIT License. See `LICENSE` for the full text.
