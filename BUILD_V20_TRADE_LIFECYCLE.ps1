$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root
Write-Host '=== GoldMarketPlatform V20 build ===' -ForegroundColor Cyan
dotnet restore .\GoldMarketPlatform\GoldMarketPlatform.slnx
dotnet build .\GoldMarketPlatform\GoldMarketPlatform.slnx -c Debug --no-restore
dotnet test .\GoldMarketPlatform.Tests\GoldMarketPlatform.Tests.csproj -c Debug --no-build
Write-Host '=== V20 BUILD + TEST SUCCESS ===' -ForegroundColor Green
