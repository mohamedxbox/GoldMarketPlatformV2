# V15.2 — SchoolVote TimeFrame compatibility fix

## Build error fixed
`SchoolVote` had the canonical property `Frame`, while decision/UI code can reference `SchoolVote.TimeFrame`.

The model now exposes both:
- `Frame` — canonical value
- `TimeFrame` — read-only compatibility alias returning `Frame`

This removes the compile error:
`SchoolVote does not contain a definition for TimeFrame`.

## Note
The package was source-checked for the exact model/reference mismatch. The execution environment used to prepare this package does not have the .NET SDK installed, so a local `dotnet build` could not be executed here. The package should be built in Visual Studio on the user's machine.
