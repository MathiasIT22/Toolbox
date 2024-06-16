Add-Type -AssemblyName System.Windows.Forms

# vorm
$form = New-Object System.Windows.Forms.Form
$form.Text = "Kill Process"
$form.Size = New-Object System.Drawing.Size(400,400)
$form.StartPosition = "CenterScreen"

# silt
$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(380,20)
$label.Text = "What process should we kill?"
$form.Controls.Add($label)

# tkstikast
$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$form.Controls.Add($textBox)

# kast mis naitab mis processid kaivad
$listBox = New-Object System.Windows.Forms.ListBox
$listBox.Location = New-Object System.Drawing.Point(10,70)
$listBox.Size = New-Object System.Drawing.Size(380,200)
$listBox.SelectionMode = "One"

# saab protsessid
$processes = Get-Process | Select-Object -ExpandProperty ProcessName
$listBox.Items.AddRange($processes)

$form.Controls.Add($listBox)

# nupp
$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(100,280)
$button.Size = New-Object System.Drawing.Size(75,23)
$button.Text = "Kill"
$button.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $button
$form.Controls.Add($button)

# naitab vormi ning loetleb protsessid
$form.Topmost = $true
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK) {
    $ProcessToKill = $textBox.Text
    if ($ProcessToKill -eq "") {
        $ProcessToKill = $listBox.SelectedItem
    }
    Stop-Process -Name $ProcessToKill -Force -ErrorAction SilentlyContinue
    [System.Windows.Forms.MessageBox]::Show("Process $ProcessToKill has been terminated.", "Success")
} else {
    [System.Windows.Forms.MessageBox]::Show("Operation cancelled.", "Info")
}