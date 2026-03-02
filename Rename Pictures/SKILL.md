---
name: photo-rename
description: Rename photos using AI vision, GPS metadata, and web search to give them descriptive real-world names like "grand_canyon_phantom_ranch.jpg" or "eiffel_tower_paris.jpg". Always trigger immediately when the user's message starts with "rp". Also trigger when the user uploads photos and asks to rename them, identify them, or label them by location or content. Processes multiple photos in batch.
---

# Photo Rename Skill

Rename photos to descriptive real-world names using a combination of:
1. AI vision - analyze the photo content directly
2. EXIF GPS metadata - extract coordinates from the image
3. Reverse geocoding - look up coordinates to get place context
4. Web search - identify specific landmarks, trails, or attractions

## Trigger

Activates when the user's message starts with "rp" or when they upload photos and ask to rename, identify, or label them.

---

## Workflow

### Step 1 - Extract EXIF metadata from all photos

Install exifread if needed:

    pip install exifread --break-system-packages -q

Write a Python script to extract GPS coordinates and date taken from all images in /mnt/user-data/uploads. Convert GPS rational values to decimal degrees.

Key EXIF tags to look for:
- GPS GPSLatitude / GPS GPSLatitudeRef
- GPS GPSLongitude / GPS GPSLongitudeRef
- EXIF DateTimeOriginal

### Step 2 - For each photo, identify what it shows

Use a combination of:

A. Vision analysis - Claude can see the image directly. Look at the photo and identify:
- Is there a recognizable landmark, structure, or natural feature?
- What does the landscape or environment look like?
- Any visible signs, text, or identifying features?

B. GPS reverse geocoding - If GPS coordinates exist, fetch place info:
- URL: https://nominatim.openstreetmap.org/reverse?lat={lat}&lon={lon}&format=json
- Use web_fetch to retrieve the result
- Extract the display_name or specific place fields

C. Web search for specifics - Combine vision observations plus GPS location:
- Example query: "grand canyon inner gorge hiking trail phantom ranch"
- Look for the most specific, accurate landmark name

### Step 3 - Generate the new filename

Naming rules:
- Use snake_case (underscores, all lowercase)
- Be specific - prefer "phantom_ranch_grand_canyon" over "grand_canyon"
- Include location type if helpful: waterfall, trail, overlook, beach, etc.
- Keep it under 50 characters
- No special characters except underscores
- Preserve the original file extension

Fallback priority when confidence is low:
1. GPS exists but landmark unidentifiable - use reverse geocode place name (e.g., stewart_county_tennessee)
2. No GPS and cannot identify from image - use "unidentified_photo" plus sequence number

Conflict handling: If two photos would get the same name, append _01, _02, etc.

### Step 4 - Output a rename report

Since uploaded files are read-only, produce a clear report:

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

---

## Notes

- Always process all uploaded photos before producing the report
- For well-known landmarks, use the common English name people would recognize
- For remote or natural areas, be as specific as data allows: trail name, peak name, overlook name
- If web search returns conflicting info, favor the result most consistent with what the photo shows
- The report is the final deliverable - the user will do the actual renaming manually or via script
