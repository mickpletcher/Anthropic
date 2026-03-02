# photo-rename

A Claude AI skill that renames photos to descriptive real-world names using AI vision, GPS metadata, and web search.

Instead of keeping files named `IMG_4821.jpg`, this skill analyzes each photo and renames it to something like `phantom_ranch_grand_canyon.jpg` or `eiffel_tower_paris.jpg`.

---

## How It Works

The skill uses a multi-layered identification approach for each photo:

1. **AI Vision** - Claude analyzes the image directly to identify landmarks, terrain, structures, and any visible text or signage
2. **EXIF GPS Extraction** - Pulls GPS coordinates embedded in the photo metadata
3. **Reverse Geocoding** - Looks up the coordinates via OpenStreetMap Nominatim to get place context
4. **Web Search** - Combines visual observations and location data to find the most specific landmark name

---

## Usage

Start your message with `rp` and attach one or more photos:

```
rp [attach photos]
```

Claude will process all photos and return a rename report. Since uploaded files are read-only, the report shows the suggested renames which you apply manually or via a script.

---

## Example Output

```
PHOTO RENAME REPORT
===================

[PASS] IMG_4821.jpg  ->  phantom_ranch_grand_canyon.jpg
   Confidence: High | GPS: 36.1069, -112.0605 | Method: GPS + vision + web search

[PASS] IMG_4822.jpg  ->  colorado_river_bright_angel_trail.jpg
   Confidence: High | GPS: 36.0975, -112.1129 | Method: GPS + web search

[WARN] IMG_4823.jpg  ->  stewart_county_tennessee.jpg
   Confidence: Low | GPS: 36.3012, -87.8456 | Method: GPS reverse geocode only
   Note: Could not identify specific landmark

[FAIL] IMG_4824.jpg  ->  unidentified_photo_01.jpg
   Confidence: None | No GPS data | Could not identify from image alone

===================
4 photos processed | 2 high confidence | 1 fallback to GPS | 1 unidentified
```

---

## Naming Convention

All filenames are generated in `snake_case` (lowercase with underscores):

- Specific over generic: `phantom_ranch_grand_canyon` not `grand_canyon`
- Location type included when helpful: `_waterfall`, `_trail`, `_overlook`, `_beach`
- Max 50 characters
- Original file extension preserved
- Duplicate names get a sequence suffix: `_01`, `_02`, etc.

---

## Fallback Behavior

| Situation | Result |
|---|---|
| High confidence identification | Descriptive landmark name |
| GPS exists, landmark unclear | Reverse geocode place name (e.g., `stewart_county_tennessee`) |
| No GPS, cannot identify | `unidentified_photo_01`, `_02`, etc. |

---

## Requirements

- Claude AI with Skills enabled
- Photos with EXIF data will get the best results
- GPS-tagged photos yield the highest accuracy
- Works with JPG, JPEG, PNG, HEIC, and other common image formats

---

## Installation

1. Download `photo-rename.skill`
2. In Claude.ai go to **Settings > Skills**
3. Click **Upload Skill** and select the `.skill` file
4. Start a new conversation and use `rp` to trigger it

---

## Tips for Best Results

- Enable location services on your phone when taking photos to embed GPS data
- Photos taken at well-known landmarks will almost always get high-confidence names
- For remote or natural areas (trails, backcountry), GPS data is critical since visual identification alone may not be specific enough
- Process photos in batches from the same trip for faster workflow

---

## Part of the Claude Skills Collection

This skill is part of a personal Claude AI skills library built to automate repetitive workflows. Other skills in this collection cover areas like social media posting, fitness logging, and IT automation.
