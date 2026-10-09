$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $root

Write-Host "GoldMarketPlatform final validation" -ForegroundColor Cyan
$dotnet = Get-Command dotnet -ErrorAction SilentlyContinue
if (-not $dotnet) { throw "dotnet SDK not found. Install .NET 8 SDK, then run this script again." }

dotnet --info
dotnet restore .\GoldMarketPlatform\GoldMarketPlatform.csproj
dotnet build .\GoldMarketPlatform\GoldMarketPlatform.csproj
if ($LASTEXITCODE -ne 0) { throw "BUILD FAILED" }
dotnet test .\GoldMarketPlatform.Tests\GoldMarketPlatform.Tests.csproj
if ($LASTEXITCODE -ne 0) { throw "TESTS FAILED" }
Write-Host "BUILD + TESTS PASSED" -ForegroundColor Green
