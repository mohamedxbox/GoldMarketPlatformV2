# GoldMarketPlatform – Recovery + UI Fix

## What changed

1. **Shutdown persistence / Recovery anchor**
   - The live-storage writer now has its own cancellation lifetime.
   - On application exit, the MT5 worker is stopped first, then the storage channel is completed and drained before the storage task exits.
   - This prevents the last queued live ticks from being lost on shutdown, which could make the next startup recover a large artificial gap such as 16:35 → 19:34.

2. **Recovery diagnostics**
   - The UI now shows the locally persisted time range in addition to the requested MT5 recovery range.
   - The current M5 candle count remains visible in the top dashboard.

3. **UI layout**
   - Restored a compact dashboard-style layout with a visible central decision area.
   - Added dedicated pages for:
     - القرار والفرص
     - خريطة السوق
     - التحليل
     - M5 / البيانات
     - الاستعادة / الذاكرة
   - Added visible sections for current/potential opportunity state and previous decision history.
   - Added responsive scrolling to tables and analytical pages.
   - Enabled normal Windows minimize/maximize/resize behavior explicitly.

4. **No fake trade candidates**
   - The current engine still exposes one final decision. The UI does not invent independent scores for long-term/medium-term/scalping/sniper candidates; it displays the actual decision produced by the current engine and records previous decisions.

## Important test limitation

The development environment used to prepare this package does not contain the .NET SDK, so a local `dotnet build` could not be executed here. XAML XML parsing and source-level consistency checks were performed. The package should be built on the Windows development machine with the installed .NET 8 SDK before replacing the live deployment.
