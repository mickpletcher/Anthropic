# crypto-listings

A Claude skill for retrieving new cryptocurrency listings from the last 7 days and upcoming listings in the next 7 days across major exchanges.

## Trigger

Start any message with `cl` to activate this skill immediately. It also triggers on natural language requests about new or upcoming coin listings.

```text
cl
crypto listings
new crypto
new coins this week
upcoming listings
what cryptos just launched
what coins are coming
```

## What It Does

Searches current web sources first, then returns a structured listings brief. It never answers listings data from memory.

### Search sources

Focuses on exchange announcements and major aggregators, including:

1. Binance listing announcements
2. Coinbase new asset announcements
3. CoinGecko new cryptocurrency feed
4. Kraken listing updates
5. OKX listing updates
6. Bybit listing updates
7. KuCoin listing updates
8. Additional sources such as CoinMarketCap listing pages when needed

For each upcoming listing row, include at least one official exchange announcement URL.

### Output structure

Returns a markdown brief with:

1. Recently Listed table for the last 7 days
2. Upcoming Listings table for the next 7 days
3. Exchange Activity Summary table
4. Notes section for data gaps, notable listings, and freshness caveats

## Required Brief Format

```markdown
# Crypto Listings Brief — [Month DD, YYYY]
*Past 7 days and next 7 days | Sources: [list sources used]*

---

## Recently Listed — Last 7 Days

| Coin | Ticker | Listed Date | Exchange(s) | Category | Launch Price (USD) | Current Price (USD) | Price Timestamp (UTC) | Source(s) |
|---|---|---|---|---|---|---|---|---|
| [Name] | $XXX | MMM DD | Binance, Coinbase | [Category] | $X.XX | $X.XX | YYYY-MM-DD HH:MM | [Official URL, Aggregator URL] |

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

- [Data gaps]
- [Notable listings]
- [Source freshness]
- [Rumored listings that do not have official exchange confirmation]

---

*Data pulled [date] — verify on exchange before trading*
```

## Rules

1. Always search first before writing output
2. Use exact UTC windows: last 7 days means now minus 168 hours through now, next 7 days means now through now plus 168 hours
3. Mark missing data honestly instead of filling with rumor
4. Show all exchanges when a coin is multi listed
5. Do not provide price predictions or buy and sell commentary
6. Flag Binance listings clearly in notes when present
7. Only include an item in Upcoming Listings when at least one official exchange announcement URL is available
8. Put unconfirmed items in Notes as `Rumored`
9. Include source URLs for every row so dates, exchanges, and prices are verifiable

## Price and Source Rules

- Current Price uses USD quote
- Source preference for Current Price: official exchange first, then CoinGecko, then CoinMarketCap
- If Launch Price or Current Price is not available, use `—`
- Price Timestamp must be in `YYYY-MM-DD HH:MM` UTC format

## Category Labels

Use the most specific applicable category:

Layer 1, Layer 2, DeFi, DEX, Lending, Stablecoin, Meme, AI, RWA, Gaming or GameFi, Infrastructure, Privacy, Oracle, Bridge.

## Extended Mode

If the request includes `+detail` such as `cl +detail`, the output adds a detail section for each recent listing with:

1. Project purpose
2. Chain or ecosystem
3. Token utility
4. Notable backers, partnerships, or launch metrics

Detail mode remains factual and avoids hype language.

## File Structure

```text
Cryptolistings/
├── README.md
└── skill.md
```
