
# Define the registry key path and value
$regKeyPath = "Control Panel\Mouse"
$regValueName = "MouseSensitivity"
$regValueData = "5"

# Get user profiles using Win32_UserProfile class
$userProfiles = Get-WmiObject Win32_UserProfile | Where-Object { $_.Special -eq $false }

# Iterate through each user profile and set the registry key
foreach ($userProfile in $userProfiles) {
    $sid = $userProfile.SID
    $regPath = "Registry::HKEY_USERS\$sid\$regKeyPath"

    Set-ItemProperty -Path $regPath -Name $regValueName -Value $regValueData
}


#Write-Host "Registry keys set for all user profiles."





