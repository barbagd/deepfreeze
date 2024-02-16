# Define the user and group names
$userName = "reservation"
$groupName = "Remote Desktop Users"

try {
    # Get the local user object
    $user = Get-LocalUser -Name $userName -ErrorAction Stop
}
catch {
    Write-Error "Failed to find user '$userName'. Error: $_"
    exit 1
}

try {
    # Get the local group object
    $group = Get-LocalGroup -Name $groupName -ErrorAction Stop
}
catch {
    Write-Error "Failed to find group '$groupName'. Error: $_"
    exit 1
}

try {
    # Add the user to the group
    Add-LocalGroupMember -Group $group -Member $user -ErrorAction Stop
    Write-Host "Successfully added '$userName' to '$groupName'."
}
catch {
    Write-Error "Failed to add user '$userName' to group '$groupName'. Error: $_"
}
