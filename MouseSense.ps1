
# Define the registry key path and value
$regKeyPath = "Control Panel\Mouse"
$regValueName = "MouseSensitivity"
$regValueData = "5"

# Get all user profiles under HKEY_USERS
$userProfiles = Get-Item -LiteralPath "Registry::HKEY_USERS\*" -ErrorAction SilentlyContinue

# Iterate through each user profile and set the registry key
foreach ($userProfile in $userProfiles.PSChildName) {
    $regPath = "Registry::HKEY_USERS\$userProfile\$regKeyPath"
    New-Item -Path $regPath -Force | Out-Null
    Set-ItemProperty -Path $regPath -Name $regValueName -Value $regValueData
}

Write-Host "Registry keys set for all user profiles."
