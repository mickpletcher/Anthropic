# crypto-research

A Claude skill for deep due diligence on a specific cryptocurrency before trading or investing.

## Trigger

Start a message with `cr` followed by a coin name or ticker to trigger this skill immediately.

It also triggers on natural language requests such as:

```text
research [coin]
due diligence [coin]
tell me about [coin]
is [coin] worth buying
```

## What It Does

Builds a structured research report for one crypto asset using current web data. The skill is designed for quality assessment and risk review, not buy and sell recommendations.

The report covers:

1. Project overview and differentiators
2. Tokenomics and unlock risk
3. Team and backer credibility
4. Exchange listings and liquidity context
5. Price action and market context
6. Roadmap and development activity
7. Adoption signals and traction metrics
8. Red flags and green flags
9. Summary scorecard

## Search Strategy

The skill searches before writing and does not rely on memory for current price, team status, listings, or project state.

Core searches include:

1. Project overview and use case
2. Tokenomics, supply, and vesting schedule
3. Team and founder background
4. Roadmap and milestones
5. Current price and chart data
6. Major exchange listings
7. Current month news
8. Risks and criticism
9. Audit and security status
10. CoinGecko or CoinMarketCap market data

If a field cannot be verified, it should be marked as `—` or `Not found`.

## Output Format

The skill outputs one inline markdown report using this structure:

1. `# [Coin Name] ($TICKER) — Research Report`
2. `## TL;DR`
3. `## Project Overview`
4. `## Tokenomics`
5. `## Team & Backers`
6. `## Exchange Listings`
7. `## Recent Price Action`
8. `## Roadmap & Development`
9. `## Use Case & Adoption`
10. `## Red Flags`
11. `## Green Flags`
12. `## Summary Scorecard`

The report ends with a research only disclaimer.

## Rules

1. Search first, then write
2. Use current data from reliable sources
3. Never pad unknown sections with speculation
4. Keep language direct and factual
5. Include a Red Flags section every time
6. Do not provide financial advice

## Example Trigger

```text
cr ONDO
cr Solana
cr Sui
cr ai16z
```

## File Structure

```text
crypto research/
├── README.md
└── skill.md
```
