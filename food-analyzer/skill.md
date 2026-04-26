---
name: food-analyzer
description: >
  Analyze food photos, nutrition labels, and ingredient lists using image recognition. Always
  trigger immediately when the user's message starts with "fa" or "food" followed by an image,
  or when the user uploads any image of food, a meal, a nutrition facts label, an ingredient
  list, or a packaged food product. Also trigger on "analyze this food", "what are the macros",
  "how many calories", "is this healthy", "log this meal", "scan this label", "can I eat this
  on my meds", "does this affect my medication", "will this spike my blood sugar", or any
  variation where the user wants nutritional insight, drug-food interaction guidance, or
  glycemic impact from a photo. Produces calories, macros, % Daily Values (FDA 2,000 kcal),
  ingredient red flags, medication/supplement interactions, and glycemic index / blood sugar
  impact with estimated glycemic load per serving.
---

# Food Analyzer

Analyze images of food, plated meals, nutrition labels, or ingredient lists and return a
structured nutritional breakdown with fitness context.

## Triggers

| Shortcut | Description |
|----------|-------------|
| `fa` | Primary shorthand — food analyze |
| `food` | Natural language trigger |
| Image of food/label | Any uploaded image that appears food-related |

---

## Input Modes

Detect which mode applies from the image content:

| Mode | What Claude Sees | Behavior |
|------|-----------------|----------|
| **Meal / Plate** | Actual food, plated dish, restaurant item | Estimate calories + macros from visual portion |
| **Nutrition Label** | FDA-style Nutrition Facts panel | Extract exact values from label |
| **Ingredient List** | Text list of ingredients | Flag allergens, additives, red flags |
| **Mixed** | Both label and product visible | Prefer label data over estimates |

If no image is attached but the user typed "fa" or a food trigger, ask them to attach a photo before proceeding.

---

## Output Format

Always return the analysis in this exact structure. Omit sections that don't apply.

```
🍽️ FOOD ANALYSIS
─────────────────────────────
[Food Name / Best Guess]

📊 NUTRITION ESTIMATE
  Calories:     ~XXX kcal
  Protein:      XXg
  Carbs:        XXg
  Fat:          XXg
  Fiber:        XXg  (if visible/estimable)
  Sugar:        XXg  (if visible/estimable)
  Sodium:       XXXmg (if visible/estimable)

⚡ FITNESS ALIGNMENT  (based on FDA 2,000 kcal daily reference)
  Calories:       XX% DV  (XXX of 2,000 kcal)
  Protein:        XX% DV  (Xg of 50g)
  Total Fat:      XX% DV  (Xg of 78g)
  Carbohydrates:  XX% DV  (Xg of 275g)
  Sodium:         XX% DV  (XXXmg of 2,300mg)
  Assessment:     [1-2 sentence verdict — balanced meal, heavy in one macro, etc.]

🚩 INGREDIENT FLAGS  (only if label/ingredients are visible)
  ⚠️  [Flag any: high fructose corn syrup, seed oils, artificial dyes, trans fats,
       MSG, preservatives, allergens (gluten, dairy, soy, tree nuts, shellfish)]

🏭 ULTRA-PROCESSED FOOD SCORE
  NOVA Classification:  [1 / 2 / 3 / 4]
  Category:             [Unprocessed / Culinary ingredient / Processed / Ultra-processed]
  Score Rationale:      [Key factors that determined the classification]
  Additive Flags:       [List any additives present: emulsifiers, colorants, flavor enhancers,
                          sweeteners, preservatives, thickeners — by E-number or name]

⏱️ MEAL TIMING ASSESSMENT
  Timing Context:   [Pre-workout / Post-workout / Before bed / With medication / General]
  Suitability:      [Optimal / Acceptable / Poor / Not recommended]
  Reasoning:        [1-2 sentences on why this food works or doesn't for this timing]
  Suggestion:       [What to add, remove, or swap to better fit the timing context]

🩸 BLOOD SUGAR IMPACT
  Glycemic Index (GI):   XX  [Low <55 / Medium 56–69 / High ≥70]
  Glycemic Load (GL):    XX  [Low <10 / Medium 11–19 / High ≥20]
  Blood Sugar Response:  [Rapid spike / Moderate rise / Slow steady release]
  Diabetic Suitability:  [Safe / Use caution / Avoid / Consult physician]
  Notes:                 [Fiber, fat, protein modifiers; cooking method impact if relevant]

💊 MEDICATION & SUPPLEMENT INTERACTIONS
  [List any known food-drug or food-supplement interactions for identified ingredients.
   If the user has declared medications/supplements, check against those specifically.
   If no medications declared, flag universally notable interactions only.
   Always include a disclaimer: "Consult your pharmacist or physician to confirm."]

📝 NOTES
  [Estimation confidence, serving size assumptions, portion caveats, or suggestions.]

🔄 HEALTHIER ALTERNATIVES
  [Only shown when one or more sections score poorly. List specific, quantified swaps.
   Format: "Swap [X] for [Y] to [specific benefit — kcal, macros, GI, NOVA, etc.]"
   Include 2–4 swaps max. Skip this section entirely if the food scores well overall.]
```

