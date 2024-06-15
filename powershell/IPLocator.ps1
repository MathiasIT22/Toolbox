Add-Type -AssemblyName System.Windows.Forms
#teeb formi ning koik muu vajaliku
$form = New-Object System.Windows.Forms.Form
$form.Text = "IP Location Finder"
$form.Size = New-Object System.Drawing.Size(300,250)
$form.StartPosition = "CenterScreen"

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,75)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = "OK"
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,75)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = "Cancel"
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = "Enter IP address to locate:"
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$resultLabel = New-Object System.Windows.Forms.Label
$resultLabel.Location = New-Object System.Drawing.Point(10,100)
$resultLabel.Size = New-Object System.Drawing.Size(280,100)
$resultLabel.Text = ""
$form.Controls.Add($resultLabel)

$form.Topmost = $true
#votab sisestatud info ning kasutab lehte ip-api, ning votab sealt json filest vajaliku info ning esitleb seda
$okButton.Add_Click({
    $IPaddress = $textBox.Text
    try {
        $result = Invoke-RestMethod -Method Get -Uri "http://ip-api.com/json/$IPaddress"
        $resultLabel.Text = $result | ConvertTo-Json -Compress
    } catch {
        $resultLabel.Text = "$($Error[0])"
    }
})

$form.Add_Shown({$textBox.Select()})
$form.ShowDialog() | Out-Null