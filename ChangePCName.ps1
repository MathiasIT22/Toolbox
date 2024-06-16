Add-Type -AssemblyName System.Windows.Forms

# Saa arvuti nimi
$currentName = (Get-WmiObject -Class Win32_ComputerSystem).Name

# Tee vorm
$form = New-Object System.Windows.Forms.Form
$form.Text = "Change Computer Name"
$form.Size = New-Object System.Drawing.Size(300,200)
$form.StartPosition = "CenterScreen"

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = "Enter a new computer name (current name is $currentName)"
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,70)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = "OK"
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,70)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = "Cancel"
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$form.Topmost = $true

$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
  $newName = $textBox.Text
  if ($newName) {
    # vaheta nimi
    Rename-Computer -NewName $newName -Force

    # valmis! teade
    $resultForm = New-Object System.Windows.Forms.Form
    $resultForm.Text = "Success"
    $resultForm.Size = New-Object System.Drawing.Size(200,100)
    $resultForm.StartPosition = "CenterScreen"

    $resultLabel = New-Object System.Windows.Forms.Label
    $resultLabel.Location = New-Object System.Drawing.Point(10,20)
    $resultLabel.Size = New-Object System.Drawing.Size(180,20)
    $resultLabel.Text = "Computer name changed to $newName"
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
  } else {
    # error teade kui ei toota
    $resultForm = New-Object System.Windows.Forms.Form
    $resultForm.Text = "Error"
    $resultForm.Size = New-Object System.Drawing.Size(200,100)
    $resultForm.StartPosition = "CenterScreen"

    $resultLabel = New-Object System.Windows.Forms.Label
    $resultLabel.Location = New-Object System.Drawing.Point(10,20)
    $resultLabel.Size = New-Object System.Drawing.Size(180,20)
    $resultLabel.Text = "No new computer name entered. Operation cancelled."
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
}