---

## Estimation Guidelines

When analyzing an actual meal (no label present), use these visual estimation heuristics:

**Protein sources**
- Chicken breast (palm-sized) → ~30g protein, ~160 kcal
- Ground beef (baseball-sized) → ~25g protein, ~300 kcal
- Eggs (1 large) → ~6g protein, ~70 kcal
- Salmon fillet (deck of cards) → ~22g protein, ~180 kcal
- Greek yogurt (1 cup) → ~17g protein, ~130 kcal

**Carb sources**
- White rice (fist-sized) → ~45g carbs, ~200 kcal
- Pasta (fist-sized cooked) → ~40g carbs, ~200 kcal
- Bread (1 slice) → ~15g carbs, ~80 kcal
- Potato (medium) → ~37g carbs, ~160 kcal

**Fats**
- Olive oil (1 tbsp) → ~14g fat, ~120 kcal
- Avocado (half) → ~15g fat, ~160 kcal
- Cheese (1 oz) → ~9g fat, ~110 kcal

**General rule**: When uncertain, provide a range (e.g., "300–400 kcal") and note confidence.

---

## Confidence Levels

Always qualify the analysis with one of:

- ✅ **High confidence** — Nutrition label clearly readable, values extracted directly
- 🟡 **Medium confidence** — Recognizable dish, standard portion visible
- 🔴 **Low confidence** — Partial view, obscured label, mixed/layered dish, unusual item

---

## Daily Reference Values

Use the FDA standard 2,000 calorie diet as the baseline for all % Daily Value calculations
and fitness alignment scoring unless the user specifies otherwise:

| Nutrient | Daily Reference Value |
|----------|----------------------|
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

These match the FDA % Daily Value reference amounts printed on Nutrition Facts labels.

If the user provides custom targets mid-conversation, use those for the rest of the session.

---

## NOVA Classification & Ultra-Processed Food Scoring

NOVA is a food classification system developed by researchers at the University of São Paulo.
It groups foods by the **extent and purpose of processing**, not by nutrient content alone.
A food can have excellent macros and still score NOVA 4 if it contains industrial additives.

### The Four Groups

#### NOVA 1 — Unprocessed or Minimally Processed Foods
Foods in their natural state or with minimal alteration (cleaning, cutting, drying, freezing,
pasteurizing, fermenting) that does not add substances.

**Examples**: Fresh fruit, vegetables, plain meat, fish, eggs, plain milk, plain yogurt
(no additives), dried legumes, plain nuts, plain grains, water, fresh herbs.

**Scoring signal**: Single-ingredient or naturally derived. No additives visible on label.

---

#### NOVA 2 — Processed Culinary Ingredients
Substances extracted from NOVA 1 foods or from nature and used in home/restaurant cooking.
Not typically eaten alone.

**Examples**: Oils, butter, lard, flour, sugar, salt, honey, vinegar, starches, plain spices.

**Scoring signal**: Recognizable kitchen staples. One or two ingredients. No additives.

---

#### NOVA 3 — Processed Foods
NOVA 1 or 2 foods with added salt, sugar, oil, or vinegar to preserve or enhance flavor.
Still recognizable as derived from whole foods. Minimal ingredient lists.

**Examples**: Canned vegetables/fish (in brine or oil), salted nuts, cured meats (minimal
ingredients), simple cheeses, freshly baked artisan bread (flour, water, yeast, salt),
jarred tomato sauce (tomatoes, salt, olive oil).

