# Roadmap Alignment: Trading Strategy Validator

## Proposed Enhancements

Roadmap goal: "Evaluates trading ideas. Outputs win rate estimates and risk profile."

Current scope: Guides safe trading workflows and repo management within Alpaca Trading repo.

### Phase 1: Strategy Evaluation Framework

- Accept a trading strategy description (entry signal, exit signal, position sizing rules, risk management)
- Analyze the strategy for common flaws (whipsaw risk, correlation risk, liquidity risk)
- Output a structured evaluation including:
  - Conceptual soundness score
  - Market regime suitability (trend, range, volatility profile)
  - Known pitfalls and how the strategy addresses them
  - Estimated win rate range (conservative/realistic/optimistic)

### Phase 2: Risk Profile Analysis

- Calculate risk metrics from the strategy:
  - Max drawdown expectation
  - Risk/reward ratio
  - Time to recovery estimate
  - Correlation to market indices
- Output risk category (conservative, moderate, aggressive)
- Highlight exposure concentrations (sector, volatility regime, etc.)

### Phase 3: Backtesting Integration

- Link validated strategies to backtesting harness
- Generate backtesting script templates with the validated rules
- Produce historical performance reports for manual strategies (win rate, profit factor, etc.)
- Compare realized vs. expected metrics post-launch

## Related Skills

See also: Alpaca Trading (repo management and safe execution patterns).
