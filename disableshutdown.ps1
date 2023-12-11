# Set 1 to disable shutdown and 0 to enable
$Value = 1

# Set the disable shutdown registry key value
$regPath = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Start\HideShutDown"
Set-ItemProperty -Path $regPath -Name Value -Value $Value
