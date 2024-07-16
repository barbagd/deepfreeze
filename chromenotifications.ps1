# Define the path to the registry key
$registryPath = "HKLM:\Software\Policies\Google\Chrome"

# Define the name of the registry value
$valueName = "DefaultNotificationsSetting"

# Define the value type and data
#$valueType = "DWORD"
$valueData = 2

# Create the registry key if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
Set-ItemProperty -Path $registryPath -Name $valueName -Value $valueData

Write-Output "Registry key and value created successfully."
