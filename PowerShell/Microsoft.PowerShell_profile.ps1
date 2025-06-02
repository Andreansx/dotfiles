$ThemePath = Join-Path $PSScriptRoot "win11-main.omp.json"

if (Test-Path $ThemePath) {
    oh-my-posh init pwsh --config "$ThemePath" | Invoke-Expression
} else {
    Write-Warning "Didn't find a theme under theme path: $ThemePath"
    Write-Warning "Using default theme for PowerShell"
}
