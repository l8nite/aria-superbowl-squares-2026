# Update build timestamp in index.html before commit
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
$file = Join-Path $PSScriptRoot "index.html"
$content = Get-Content $file -Raw
$content = $content -replace "BUILD_TIME_PLACEHOLDER", $timestamp
$content | Set-Content $file -NoNewline
Write-Host "Updated build timestamp to: $timestamp"
git add $file
