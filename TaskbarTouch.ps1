# Optimise taskbar for touch interactions when this device is used as a tablet for all users

# Get all user SIDs from HKEY_USERS (excluding .DEFAULT, system, and service accounts)
$users = Get-ChildItem "Registry::HKEY_USERS" | Where-Object { $_.Name -match "S-1-5-21-\d+-\d+-\d+-\d+$" }

# Define the registry subpath and property
$subPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
$propertyName = "ExpandableTaskbar"
$newValue = 0

# Loop through each user and update the registry setting
foreach ($user in $users) {
    $userSID = $user.PSChildName
    $fullPath = "Registry::HKEY_USERS\$userSID\$subPath"

    # Ensure the path exists
    if (-Not (Test-Path $fullPath)) {
        New-Item -Path $fullPath -Force
    }

    # Check if the property already exists
    if (Get-ItemProperty -Path $fullPath -Name $propertyName -ErrorAction SilentlyContinue) {
        # Property exists, so update it
        Set-ItemProperty -Path $fullPath -Name $propertyName -Value $newValue
    } else {
        # Property doesn't exist, so create it
        New-ItemProperty -Path $fullPath -Name $propertyName -Value $newValue -PropertyType DWORD
    }

    # Verify the operation
    Get-ItemProperty -Path $fullPath -Name $propertyName
}

Write-Output "Taskbar optimisation applied to all user profiles."
