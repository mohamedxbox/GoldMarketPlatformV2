# Gold Market Platform V15 — Recovery + UI Fix

## Included
- Restored the richer multi-page decision UI: Market Map, Schools by Timeframe, Analysis, Decision Zone, Final Decision, Opportunity History, M5/Data, Recovery/Memory.
- Restored four independent trade candidates (Long Term, Medium Term, Scalping, Sniper Hunt) in the central decision engine.
- The Decision Zone now shows all candidates, not only one selected trade.
- Eligible opportunities remain visible after a transient score dip; the last confirmed opportunity is retained for review until a new confirmed opportunity replaces it.
- Added an opportunity-history table for confirmed opportunities during the current session.
- Added storage-lag and persisted-range diagnostics to make recovery behavior observable.
- Fixed normal WPF shutdown so StopAsync is completed synchronously before process exit; this prevents the storage queue from being abandoned and creating an artificial recovery gap on the next launch.
- Existing SQLite time-window recovery and MT5 exact millisecond recovery are retained.

## Important behavior
The platform does not claim that every market movement must produce a trade. It records all four candidate evaluations and separately shows which ones are currently eligible.

## Verification
This environment does not contain the .NET SDK, so a local `dotnet build` could not be executed here. The source changes were kept within the existing project APIs and the previous working candidate engine/UI structure.
