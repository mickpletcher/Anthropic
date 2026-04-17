# travel-itinerary

A Claude AI skill for planning, formatting, and exporting travel itineraries as Obsidian ready Markdown files. It works as a reusable template, not a trip specific planner.

## Trigger

Start any message with `trip` or `itinerary` to activate this skill immediately.

It also triggers on requests like:

```text
trip build me a 7 day Japan itinerary
itinerary format this Europe trip for Obsidian
plan my trip to Costa Rica
format this itinerary for Obsidian
export my trip as markdown
```

## What it does

This skill builds a usable first draft without unnecessary questions when enough information already exists.

### Extract trip data

Pulls destinations, dates, anchor events, accommodation needs, transport legs, budget targets, activities, and trip purpose from the conversation.

### Build an Obsidian file

Creates a single Markdown document with a logistics summary, anchor events, day by day plan, accommodation summary, budget tracker, packing list, key contacts, and open items.

### Validate the itinerary

Checks date math, anchor event alignment, logic gaps, budget realism, and routing assumptions before finalizing the file.

### Export a clean output

Produces an Obsidian friendly file named `YYYY-MM-DD_[Destination].md` based on the departure date.

## Travel Rules

| Rule | Requirement |
| --- | --- |
| Departure point | User supplied when available |
| Accommodation | Match the user's stated preference |
| Booking data | Never fabricate confirmations |
| Budget tracking | Estimated and Actual stay separate |
| Anchor events | Fixed and must drive itinerary structure |
| Output style | Logistics focused, no fluff |

## Output Structure

Full itinerary requests produce one Markdown file with these sections when data is available:

1. Trip summary
2. Logistics Overview
3. Anchor Events
4. Day by Day
5. Accommodation Summary
6. Budget Tracker
7. Packing List
8. Key Contacts and Info
9. Open Items / To Do

## Validation Rules

- Check total trip length against departure and return dates
- Check overnight travel for missing accommodation coverage
- Flag unrealistic budgets in the Open Items section
- Note when a connection or transfer is likely required
- Use placeholders when critical data is missing instead of blocking the draft

## Packing List Standards

Every itinerary includes a trip specific packing list tailored to climate and activity type. Core travel items always include passport validity, insurance, offline maps, payment backup, charging gear, and luggage tracking.

## Template Guidance

- Use placeholders when essential details are missing
- Keep the structure reusable across solo, couple, family, or group travel
- Preserve the user's destination order, travel style, and confirmed events

## File Structure

```text
Travel Itinerary/
├── README.md
└── SKILL.md
```
