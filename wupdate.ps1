# Get the Windows Update service
$service = Get-Service -Name wuauserv

# Check if the service is disabled
if ($service.StartType -eq "Disabled") {
    # Set the service to manual start
    Set-Service -Name wuauserv -StartupType Manual
}

# Start the service
#Start-Service -Name wuauserv
