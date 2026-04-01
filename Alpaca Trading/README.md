# alpaca-trading

A Claude skill for building, extending, and debugging algorithmic trading scripts against the Alpaca API.

## What It Does

Generates PowerShell-first trading scripts aligned with Mick's five-module repo structure. Enforces paper trading by default, mandatory live trading guards, trade journal logging, and Claude API integration as a reasoning layer only — never as a direct execution trigger.

## Trigger Phrases

| Phrase | Action |
|--------|--------|
| `alpaca script for...` | Generate a trading script for the described task |
| `backtesting script` | Historical strategy testing module |
| `paper trading...` | Simulated execution against paper endpoint |
| `live trading...` | Live script with mandatory CONFIRM guard |
| `trade journal entry` | Log schema and CSV append pattern |
| `AI coaching for...` | Claude API reasoning layer integration |

## Repo Structure: mickpletcher/Alpaca

```
Alpaca/
├── Backtesting/    ← Historical strategy testing
├── PaperTrading/   ← Simulated execution (paper endpoint)
├── LiveTrading/    ← Real money (requires explicit -LiveTrading switch + CONFIRM)
├── TradeJournal/   ← P&L tracking, CSV logging, trade records
└── AICoaching/     ← Claude API reasoning layer
```

## Safety Rules Always Enforced

- API keys loaded from environment variables only — never hardcoded
- Paper trading endpoint used by default
- Live trading requires `-LiveTrading` switch plus typing `CONFIRM` at runtime
- All orders logged to trade journal before and after execution
- Claude API used as input to decision logic only — never triggers orders directly

## Live Trading Guard

Every script touching real money includes this pattern — it cannot be removed:

```powershell
if ($LiveTrading) {
    $Confirm = Read-Host "Type CONFIRM to proceed with live trading"
    if ($Confirm -ne "CONFIRM") { exit 0 }
}
```

## AI Coaching Pattern

Claude returns `BULLISH`, `BEARISH`, or `NEUTRAL` with a one-sentence rationale based on price, volume, RSI, and MACD inputs. PowerShell code makes the actual trade decision — Claude is analysis only.

## Trade Journal Schema

Each trade logs: Timestamp, Symbol, Side, Qty, EntryPrice, ExitPrice, PnL, OrderId, Mode (Paper/Live), AISignal, Notes.

## Script Conventions

All scripts follow the powershell-automation skill standards: Mick's comment-based help header, `[CmdletBinding()]`, `param()` with validation, CMTrace log file, `try/catch` on all API calls, and approved PowerShell verbs.

## Files

```
alpaca-trading/
└── SKILL.md    ← Repo structure, API reference, core patterns, live guard, journal schema, safety checklist
```

## Installation

Drop `alpaca-trading.skill` into your Downloads folder and run `Initialize-ClaudeSkills.ps1` to install. Restart Claude Desktop to load.
