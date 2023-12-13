# Define the path to the INI file
$iniFilePath = 'C:\users\reservation\appdata\roaming\nvda\nvda.ini'

# Set the new content
$newContent = "
schemaVersion = 10
[development]
[upgrade]
[general]
	showWelcomeDialogAtStartup = True
	language = Windows
	saveConfigurationOnExit = True
	askToExit = True
	playStartAndExitSounds = True
	loggingLevel = INFO
[update]
	allowUsageStats = False
	askedAllowUsageStats = True
	autoCheck = False
	startupNotification = False
[speech]
	synth = oneCore
	[[oneCore]]
		voice = HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Speech_OneCore\Voices\Tokens\MSTTS_V110_enUS_DavidM
		volume = 100
[braille]
	[[noBraille]]
[vision]
	[[NVDAHighlighter]]
		highlightFocus = False
		highlightNavigator = False
		highlightBrowseMode = False
	[[screenCurtain]]


"

# Replace the content of the INI file with the new text
$newContent | Out-File -FilePath $iniFilePath -Force

Write-Host "INI file content replaced successfully."
