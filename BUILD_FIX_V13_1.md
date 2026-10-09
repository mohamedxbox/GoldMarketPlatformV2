# V13.1 Build Fix

Error fixed:
`Could not copy the file "...\Data\GoldMarketTicks.db" because it was not found.`

Cause: GoldMarketPlatform.csproj had a Content item pointing to a source DB file outside the project package.

Fix: removed that Content item. App.xaml.cs creates the runtime Data directory and SqliteTickStorage creates the database if it does not exist.

Expected behavior:
- Fresh install: Data/GoldMarketTicks.db is created automatically.
- Restart: the same DB is reused, preserving recovered/live tick history.
