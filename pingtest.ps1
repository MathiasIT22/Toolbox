$pingResult = Test-NetConnection -ComputerName "192.168.0.1" -InformationLevel Quiet -Timeout 1000
Set-ExecutionPolicy RemoteSigned -Scope Process
if ($pingResult.PingSucceeded) {
    $message = "Ping to 8.8.8.8 was successful!"
} else {
    $message = "Ping to 182.168.0.1 failed."
}

Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.MessageBox]::Show($message, "Ping Result", 0, 64)