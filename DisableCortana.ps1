# keela cortana registris
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
$registryValue = "SearchboxTaskbarMode"
$registryType = "DWORD"
$registryValueData = 0

if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

Set-ItemProperty -Path $registryPath -Name $registryValue -Type $registryType -Value $registryValueData -Force

# keela cortana otsing
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
$registryValue = "BingSearchEnabled"
$registryType = "DWORD"
$registryValueData = 0

if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

Set-ItemProperty -Path $registryPath -Name $registryValue -Type $registryType -Value $registryValueData -Force

# keela haalecommandid ning aktiveerimine
$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search\Flights\3"
$registryValue = "VoiceActivationEnabled"
$registryType = "DWORD"
$registryValueData = 0

if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

Set-ItemProperty -Path $registryPath -Name $registryValue -Type $registryType -Value $registryValueData -Force

Write-Host "Cortana has been disabled."