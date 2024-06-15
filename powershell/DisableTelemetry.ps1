Write-Host "Disabling Telemetry..."

# Pane reg value 0
$telemetryLevel = 0
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
$registryValue = "AllowTelemetry"
Set-ItemProperty -Path $registryPath -Name $registryValue -Type DWORD -Value $telemetryLevel -Force

# Keela diagnosticdataviewer
$diagnosticDataViewerPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection\DiagData"
$diagnosticDataViewerValue = "EnableDiagData"
Set-ItemProperty -Path $diagnosticDataViewerPath -Name $diagnosticDataViewerValue -Type DWORD -Value 0 -Force

# keela muud asjad
$servicesToDisable = @(
    "diagnosticshub.standardcollector.service"
    "diagnosticshub.standardcollector.host"
    "dmwappushservice"
)
foreach ($service in $servicesToDisable) {
    $serviceName = $service
    $servicePath = "HKLM:\SYSTEM\CurrentControlSet\Services\$serviceName"
    Set-ItemProperty -Path $servicePath -Name "Start" -Type DWORD -Value 4 -Force
    Stop-Service -Name $serviceName -Force
}

Write-Host "Telemetry disabled successfully!"