# GoldMarketPlatform V13 — Data Recovery + Multi-Timeframe Fix

## What changed
- Startup/local recovery rebuilds from a real 45-day time window instead of a 500,000-tick cap.
- First MT5 bootstrap requests 45 days, then subsequent startups request only the missing gap.
- M5 remains the execution frame, but the recovered history is sufficient for D1/W1/month context when MT5 supplies it.
- The UI now reports actual completed candle counts for M5/M15/H1/H4/D1/W1/MN and the recovery analysis window.
- Monthly Market Map resampling uses calendar months instead of a generic 30-day bucket.
- Recovery status explicitly reports that the MTF state was rebuilt.

## Important test
The delivery environment does not have the .NET SDK, so a fresh compile cannot be executed here. Build in Visual Studio, attach the MT5 bridge, then verify that a fresh database performs the 45-day bootstrap and a restart rebuilds the same analysis window before requesting only the live gap.


## V13.1 startup database fix
- Removed the stale MSBuild Content entry that referenced `..\Data\GoldMarketTicks.db`.
- The previous package did not contain that source file, causing MSBuild error MSB3030 during copy.
- The application already creates `%APP%\Data` and opens/creates `GoldMarketTicks.db` at runtime, so no source DB file is required to build.
- Existing database persistence is preserved when the application restarts because the runtime path remains `AppContext.BaseDirectory\Data\GoldMarketTicks.db`.
