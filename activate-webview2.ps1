Write-Host "=========================================" -ForegroundColor Green
Write-Host "    ENABLING WEBVIEW2 FOR GODADDY M365    " -ForegroundColor Green
Write-Host "=========================================" -ForegroundColor Green

# Define the target path and value name required by GoDaddy
\$RegistryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\AAD"
\$ValueName    = "WebView2Integration"

try {
    # 1. Create the AAD registry folder key if it doesn't exist
    if (-not (Test-Path \$RegistryPath)) {
        Write-Host "Creating missing AAD registry key path..." -ForegroundColor Yellow
        New-Item -Path \$RegistryPath -Force | Out-Null
    }

    # 2. Inject the WebView2Integration DWORD and set it to 1
    Write-Host "Activating WebView2 Integration flag..." -ForegroundColor Yellow
    New-ItemProperty -Path RegistryPath -Name ValueName -Value 1 -PropertyType DWORD -Force | Out-Null

    # 3. Verify it was written successfully
    \$CurrentValue = (Get-ItemProperty -Path RegistryPath -Name ValueName).WebView2Integration
    if (\$CurrentValue -eq 1) {
        Write-Host "`n[SUCCESS] Registry updated! WebView2 is now active for Outlook sign-ins." -ForegroundColor Green
        Write-Host "[NOTICE] Please restart Outlook (or reboot your PC) for changes to take effect." -ForegroundColor Cyan
    } else {
        throw "Registry entry was created but value verification failed."
    }
}
catch {
    Write-Host "`n[ERROR] Failed to modify registry: \$_" -ForegroundColor Red
    Write-Host "Ensure you ran your main PowerShell prompt as an Administrator!" -ForegroundColor Yellow
}
