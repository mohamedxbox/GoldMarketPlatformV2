# V17 — Data/MTF/Decision Integrity Fix

- Persistent completed M5 memory remains the canonical analysis history.
- MTF display counts are reconstructed from persisted M5 instead of resetting to zero on restart.
- Startup recovery uses raw ticks only for the missing/live tail; it does not rebuild the entire M5 history into RAM.
- MTF analysis continues to resample the complete persisted M5 history into M15/H1/H4/D1/W1/MN for every pipeline run.
- Recovery `historyGap` notices no longer permanently block analysis when the minimum usable M5 history exists; gaps remain visible as a data-quality warning.
- M5 persistence writes are tracked and drained on shutdown so the last completed candle is not lost.
- Opposite eligible candidates are treated as analytical conflicts regardless of SL/TP overlap. All conflicting candidates remain visible and automatic final entry is blocked.
- Added a deterministic conflict unit test.

Note: build/test execution could not be performed in this environment because the .NET SDK is not installed. The project source was inspected and patched consistently with its existing .NET 8 structure.
