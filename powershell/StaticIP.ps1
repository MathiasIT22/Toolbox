Add-Type -AssemblyName System.Windows.Forms

# teeb vormi kus ta kysib infot
$form = New-Object System.Windows.Forms.Form
$form.Text = "Seadista staatiline IP-aadress"
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = "CenterScreen"

$label1 = New-Object System.Windows.Forms.Label
$label1.Location = New-Object System.Drawing.Point(10,20)
$label1.Size = New-Object System.Drawing.Size(280,20)
$label1.Text = "Enter IP-aadress:"
$form.Controls.Add($label1)

$textBox1 = New-Object System.Windows.Forms.TextBox
$textBox1.Location = New-Object System.Drawing.Point(10,40)
$textBox1.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox1)

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(10,60)
$label2.Size = New-Object System.Drawing.Size(280,20)
$label2.Text = "Enter mask:"
$form.Controls.Add($label2)

$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Location = New-Object System.Drawing.Point(10,80)
$textBox2.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox2)

$label3 = New-Object System.Windows.Forms.Label
$label3.Location = New-Object System.Drawing.Point(10,100)
$label3.Size = New-Object System.Drawing.Size(280,20)
$label3.Text = "Enter Gateway:"
$form.Controls.Add($label3)

$textBox3 = New-Object System.Windows.Forms.TextBox
$textBox3.Location = New-Object System.Drawing.Point(10,120)
$textBox3.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox3)

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,150)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = "OK"
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,150)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = "Cancel"
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
  $ipAddress = $textBox1.Text
  $subnetMask = $textBox2.Text
  $defaultGateway = $textBox3.Text

  # Seadista staatiline IP-aadress
  $adapter = Get-NetAdapter -Name "Ethernet" # Asenda oma adapteri nimega
  $adapter | New-NetIPAddress -IPAddress $ipAddress -PrefixLength 24 -DefaultGateway $defaultGateway
  $adapter | Set-NetIPInterface -DHCPEnabled $false

  # Kuva edukas teade
  $resultForm = New-Object System.Windows.Forms.Form
  $resultForm.Text = "Successful"
  $resultForm.Size = New-Object System.Drawing.Size(200,100)
  $resultForm.StartPosition = "CenterScreen"

  $resultLabel = New-Object System.Windows.Forms.Label
  $resultLabel.Location = New-Object System.Drawing.Point(10,20)
  $resultLabel.Size = New-Object System.Drawing.Size(180,20)
  $resultLabel.Text = "Done"
  $resultForm.Controls.Add($resultLabel)

  $okButton = New-Object System.Windows.Forms.Button
  $okButton.Location = New-Object System.Drawing.Point(75,50)
  $okButton.Size = New-Object System.Drawing.Size(75,23)
  $okButton.Text = "OK"
  $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
  $resultForm.AcceptButton = $okButton
  $resultForm.Controls.Add($okButton)

  $resultForm.Topmost = $true

  $resultForm.ShowDialog()
}