**Scoring signal**: Short ingredient list (≤5 ingredients). Additions are kitchen-recognizable.
No industrial additives.

---

#### NOVA 4 — Ultra-Processed Foods
Industrial formulations with five or more ingredients, including substances not used in home
cooking and additives whose purpose is to imitate, enhance, or disguise sensory properties.

**NOVA 4 marker ingredients — flag any of these:**

| Category | Examples |
|----------|---------|
| Emulsifiers | Soy lecithin (E322), polysorbate 80 (E433), carrageenan (E407), mono- and diglycerides |
| Artificial sweeteners | Aspartame (E951), sucralose (E955), acesulfame K (E950), saccharin (E954) |
| Artificial colors | Red 40 (E129), Yellow 5 (E102), Blue 1 (E133), titanium dioxide (E171) |
| Flavor enhancers | MSG (E621), disodium inosinate (E631), disodium guanylate (E627) |
| Preservatives | Sodium benzoate (E211), BHA (E320), BHT (E321), TBHQ (E319) |
| Industrial thickeners | Xanthan gum (E415), guar gum (E412), cellulose gum (E466) |
| Flavor compounds | "Natural flavors", "artificial flavors", "flavoring" (catch-all industrial inputs) |
| Modified starches | Modified corn starch, maltodextrin, hydrolyzed protein |
| Filler proteins | Soy protein isolate, whey protein concentrate (in processed food context) |
| Other | High-fructose corn syrup, invert sugar syrup, interesterified fats |

**Examples of NOVA 4 foods**: Soft drinks, packaged chips, instant noodles, breakfast cereals
with additives, flavored yogurts with stabilizers, fast food buns, deli meat with additives,
protein bars with 15+ ingredients, most frozen meals, flavored crackers, energy drinks.

---

### Scoring Logic

When the ingredient list is visible, scan for NOVA 4 markers first. If any are present → NOVA 4.
If no markers but salt/sugar/oil are added to a whole food → NOVA 3.
If it's a culinary staple with no additives → NOVA 2.
If it's a whole food → NOVA 1.

When no ingredient list is visible (actual meal photo), classify based on food recognition:

| Visual Assessment | NOVA |
|------------------|------|
| Whole fresh ingredients, home-cooked appearance | 1–2 |
| Simple cooked dish, recognizable ingredients | 2–3 |
| Packaged product, fast food, chain restaurant item | 3–4 |
| Clearly industrial — bright colors, uniform shape, heavy seasoning | 4 |

When uncertain between two groups, always assign the **higher (more processed) group** and
note the uncertainty.

### Health Context Note

Always include a brief note in the output when NOVA 4 is assigned:
> ⚠️ Ultra-processed foods (NOVA 4) are associated with increased risk of obesity,
> cardiovascular disease, type 2 diabetes, and all-cause mortality in large cohort studies.
> This is independent of calorie or macro content.

---

## Meal Timing Context

### Session Prompt

After the first food analysis in a session, if the user has not specified timing, ask once:
"What's the context for this meal? (pre-workout, post-workout, before bed, with medication,
or just a general meal)" — then apply the appropriate assessment for the rest of the session
unless they change it.

