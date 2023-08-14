# Set the mouse sensitivity to 8
$mouseSensitivity = 5

# Set the mouse sensitivity registry key value
$regPath = "HKCU:\Control Panel\Mouse"
Set-ItemProperty -Path $regPath -Name MouseSensitivity -Value $mouseSensitivity
