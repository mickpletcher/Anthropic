---
name: crypto-listings
description: Retrieve new cryptocurrency listings from the past 7 days and upcoming listings in the next 7 days across major exchanges. Always trigger immediately when the user's message starts with "cl" or says "crypto listings", "new crypto", "new coins", "upcoming listings", "what cryptos just launched", "what coins are launching", or any variation asking about recently listed or soon-to-be-listed cryptocurrencies. Always search the web before responding — never answer from memory for listings data.
---

# Crypto Listings Skill

Retrieve and format new and upcoming cryptocurrency listings across major exchanges. Covers coins that hit the market in the last 7 days and coins scheduled to list in the next 7 days.

## Primary Trigger

**`cl`** — Execute immediately. Search first, then format. No clarifying questions.

Other triggers: "crypto listings", "new crypto", "new coins this week", "upcoming listings", "what cryptos just launched", "what coins are coming"

---

## Data Sources — Search Strategy

Run all searches before writing anything. Today's date is available in context — use it to calculate the exact 7-day windows.

**Run these searches:**

1. `new cryptocurrency listings this week [current month year]` — broad recent listings sweep
2. `Binance new listings [current month year]` — Binance is the highest-volume exchange; new listings here move markets
3. `Coinbase new asset listings [current month year]` — US-regulated exchange, high retail visibility
4. `upcoming crypto listings next week [current month year]` — forward-looking listings
5. `CoinGecko new coins listed [current month year]` — aggregator with broad coverage
6. `Kraken new listings [current month year]` — additional major exchange coverage
7. `OKX new listings [current month year]` — major exchange coverage
8. `Bybit new listings [current month year]` — major exchange coverage
9. `KuCoin new listings [current month year]` — major exchange coverage

**Fetch these pages directly if search results are thin:**
- `https://www.binance.com/en/support/announcement/new-cryptocurrency-listing` — Binance official announcement page
- `https://www.coinbase.com/blog/tag/new-assets` — Coinbase asset announcements
- `https://www.coingecko.com/en/new-cryptocurrencies` — CoinGecko new coins feed

**Additional aggregator searches if needed:**
- `CoinMarketCap new listings [current month year]`
- `crypto exchange listings calendar [current month year]`

Search until at least 5 recent listings and 3 upcoming listings are found, or until sources are exhausted.
For every upcoming listing row, capture at least one official exchange source URL.

---

## Step 2 — Format the Brief

Use this exact structure. Output inline as markdown.

```markdown
# Crypto Listings Brief — [Month DD, YYYY]
*Past 7 days and next 7 days | Sources: [list sources used]*

---

## Recently Listed — Last 7 Days

| Coin | Ticker | Listed Date | Exchange(s) | Category | Launch Price (USD) | Current Price (USD) | Price Timestamp (UTC) | Source(s) |
|---|---|---|---|---|---|---|---|---|
| [Name] | $XXX | MMM DD | Binance, Coinbase | [DeFi / Layer 1 / Meme / AI / RWA / etc.] | $X.XX | $X.XX | YYYY-MM-DD HH:MM | [Official URL, Aggregator URL] |

---

## Upcoming Listings — Next 7 Days

| Coin | Ticker | Expected Date | Exchange(s) | Category | Notes | Source(s) |
|---|---|---|---|---|---|---|
| [Name] | $XXX | MMM DD | [Exchange] | [Category] | [IEO / airdrop / mainnet launch / etc.] | [Official exchange URL] |

---

## Exchange Activity Summary

| Exchange | Recent Listings (7d) | Upcoming (7d) |
|---|---|---|
| Binance | X | X |
| Coinbase | X | X |
| Kraken | X | X |
| Other | X | X |

---

## Notes

- [Any data gaps — e.g., "Upcoming listings data is limited; exchanges often announce within 24-48 hours of listing"]
- [Any notable listings worth flagging — e.g., major exchange debut, high-profile project]
- [Source freshness note if any data may be stale]
- [Rumored listings that do not have official exchange confirmation]

---

*Data pulled [date] — verify on exchange before trading*
```

---

## Field Definitions

**Category** — Use the most specific applicable label:
- Layer 1, Layer 2, DeFi, DEX, Lending, Stablecoin, Meme, AI, RWA (Real World Assets), Gaming/GameFi, Infrastructure, Privacy, Oracle, Bridge

**Launch Price** — The price at the time of listing if available. Mark `—` if not found.

**Current Price** — Use USD quote. Prefer official exchange price if available, then CoinGecko, then CoinMarketCap. Mark `—` if not found.

**Price Timestamp (UTC)** — Timestamp when the Current Price value was pulled, in `YYYY-MM-DD HH:MM` format.

**Source(s)** — Include at least one URL per row. For upcoming listings, source must include an official exchange announcement URL.

**Notes (Upcoming)** — Flag the listing type if known:
- IEO (Initial Exchange Offering)
- IDO (Initial DEX Offering)
- Airdrop listing
- Mainnet launch
- Migration from another chain
- Community vote listing (Binance Vote to List)

---

## Rules

**Always search first.** Crypto listings change daily. Never use training data for listing dates, prices, or which coins are new.

**Use exact time windows in UTC.** "Last 7 days" means now minus 168 hours through now. "Next 7 days" means now through now plus 168 hours.

**Mark gaps honestly.** If upcoming listing data is sparse, say so. Exchanges often announce listings 24 to 48 hours in advance, making the upcoming table inherently incomplete. Note this rather than padding with unconfirmed rumor.

**Exchange priority order:** Binance > Coinbase > Kraken > OKX > Bybit > KuCoin. If a coin lists on multiple exchanges, show all of them comma-separated.

**Upcoming listings require official confirmation.** Only include a coin in the Upcoming table when at least one official exchange announcement URL is available. Place unconfirmed items in Notes as `Rumored`.

**No price predictions.** The brief shows what the data says. No commentary on whether a coin looks bullish, promising, or worth buying. Mick decides.

**Flag Binance listings specifically.** A Binance listing typically drives a significant price event within the first 24 to 48 hours. If any upcoming listing is confirmed for Binance, note it clearly in the Notes column.

**Upcoming table is best-effort.** Exchanges rarely publish full forward calendars. The upcoming section captures what is officially announced.

**Source traceability is required.** Every row in both tables must include source URLs so dates, exchanges, and prices can be verified quickly.

---

## Extended Mode

If Mick adds `+detail` after the trigger (`cl +detail`), add a third section after Upcoming Listings:

### Recently Listed — Detail View

For each coin in the recent listings table, add a one-paragraph summary (3 to 5 sentences) covering:
- What the project does
- What chain or ecosystem it operates on
- Token utility (governance, gas, staking, etc.)
- Any notable backers, partnerships, or launch metrics

Keep it factual. No hype language.