If the user volunteers timing in their message ("this is my pre-workout meal", "eating before
bed", "taking my meds with this"), skip the prompt and use it directly.

### Timing Profiles

#### 🏋️ Pre-Workout (30–90 min before training)

**Goals**: Sustained energy, no GI distress, adequate glycogen without heaviness.

| Factor | Ideal | Flag |
|--------|-------|------|
| Carbs | Moderate, low-fiber | High-fiber → GI distress risk |
| Protein | Light-moderate (15–25g) | Very high protein → slows digestion |
| Fat | Low | High fat → slows gastric emptying |
| Timing | 30–90 min before | Heavy meal < 30 min before → cramping risk |
| GI | Medium–High acceptable | Low GI fine if 90+ min out |
| Sugar | Moderate OK | Excessive fructose → GI distress |

Good pre-workout signals: banana, oats, white rice, toast with peanut butter, sports drink.
Flag as poor: heavy fat meals, large portions, high-fiber vegetables, dairy-heavy dishes.

#### 🔄 Post-Workout (within 60 min after training)

**Goals**: Muscle protein synthesis, glycogen replenishment, rapid nutrient delivery.

| Factor | Ideal | Flag |
|--------|-------|------|
| Protein | High (25–40g+) | Low protein → missed recovery window |
| Carbs | High-GI acceptable | Avoiding all carbs → impairs glycogen reload |
| Fat | Low–moderate | High fat → slows nutrient absorption |
| Timing | Within 30–60 min | Delaying meal > 2 hrs → suboptimal recovery |
| Ratio | ~3:1 or 4:1 carb:protein | Protein-only → fine but suboptimal |

Good post-workout signals: chicken + rice, protein shake + banana, Greek yogurt + fruit,
eggs + toast. Flag as poor: high-fat meals, low-protein meals, skipping carbs entirely.

#### 🌙 Before Bed (within 2 hours of sleep)

**Goals**: Avoid blood sugar spikes, support overnight recovery, minimize fat storage risk.

| Factor | Ideal | Flag |
|--------|-------|------|
| Sugar / Simple carbs | Low | High sugar → insulin spike, disrupts sleep |
| Protein | Casein-rich sources OK | Whey / fast protein less optimal |
| Fat | Moderate OK | Very high fat → acid reflux risk |
| Calories | Light–moderate | Large meal → disrupts sleep quality |
| GI | Low | High GI → blood sugar crash overnight |
| Caffeine | None | Any caffeine → sleep disruption |
| Alcohol | None | Disrupts REM sleep, metabolized to sugar |

Good pre-bed signals: cottage cheese, casein shake, small portion nuts, turkey.
Flag as poor: sugary desserts, high-GI carbs, alcohol, large heavy meals, caffeine.

#### 💊 With Medication

**Goals**: Optimize drug absorption or avoid absorption interference.

Apply the medication interaction logic from the 💊 section and cross-reference timing:

| Scenario | Guidance |
|----------|----------|
| Empty stomach medications | Flag any high-fat or high-fiber meal taken with them |
| Food-required medications | Flag if user appears to be taking on an empty stomach |
| Thyroid meds | Calcium, iron, high-fiber all reduce absorption — note 30–60 min gap |
| Blood thinners | Consistent Vitamin K intake matters more than avoiding it entirely |
| Diabetes meds | Meal timing relative to dose is critical — flag large carb loads |
| Antibiotics | Some require empty stomach; others require food — note which |

Always recommend the user confirm timing instructions with their pharmacist.

#### 🍽️ General Meal (no specific timing declared)

Run the standard output with no timing-specific modifications. Suitability field shows
"General — no timing context provided."

### Suitability Ratings

| Rating | Meaning |
|--------|---------|
| ✅ Optimal | Food aligns well with the stated timing goal |
| 🟡 Acceptable | Mostly fine with minor caveats |
| 🔴 Poor | Misaligned — notable flags for this timing |
| ⛔ Not recommended | Strong conflict with timing goal (e.g., high sugar pre-bed, high fat pre-workout) |

---

## Medication & Supplement Interactions

### Session Context

At the start of a session, if the user hasn't declared their medications or supplements,
proactively ask once: "To give you personalized interaction warnings, do you want to share
any medications or supplements you're currently taking?"

Store whatever they share for the rest of the session. If they decline, fall back to
flagging universally high-risk food interactions only.

### Always Flag (Universal — No Medication Declaration Needed)

These food interactions are clinically significant enough to flag for any user:

| Food / Ingredient | Interacts With | Risk |
|-------------------|---------------|------|
| Grapefruit / grapefruit juice | Statins, calcium channel blockers, immunosuppressants, some SSRIs | Inhibits CYP3A4 enzyme — can raise drug blood levels dangerously |
| Leafy greens (high Vitamin K) | Warfarin / blood thinners | Can reduce anticoagulant effectiveness |
| Tyramine-rich foods (aged cheese, cured meats, fermented foods) | MAOIs | Can trigger hypertensive crisis |
| Alcohol | Almost all medications | Enhances sedation, damages liver metabolism, interacts broadly |
| High-calcium foods (dairy, fortified OJ) | Thyroid medications (levothyroxine), some antibiotics (fluoroquinolones, tetracyclines) | Reduces drug absorption |
| Black licorice / licorice root | Digoxin, antihypertensives, diuretics | Can cause hypokalemia, affect heart rhythm |
| St. John's Wort | SSRIs, birth control, warfarin, HIV meds | Enzyme inducer — reduces effectiveness of many drugs |
| High-fat meal | Some medications requiring empty stomach | Can significantly alter absorption rate |
| Caffeine | Stimulants, some antibiotics (ciprofloxacin), lithium | Can amplify stimulant effects or raise drug concentrations |

### Common Supplement Interactions

Flag these when relevant ingredients are identified:

| Supplement | Food Interaction |
|------------|-----------------|
| Iron supplements | Calcium-rich foods, coffee, tea reduce absorption — take separately |
| Magnesium | High-fiber foods can reduce absorption |
| Vitamin D | Fat-soluble — absorption improved with dietary fat |
| Zinc | High-phytate foods (whole grains, legumes) reduce absorption |
| B12 | Alcohol and high-fiber foods can impair absorption |
| Fish oil / Omega-3 | Compounds anticoagulant effect with blood thinners |
| CoQ10 | Fat-soluble — should be taken with meals |
| Vitamin C (high dose) | Can increase iron absorption — caution with iron overload conditions |
| Probiotics | Antibiotics taken simultaneously can neutralize them — space out |
| Melatonin | Caffeine can blunt effectiveness |

### User-Declared Medication Lookup

If the user has declared specific medications, cross-reference the identified food against
known interactions for those drugs. Use your knowledge of pharmacology to flag:

1. **Absorption interference** — food that blocks the drug from being absorbed
2. **Metabolism interference** — food that speeds up or slows down drug breakdown
3. **Additive effects** — food that amplifies the drug's action (intended or unintended)
4. **Antagonistic effects** — food that works against the drug's purpose

### Disclaimer

Always append to the 💊 section:
> ⚕️ *These flags are informational only. Always consult your pharmacist or physician
> before making changes based on food-drug interactions.*

---

## Glycemic Index & Blood Sugar Impact

### Definitions

- **Glycemic Index (GI)** — Rates how quickly a food raises blood glucose on a scale of 0–100
  relative to pure glucose. Only applies to carbohydrate-containing foods.
- **Glycemic Load (GL)** — Accounts for both GI and the actual carb content per serving.
  More clinically useful than GI alone.
  `GL = (GI × grams of net carbs per serving) / 100`

### Rating Scales

| Rating | GI Range | GL Range |
|--------|----------|----------|
| Low | < 55 | < 10 |
| Medium | 56 – 69 | 11 – 19 |
| High | ≥ 70 | ≥ 20 |

### Common GI Reference Values

Use these as anchors when estimating for visual meals:

| Food | GI | Notes |
|------|----|-------|
| White bread | 75 | Rapidly digested |
| White rice (cooked) | 72 | Higher when hot/freshly cooked |
| Brown rice | 50 | More fiber slows digestion |
| Pasta (al dente) | 45 | Cooking time significantly affects GI |
| Pasta (overcooked) | 65 | |
| Oatmeal (rolled) | 55 | |
| Instant oatmeal | 79 | Processing raises GI considerably |
| Potato (boiled) | 78 | |
| Potato (cooled/reheated) | 56 | Resistant starch forms on cooling |
| Sweet potato | 54 | |
| Banana (ripe) | 62 | GI rises as fruit ripens |
| Banana (unripe) | 45 | |
| Apple | 36 | |
| Watermelon | 76 | High GI but low GL due to water content |
| Orange juice | 50 | |
| Whole milk | 39 | |
| Ice cream | 51 | Fat slows absorption |
| Lentils | 32 | |
| Chickpeas | 28 | |
| Carrots (raw) | 16 | |
| Carrots (cooked) | 47 | |
| Corn | 52 | |
| Pizza | 60 | Varies by crust thickness and toppings |
| Coca-Cola | 63 | |
| Honey | 58 | |
| Table sugar (sucrose) | 65 | |
| Dark chocolate (70%+) | 22 | |

### GI Modifiers — Always Apply These

The following factors **lower** effective GI and should be noted in the output:

| Factor | Effect |
|--------|--------|
| High fiber content | Slows gastric emptying, lowers GI response |
| Fat present in meal | Delays glucose absorption |
| Protein present in meal | Blunts insulin spike |
| Vinegar / acidic dressings | Reduces GI by ~30% |
| Whole vs. processed grain | Whole grain significantly lower |
| Cooking method | Al dente pasta, cooled potatoes, underripe fruit all lower GI |
| Particle size | Coarsely ground flour < finely milled flour |

The following factors **raise** effective GI:

| Factor | Effect |
|--------|--------|
| Overripe fruit | More simple sugars available |
| Overcooking starch | Gelatinization increases digestibility |
| Liquid vs. solid form | Juices spike faster than whole fruit |
| High-heat processing | Puffed cereals, instant products |

### Diabetic Suitability Guidelines

Use this logic for the Diabetic Suitability field:

| Condition | Flag |
|-----------|------|
| GL < 10, no added sugars | ✅ Safe |
| GL 11–19 or moderate added sugars | 🟡 Use caution |
| GL ≥ 20 or high added sugars | 🔴 Avoid |
| Unclear, mixed meal, or borderline | ⚕️ Consult physician |

### Diabetes-Related Medication Interactions

When the user has declared diabetes medications, also flag in the 💊 section:

| Food | Interaction |
|------|-------------|
| High-GI foods | Can counteract metformin, insulin, GLP-1 agonists (Ozempic, Wegovy) |
| Alcohol | Risk of hypoglycemia with insulin and sulfonylureas |
| Grapefruit | Interacts with some oral diabetes drugs |
| High-sugar foods + insulin | Requires dose adjustment awareness |
| Fiber-rich foods | Can slow carb absorption, may reduce insulin needs — positive but note timing |

---

## Multi-Item Meals

If the image shows multiple distinct dishes or containers, analyze each component separately,
then provide a **combined total** at the bottom.

---

## Healthier Alternative Suggestions

Only generate this section when **at least one** of the following conditions is true:
- NOVA score is 3 or 4
- GI is High (≥70) or GL is High (≥20)
- Calories exceed 40% DV in a single meal
- Sodium exceeds 40% DV in a single meal
- Saturated fat exceeds 30% DV in a single meal
- Meal timing suitability is Poor or Not Recommended
- Ingredient flags contain trans fats, HFCS, artificial dyes, or 3+ additives

If none of the above apply, omit the section entirely — do not generate filler swaps for
food that is already scoring well.

### Swap Format

Always write swaps in this format:
> "Swap **[specific item]** for **[specific alternative]** → [quantified benefit]"

The benefit must be **specific and numeric** where possible:
- Calorie difference
- Macro difference (protein, carbs, fat)
- GI or GL reduction
- NOVA improvement (e.g., "drops from NOVA 4 to NOVA 1")
- Sodium reduction
- Additive removal

Vague swaps like "choose a healthier option" are never acceptable.

### Swap Library by Trigger

Use these as a starting reference. Always adapt to what's actually in the image.

#### High Calorie / High Carb Swaps

| Original | Swap | Benefit |
|----------|------|---------|
| White rice (1 cup) | Cauliflower rice (1 cup) | −170 kcal, −35g carbs, GI drops from 72 to ~15 |
| Regular pasta (1 cup) | Zucchini noodles (1 cup) | −175 kcal, −38g carbs |
| White bread (2 slices) | Lettuce wrap | −140 kcal, −26g carbs, NOVA 4 → NOVA 1 |
| Flour tortilla (large) | Corn tortilla (small, 2x) | −80 kcal, −14g carbs, lower GI |
| Mashed potato | Mashed cauliflower | −100 kcal, −20g carbs, GL drops from 17 to 4 |
| Regular bun | Portobello mushroom cap | −120 kcal, −22g carbs, NOVA 4 → NOVA 1 |
| Croutons in salad | Pumpkin seeds | −30 kcal, +5g protein, +healthy fat, NOVA 4 → NOVA 1 |

#### High-Fat / Saturated Fat Swaps

| Original | Swap | Benefit |
|----------|------|---------|
| Sour cream (2 tbsp) | Plain Greek yogurt (2 tbsp) | −25 kcal, −3g sat fat, +2g protein |
| Full-fat cheese (1 oz) | Part-skim mozzarella (1 oz) | −20 kcal, −2g sat fat |
| Butter (1 tbsp) | Avocado oil (1 tbsp) | Same calories, replaces sat fat with monounsaturated |
| Heavy cream sauce | Tomato-based sauce | −150 kcal per serving, −15g fat |
| Fried chicken | Baked/grilled chicken | −150–200 kcal, −12g fat, NOVA improvement |
| Ground beef 80/20 | Ground turkey 93/7 | −60 kcal, −7g fat per 4oz |

#### High Sodium Swaps

| Original | Swap | Benefit |
|----------|------|---------|
| Soy sauce (1 tbsp) | Coconut aminos (1 tbsp) | −480mg sodium (73% reduction) |
| Canned soup | Homemade or low-sodium version | −400–800mg sodium |
| Deli meat (2 oz) | Roasted chicken breast (2 oz) | −350mg sodium, NOVA 4 → NOVA 1 |
| Salted nuts (1 oz) | Unsalted nuts (1 oz) | −115mg sodium |
| Bottled salad dressing (2 tbsp) | Olive oil + lemon juice | −200mg sodium, NOVA 4 → NOVA 1 |

#### NOVA 4 → Lower NOVA Swaps

| Original | Swap | Benefit |
|----------|------|---------|
| Flavored yogurt | Plain Greek yogurt + fresh fruit | NOVA 4 → NOVA 1, −15g sugar |
| Packaged granola bar | Handful of nuts + piece of fruit | NOVA 4 → NOVA 1, −12g added sugar |
| Flavored instant oatmeal | Plain rolled oats + cinnamon + banana | NOVA 4 → NOVA 1, removes artificial flavors |
| Processed cheese slice | Real cheddar or mozzarella | NOVA 4 → NOVA 3, removes emulsifiers |
| Flavored chips | Plain popcorn (air-popped) | NOVA 4 → NOVA 2, −80 kcal, removes additives |
| Energy drink | Black coffee or green tea | NOVA 4 → NOVA 1, removes artificial sweeteners/colors |
| Protein bar (15+ ingredients) | Hard-boiled eggs + banana | NOVA 4 → NOVA 1, equivalent macros, no additives |

#### High GI Swaps

| Original | Swap | Benefit |
|----------|------|---------|
| White rice | Basmati rice (cooled) | GI drops from 72 to 50 |
| Watermelon | Berries | GI drops from 76 to 25, higher fiber |
| Instant oatmeal | Rolled oats (stovetop) | GI drops from 79 to 55 |
| Sports drink | Water + banana | GI stabilized, adds potassium and fiber |
| White potato | Sweet potato | GI drops from 78 to 54, +beta-carotene |
| Pretzels | Hummus + vegetables | GI drops from 83 to ~15, +protein and fiber |

#### Meal Timing Swaps

| Timing | Poor Choice | Better Swap | Why |
|--------|-------------|-------------|-----|
| Pre-workout | High-fat meal | Banana + rice cake | Faster gastric emptying |
| Pre-workout | Cream-based pasta | Plain pasta + tomato sauce | Less fat, less GI distress risk |
| Post-workout | Low-protein salad | Add grilled chicken or eggs | Hits protein synthesis window |
| Post-workout | Fat-heavy meal | Lean protein + white rice | Fat slows absorption during recovery window |
| Before bed | Sugary dessert | Cottage cheese + berries | Casein protein, low GI, no sugar spike |
| Before bed | Alcohol | Herbal tea | Protects REM sleep, eliminates empty calories |

### Swap Priorities

When multiple swaps are possible, prioritize in this order:
1. NOVA improvement (removing industrial additives is highest priority)
2. GI/GL reduction (especially if diabetic context declared)
3. Calorie/macro optimization
4. Sodium reduction
5. Timing alignment

Cap at **4 swaps maximum** per analysis. More than that becomes noise.

---

## Edge Cases

| Situation | Handling |
|-----------|----------|
| Blurry or unreadable label | Note it, estimate from visible product name |
| Fast food item | Search knowledge for standard menu item macros |
| Homemade or unlabeled dish | Visual estimate with low/medium confidence note |
| Supplement container | Treat like a nutrition label |
| Alcohol | Include kcal estimate (7 kcal/g alcohol), flag empty calories |
| User asks about specific ingredient | Answer inline before full analysis |

---

## Example Triggers

```
fa [image attached]
food log this
how many calories is this
scan this label
what are the macros on this
is this a good post-workout meal
analyze this [image]
```