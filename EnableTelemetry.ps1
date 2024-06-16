Write-Host "Enabling Telemetry..."

# pane reg 3
$telemetryLevel = 3
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$registryValue = "AllowTelemetry"
Set-ItemProperty -Path $registryPath -Name $registryValue -Type DWORD -Value $telemetryLevel -Force

# luba diagnosticdataviewer
$diagnosticDataViewerPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection\DiagData"
$diagnosticDataViewerValue = "EnableDiagData"
Set-ItemProperty -Path $diagnosticDataViewerPath -Name $diagnosticDataViewerValue -Type DWORD -Value 1 -Force

Write-Host "Telemetry enabled successfully!"