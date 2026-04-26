---
name: crypto-research
description: Deep dive research report on a specific cryptocurrency before trading or investing. Always trigger immediately when the user's message starts with "cr" followed by a coin name or ticker. Also trigger on "research [coin]", "due diligence [coin]", "tell me about [coin]", "is [coin] worth buying", or any request for a comprehensive breakdown of a specific cryptocurrency. Always search the web before responding — never answer from memory for price, team, or project status.
---

# Crypto Research Skill

Generate a structured due diligence report on a specific cryptocurrency. Covers everything needed before putting real money on anything: project fundamentals, tokenomics, team, exchange presence, price action, and red flags. This is a research tool, not a buy/sell recommendation engine.

## Primary Trigger

**`cr [coin name or ticker]`** — Execute immediately. Search first, then format.

Examples:
```
cr ONDO
cr Solana
cr Sui
cr ai16z
```

---

## Search Strategy

Run all searches before writing anything. Use today's date from context for current data.

**Run these searches in order:**

1. `[coin name] cryptocurrency project overview` — fundamentals, what it does, what problem it solves
2. `[coin ticker] tokenomics supply vesting schedule` — token mechanics
3. `[coin name] team founders background` — who built it
4. `[coin name] roadmap [current year] [next year]` — where it's going
5. `[coin ticker] price today chart` — current price, recent performance
6. `[coin ticker] exchange listings Binance Coinbase` — where it trades
7. `[coin name] news [current month year]` — recent developments
8. `[coin name] risks criticism concerns` — red flags, controversies, known problems
9. `[coin name] audit security smart contract` — security posture if applicable
10. `[coin ticker] CoinGecko` or `[coin ticker] CoinMarketCap` — market data: market cap, rank, volume, circulating supply

Fetch CoinGecko or CoinMarketCap pages directly if search snippets don't have clean market data numbers.

Stop searching when each section has enough to write. Do not pad sections with speculative content to fill gaps — mark unknown fields as `—` or `Not found`.

---

## Report Format

Output the full report inline as markdown. No file download needed. Use this exact structure:

