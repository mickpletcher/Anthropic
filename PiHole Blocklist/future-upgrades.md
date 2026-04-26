# Roadmap Alignment: Pi-hole Rule Generator

## Proposed Enhancements

Roadmap goal: "Aggregates and deduplicates blocklists. Outputs optimized configurations."

Current scope: Evaluates and documents new blocklist sources.

### Phase 1: Blocklist Aggregation

- Accept a list of blocklist URLs (existing `sources.md` reference list or custom URLs)
- Download and parse blocklists in multiple formats (hosts, adlist, domain-list, etc.)
- Detect and remove duplicates across all sources
- Generate a deduplicated master list
- Output in user-selected format (hosts, domains, adlist JSON, etc.)

### Phase 2: Configuration Optimization

- Analyze aggregate list for false positive risk (common legitimate domains)
- Suggest category-based splits for easier management
- Output Pi-hole Adlist API ready configs (name, URL, comment)
- Generate gravity database SQL for bulk import
- Include redundancy analysis (which lists provide overlapping coverage)

### Phase 3: Monitoring and Drift Detection

- Accept list snapshots over time to detect drift
- Flag when sources become inactive or change format
- Suggest consolidation or replacement when sources drift significantly
- Output a driftwarning report with recommendations

## Related Skill

See also: pihole-csv-analyzer (analyzes query logs and what was blocked).
