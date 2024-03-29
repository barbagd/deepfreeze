#Battery Saver on by default

# Check if the property exists and set it accordingly
$path = "HKLM:\SYSTEM\CurrentControlSet\Control\Power"
$propertyName = "EcoModeState"
$newValue = 1

# Ensure the path exists
if (-Not (Test-Path $path)) {
    New-Item -Path $path -Force
}

# Check if the property already exists
if (Get-ItemProperty -Path $path -Name $propertyName -ErrorAction SilentlyContinue) {
    # Property exists, so update it
    Set-ItemProperty -Path $path -Name $propertyName -Value $newValue
} else {
    # Property doesn't exist, so create it
    New-ItemProperty -Path $path -Name $propertyName -Value $newValue -PropertyType DWORD
}

# Verify the operation
Get-ItemProperty -Path $path -Name $propertyName