```markdown
# [Coin Name] ($TICKER) — Research Report
*Generated [Month DD, YYYY] | Data as of [YYYY-MM-DD HH:MM UTC]*

---

## TL;DR

[3 to 5 sentence plain-English summary. What it is, what makes it interesting, and the single biggest risk. Written for someone who will decide in 60 seconds whether to keep reading.]

---

## Project Overview

| Field | Detail |
|---|---|
| Full Name | |
| Ticker | |
| Category | [Layer 1 / Layer 2 / DeFi / AI / RWA / Meme / Infrastructure / etc.] |
| Chain | [Native chain or which chain it runs on] |
| Launched | [Date or year] |
| Website | |
| Whitepaper | [Link or "Not public"] |
| GitHub | [Link or "Not public"] |

**What it does:**
[2 to 4 sentences. The actual problem it solves and how. No marketing language. If it sounds like a press release, rewrite it.]

**What makes it different:**
[1 to 3 sentences. The specific differentiator vs existing solutions. If there is no clear differentiator, say so.]

---

## Tokenomics

| Field | Detail |
|---|---|
| Current Price | $X.XX |
| Price Timestamp (UTC) | YYYY-MM-DD HH:MM |
| Price Source | [URL] |
| Market Cap | $X.XXB / $X.XXM |
| Market Cap Rank | #XXX (CoinGecko) |
| Circulating Supply | XXX,XXX,XXX |
| Total Supply | XXX,XXX,XXX |
| Max Supply | XXX,XXX,XXX or Unlimited |
| Fully Diluted Valuation | $X.XXB |
| 24h Volume | $X.XXM |
| All-Time High | $X.XX (Month YYYY) |
| All-Time Low | $X.XX (Month YYYY) |
| From ATH | -XX% |
| Market Data Source | [CoinGecko or CoinMarketCap URL] |

**Supply breakdown:**
[Table or bullet list of how total supply is allocated: team, investors, ecosystem, public sale, treasury, etc. Include vesting schedules and cliff dates if available.]

| Allocation | % | Vesting |
|---|---|---|
| Team | XX% | X year cliff, X year vest |
| Investors | XX% | |
| Ecosystem / Grants | XX% | |
| Public Sale | XX% | |
| Treasury | XX% | |

**Unlock risk:**
[Flag any large token unlocks coming in the next 3 to 12 months. These create sell pressure. If vesting schedule is not public, say so.]

**Inflation:**
[Is the supply inflationary, deflationary, or fixed? What is the annual emission rate if applicable?]

---

## Team & Backers

**Founders:**
[Names, backgrounds, previous projects. Are they doxxed? Do they have credible track records?]

**Key team members:**
[Other notable people if relevant]

**Investors / Backers:**
[VC firms, strategic investors, notable angels. Tier 1 VCs (a16z, Paradigm, Sequoia, Multicoin, Pantera) carry signal. Unknown or unlisted backers are a yellow flag.]

| Backer | Tier | Round | Amount |
|---|---|---|---|
| [Name] | [Tier 1 / 2 / 3 / Unknown] | [Seed / Series A / etc.] | $XXM or undisclosed |

**Team risk:**
[Anonymous team? First-time founders? Prior project failures or controversies? Say it plainly.]

---

## Exchange Listings

| Exchange | Pair(s) | Volume (24h) | Notes | Source |
|---|---|---|---|---|
| Binance | $TICKER/USDT | $X.XXM | | [URL] |
| Coinbase | $TICKER/USD | $X.XXM | | [URL] |
| Kraken | | | | [URL or `—`] |
| OKX | | | | [URL or `—`] |
| Bybit | | | | [URL or `—`] |
| DEX | [Uniswap / Jupiter / etc.] | $X.XXM | | [URL] |

**Listing notes:**
[Is it on a major US exchange? CEX only or DEX available? Any upcoming listing announcements?]

---

## Recent Price Action

| Period | Price Change |
|---|---|
| 24 hours | +/- X.XX% |
| 7 days | +/- X.XX% |
| 30 days | +/- X.XX% |
| 90 days | +/- X.XX% |
| 1 year | +/- X.XX% |
| vs BTC (30d) | +/- X.XX% [outperforming / underperforming BTC] |

**Price action source:**
[Primary chart or market data URL]

**Key levels:**
[Current support and resistance if available from chart analysis or search results. If not available, omit this row rather than guessing.]

**Market context:**
[1 to 2 sentences. Is this move part of a broader market trend or coin-specific? Is it near ATH or still down significantly?]

---

## Roadmap & Development

**Current status:**
[Mainnet live? Testnet? Pre-launch? What phase of development?]

**Recent milestones:**
[Last 3 to 6 months — what shipped?]

**Upcoming milestones:**
[What is planned for the next 6 to 12 months?]

**Development activity:**
[Is the GitHub active? When was the last commit? High commit frequency is a green flag. Dead repo is a red flag.]

---

## Use Case & Adoption

**Who uses it:**
[Real users, protocols, or institutions using this today — not just "planned partnerships"]

**TVL / Active addresses / other traction metrics:**
[Concrete numbers if available. DeFi protocols: TVL. L1/L2: active addresses, transactions per day. Skip if not applicable.]

**Partnerships:**
[Real integrations vs announcement-only partnerships. Flag if partnerships are just MOU/announcements with no shipping product.]

---

## Red Flags

[This section is not optional. Every coin has risks. Be direct. Use bullet points.]

**Structural concerns:**
- [e.g., Team holds large % of supply with short vesting]
- [e.g., No public audit of smart contracts]
- [e.g., Fully diluted valuation is 10x current market cap — massive dilution incoming]
- [e.g., Anonymous team]

**Market concerns:**
- [e.g., Heavy VC allocation unlocking in Q3 2025]
- [e.g., 80% of trading volume on one exchange — concentration risk]
- [e.g., Low liquidity on DEX pairs]

**Project concerns:**
- [e.g., Whitepaper is vague on technical implementation]
- [e.g., Roadmap milestones repeatedly delayed]
- [e.g., Competing with Ethereum directly with no clear technical advantage]

**Controversy / history:**
- [Any past exploits, hacks, rug accusations, team drama, SEC attention, or regulatory concerns]

If no significant red flags are found, write: "No major red flags identified. Standard risks apply — see Market Concerns above." Do not leave this section empty.

---

## Green Flags

[Balance the red flags with what actually looks good. Keep it honest — do not pad this section.]

- [e.g., Tier 1 VC backing from Paradigm and a16z]
- [e.g., Audited by Certik and Trail of Bits]
- [e.g., Live product with real users and measurable TVL]
- [e.g., FDV is close to market cap — low dilution risk]
- [e.g., Listed on Coinbase and Binance — high liquidity and retail access]

---

## Summary Scorecard

| Factor | Rating | Notes |
|---|---|---|
| Project fundamentals | ⬛⬛⬛⬜⬜ (3/5) | Qualitative assessment only |
| Tokenomics | ⬛⬛⬛⬜⬜ (3/5) | |
| Team credibility | ⬛⬛⬛⬜⬜ (3/5) | |
| Exchange liquidity | ⬛⬛⬛⬜⬜ (3/5) | |
| Development activity | ⬛⬛⬛⬜⬜ (3/5) | |
| Risk level | [Low / Medium / High / Very High] | |

**Overall:** [One sentence verdict on whether this looks like a credible project worth further consideration, a speculative punt, or something to avoid. No buy/sell recommendation — just a quality assessment of the project itself.]

---

## Sources

[Mandatory. Include direct URLs for every major section.]

- Project and docs: [Website, whitepaper, GitHub]
- Market data: [CoinGecko and or CoinMarketCap]
- Exchange listings and liquidity: [Binance, Coinbase, Kraken, etc.]
- Team and backers: [Official team page, fundraising reports]
- Security and audits: [Audit reports or security disclosures]
- News and milestones: [Recent dated sources]

If a source for a populated claim cannot be provided, remove the claim or mark it `Not found`.

---

*This report is for research purposes only. Not financial advice. Verify all data before trading.*
```

---

## Rating Scale

Use filled squares for the scorecard. 5 = excellent, 1 = poor or unknown.

```
⬛⬛⬛⬛⬛  5/5
⬛⬛⬛⬛⬜  4/5
⬛⬛⬛⬜⬜  3/5
⬛⬛⬜⬜⬜  2/5
⬛⬜⬜⬜⬜  1/5
```

**Scoring guide:**

- **Project fundamentals:** Real problem, clear solution, credible use case. Deduct for vague whitepaper, copycat project, or solution looking for a problem.
- **Tokenomics:** Fair distribution, reasonable vesting, no massive unlock overhang, FDV close to market cap. Deduct for team/VC heavy allocations, inflationary emissions, or hidden supply.
- **Team credibility:** Doxxed, track record, reputable backers. Deduct for anonymous, first-time, or previously failed/fraudulent founders.
- **Exchange liquidity:** Score qualitatively using multiple signals: trusted exchange coverage, 24h volume, pair diversity, and concentration risk. A top exchange listing alone does not guarantee a 5/5 score.
- **Development activity:** Active GitHub, shipped product, regular commits. Dead repo or no public code is 1/5.
- **Risk level:** Aggregate call based on all the above. Very High means this is a speculative bet even if everything looks fine.

---

## Rules

**Never fabricate data.** If a field cannot be found, mark it `—` or `Not found`. A shorter honest report beats a padded one.

**Source citations are mandatory.** Include direct source URLs throughout the report and include a final `Sources` section in every output.

**No buy/sell recommendations.** The report tells Mick what the project is and what the risks are. He decides what to do with it.

**Red Flags section is mandatory.** Every coin has risks. If this section is empty, the research is incomplete.

**Always produce the full report format.** Even when prompts are short such as "tell me about [coin]", use the full section set.

**Plain language throughout.** No crypto hype, no marketing speak. If the project description sounds like it came from their own website, rewrite it in plain English.

**Banned phrases:** "revolutionary", "next-generation", "disruptive", "game-changing", "paradigm shift", "the future of finance", "powered by cutting-edge", "seamlessly", "robust ecosystem"

**Price data must be current.** Always search for current price. Never use training data for market cap, price, or supply numbers.
