Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
if (-Not ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Please run this script as an administrator."
    sleep 5
    exit
}
# peavorm
$form = New-Object System.Windows.Forms.Form
$form.Text = "MathiasBox v2.3"
$form.Size = New-Object System.Drawing.Size(800,600)
$form.StartPosition = "CenterScreen"
$form.BackColor = [System.Drawing.Color]::Red

# tabid
$tabControl = New-Object System.Windows.Forms.TabControl
$tabControl.Location = New-Object System.Drawing.Point(10,10)
$tabControl.Size = New-Object System.Drawing.Size(780,550)
$tabControl.TabIndex = 0
$tabControl.BackColor = [System.Drawing.Color]::Red
$tab1 = New-Object System.Windows.Forms.TabPage
$tab1.Text = "Scripts"
$tab1.BackColor = [System.Drawing.Color]::Red
$tab2 = New-Object System.Windows.Forms.TabPage
$tab2.Text = "CLI Info"
$tab2.BackColor = [System.Drawing.Color]::Red
$tab3 = New-Object System.Windows.Forms.TabPage
$tab3.Text = "System Info"
$tab3.BackColor = [System.Drawing.Color]::Red
$tabControl.TabPages.Add($tab1)
$tabControl.TabPages.Add($tab2)
$tabControl.TabPages.Add($tab3)

# Asjad TAB1
$scriptTextBox = New-Object System.Windows.Forms.TextBox
$scriptTextBox.Location = New-Object System.Drawing.Point(10,10)
$scriptTextBox.Size = New-Object System.Drawing.Size(750,200)
$scriptTextBox.Multiline = $true
$scriptTextBox.ScrollBars = "Vertical"
$runButton = New-Object System.Windows.Forms.Button
$runButton.Location = New-Object System.Drawing.Point(10,190)
$runButton.Size = New-Object System.Drawing.Size(75,23)
$runButton.Text = "Run Script" # runnib scripti mis sisestatud on tekstialale
$tab1.Controls.Add($runButton)
$runButton.Add_Click({
    $script = $scriptTextBox.Text
    try {
        Invoke-Expression $script
    } catch {
        Write-Host "Error: $_" -ForegroundColor Red
    }
})
# lubab hyperv (Pro Edition ainult)
$button1 = New-Object System.Windows.Forms.Button
$button1.Location = New-Object System.Drawing.Point(10,220)
$button1.Size = New-Object System.Drawing.Size(100,23)
$button1.Text = "Enable HyperV"
$button1.Add_Click({ .\EnableHyperV.ps1})

#Naitab kaivad protsesse ning neid saab sulgeda
$button2 = New-Object System.Windows.Forms.Button
$button2.Location = New-Object System.Drawing.Point(120,220)
$button2.Size = New-Object System.Drawing.Size(100,23)
$button2.Text = "Process Killer"
$button2.Add_Click({ .\ProcessKiller.ps1})
#teeb heli
$button3 = New-Object System.Windows.Forms.Button
$button3.Location = New-Object System.Drawing.Point(230,220)
$button3.Size = New-Object System.Drawing.Size(100,23)
$button3.Text = "Audio Test"
$button3.Add_Click({ .\AudioTest.ps1 })
#Eemaldab saasta
$button4 = New-Object System.Windows.Forms.Button
$button4.Location = New-Object System.Drawing.Point(340,220)
$button4.Size = New-Object System.Drawing.Size(100,23)
$button4.Text = "Remove Bloat"
$button4.Add_Click({ .\RemoveBloat.ps1 })
#ma ei plaani seda ise testida, aga ma usun et tootab kuna script iseenesest on lihtne
#Vahetab arvuti nime
$button5 = New-Object System.Windows.Forms.Button
$button5.Location = New-Object System.Drawing.Point(450,220)
$button5.Size = New-Object System.Drawing.Size(100,23)
$button5.Text = "PC Name"
$button5.Add_Click({ .\ChangePCName.ps1 })
#Teeb tuhja VMi
$button6 = New-Object System.Windows.Forms.Button
$button6.Location = New-Object System.Drawing.Point(10,250)
$button6.Size = New-Object System.Drawing.Size(100,23)
$button6.Text = "VMQuickCreate"
$button6.Add_Click({ .\HyperVMaker.ps1})
#Saad staatilise ip panna
$button7 = New-Object System.Windows.Forms.Button
$button7.Location = New-Object System.Drawing.Point(120,250)
$button7.Size = New-Object System.Drawing.Size(100,23)
$button7.Text = "Static IP"
$button7.Add_Click({ .\StaticIP.ps1 })
#Pingib 8.8.8.8
$button8 = New-Object System.Windows.Forms.Button
$button8.Location = New-Object System.Drawing.Point(230,250)
$button8.Size = New-Object System.Drawing.Size(100,23)
$button8.Text = "Ping Test"
$button8.Add_Click({ .\pingtest.ps1 })
#Keelab cortana
$button9 = New-Object System.Windows.Forms.Button
$button9.Location = New-Object System.Drawing.Point(340,250)
$button9.Size = New-Object System.Drawing.Size(100,23)
$button9.Text = "Disable Cortana"
$button9.Add_Click({ .\DisableCortana.ps1 })
#IP jargi asukoha leidmine
$button10 = New-Object System.Windows.Forms.Button
$button10.Location = New-Object System.Drawing.Point(450,250)
$button10.Size = New-Object System.Drawing.Size(100,23)
$button10.Text = "IPLocator"
$button10.Add_Click({ .\IPLocator.ps1 })

#Rippmenuu
$comboBox = New-Object System.Windows.Forms.ComboBox
$comboBox.Location = New-Object System.Drawing.Point(10,450)
$comboBox.Size = New-Object System.Drawing.Size(150,20)


$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,420)
$label.Size = New-Object System.Drawing.Size(150,20)
$label.Text = "Select an action:"

$label2 = New-Object System.Windows.Forms.Label
$label2.Location = New-Object System.Drawing.Point(450,450)
$label2.Size = New-Object System.Drawing.Size(250,250)
$Label2.Font = [System.Drawing.Font]::new("Comic Sans", 12, [System.Drawing.FontStyle]::Bold)
$label2.Text = "Made by Mathias 2024 IT22"

# Valikud kasti jaoks
$comboBox.Items.Add("Shut Down")
$comboBox.Items.Add("Restart")
$comboBox.Items.Add("Lock")
$comboBox.Items.Add("Log Off")
$comboBox.Items.Add("Hibernate")
$comboBox.Items.Add("Sleep")

# Set the default selected item
$comboBox.SelectedIndex = 0

# teeb seda soltuvalt mis sa valisid
$comboBox.Add_SelectedIndexChanged({
    $selectedItem = $comboBox.SelectedItem
    switch ($selectedItem) {
        "Shut Down" { Stop-Computer -Force }
        "Restart" { Restart-Computer -Force }
        "Lock" { rundll32.exe user32.dll,LockWorkStation }
        "Log Off" { Exit-PSSession }
        "Hibernate" { Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Application]::SetSuspendState($true, $false, $false) }
        "Sleep" { Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.Application]::SetSuspendState($false, $false, $false) }
    }
})

#lisab asjad vormi
$tab1.Controls.Add($comboBox)
$tab1.Controls.Add($label)
$tab1.Controls.Add($label2)
$tab1.Controls.Add($scriptTextBox)
$tab1.Controls.Add($button1)
$tab1.Controls.Add($button2)
$tab1.Controls.Add($button3)
$tab1.Controls.Add($button4)
$tab1.Controls.Add($button5)
$tab1.Controls.Add($button6)
$tab1.Controls.Add($button7)
$tab1.Controls.Add($button8)
$tab1.Controls.Add($button9)
$tab1.Controls.Add($button10)

# TAB2
$cliInfoTextBox = New-Object System.Windows.Forms.TextBox
$cliInfoTextBox.Location = New-Object System.Drawing.Point(10,10)
$cliInfoTextBox.Size = New-Object System.Drawing.Size(750,400)
$cliInfoTextBox.Multiline = $true
$cliInfoTextBox.ScrollBars = "Vertical"

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Point(10,420)
$button.Size = New-Object System.Drawing.Size(75,23)
$button.Text = "Saada"
$button.Add_Click({ Write-Host $cliInfoTextBox.Text })
$tab2.Controls.Add($button)

$tab2.Controls.Add($cliInfoTextBox)
$cliInfoTextBox.Add_TextChanged({ Write-Host $cliInfoTextBox.Text })

# Saa registrist kas darkmode on peal
$darkModeEnabled = (Get-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -ErrorAction SilentlyContinue).AppsUseLightTheme -eq 0

# kast
$checkBox1 = New-Object System.Windows.Forms.CheckBox
$checkBox1.Location = New-Object System.Drawing.Point(10,300)
$checkBox1.Size = New-Object System.Drawing.Size(100,20)
$checkBox1.Text = "Dark Mode"

# kontrollib kas see on peal
$checkBox1.Checked = !$darkModeEnabled

# vahetab kas darkmode on sees valjas soltuvalt mis olekus checkbox on
$checkBox1.Add_CheckedChanged({
    if ($checkBox1.Checked) {
        # Lulitab sisse
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 -Type DWORD -Force
    } else {
        # lulitab valja
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 1 -Type DWORD -Force
    }
})
# Keelab arvutil tuttu minna
$checkBox2 = New-Object System.Windows.Forms.CheckBox
$checkBox2.Location = New-Object System.Drawing.Point(120,300)
$checkBox2.Size = New-Object System.Drawing.Size(100,20)
$checkBox2.Text = "No Sleep"

# votab registrist staatuse
$powerSettings = Get-ItemProperty -Path "HKCU:\System\Power" -Name "HibernateEnabled" -ErrorAction SilentlyContinue

# muudab kasti olekut soltuvalt mis valitud on eelnevalt
if ($powerSettings.HibernateEnabled -eq 0) {
    $checkBox2.Checked = $true
} else {
    $checkBox2.Checked = $false
}

# muudab kas arvuti tutub v ei
$checkBox2.Add_CheckedChanged({
    if ($checkBox2.Checked) {
        # keelab
        powercfg /h off
    } else {
        # lubab
        powercfg /h on
    }
})





#Keelab telemeetria
$checkBox3 = New-Object System.Windows.Forms.CheckBox
$checkBox3.Location = New-Object System.Drawing.Point(230,300)
$checkBox3.Size = New-Object System.Drawing.Size(100,20)
$checkBox3.Text = "Telemetry?"

$checkBox3.Add_CheckStateChanged({
    if ($checkBox3.Checked) {
        # lubab
        Write-Host "Telemetry enabled"
        & ".\EnableTelemetry.ps1"
    } else {
        # keelab
        Write-Host "Telemetry disabled"
        & ".\DisableTelemetry.ps1"
    }
})


$checkBox4 = New-Object System.Windows.Forms.CheckBox
$checkBox4.Location = New-Object System.Drawing.Point(340,300)
$checkBox4.Size = New-Object System.Drawing.Size(100,20)
$checkBox4.Text = "Blue?"

$checkBox4.Add_CheckStateChanged({
    if ($checkBox4.Checked) {
        $form.BackColor = [System.Drawing.Color]::Blue
        $tab1.BackColor = [System.Drawing.Color]::Blue
    } else {
        $form.BackColor = [System.Drawing.Color]::Red
        $tab1.BackColor = [System.Drawing.Color]::Red
    }
    $form.Refresh()
})

$checkBox5 = New-Object System.Windows.Forms.CheckBox
$checkBox5.Location = New-Object System.Drawing.Point(450,300)
$checkBox5.Size = New-Object System.Drawing.Size(100,20)
$checkBox5.Text = "UTC Time"
$checkBox5.Add_CheckStateChanged({
    if ($checkBox5.Checked) {
        Set-TimeZone -Id "UTC"
    } else {
        Set-TimeZone -Id "UTC"
    }
    $form.Refresh()
})


$tab2.Controls.Add($cliInfoTextBox)
$tab1.Controls.Add($checkBox1)
$tab1.Controls.Add($checkBox2)
$tab1.Controls.Add($checkBox3)
$tab1.Controls.Add($checkBox4)
$tab1.Controls.Add($checkBox5)

# TAB3
$systemInfoTextBox = New-Object System.Windows.Forms.TextBox
$systemInfoTextBox.Location = New-Object System.Drawing.Point(10,10)
$systemInfoTextBox.Size = New-Object System.Drawing.Size(750,400)
$systemInfoTextBox.Multiline = $true
$systemInfoTextBox.ScrollBars = "Vertical"
#votab endale asjade vaartused
$cimOS = Get-CIMInstance Win32_OperatingSystem
$cimOSVER = $cimOS.Version
$cimvismemory = $cimOS.TotalVisibleMemorySize
$cimfrememory = $cimOS.FreePhysicalMemory
$cimTime = Get-Date
$cimLastBoot = $cimOS.LastBootUpTime
$cimuptime = New-TimeSpan -Start $cimLastBoot -End $cimTime
$cimarch = $cimOS.OSArchitecture
$cimproc = (Get-CIMInstance Win32_Processor).Name
$cimserial = $cimOS.SerialNumber
#kirjutab need valja
$systemInfoTextBox.AppendText("Windows Edition: " + $cimOS.Caption + "`n")
$systemInfoTextBox.AppendText("Version: " + $cimOSVER + "`n")
$systemInfoTextBox.AppendText("Ram Total: " + ($cimvismemory / 1MB).ToString("F2")  + " GB`n")
$systemInfoTextBox.AppendText("Ram Available: " + ($cimfrememory / 1MB).ToString("F2") + " GB`n")
$systemInfoTextBox.AppendText("Time: " + $cimTime.ToString("yyyy-MM-dd HH:mm:ss") + "`n")
$systemInfoTextBox.AppendText("Last boot: " + $cimLastBoot.ToString("yyyy-MM-dd HH:mm:ss") + "`n")
$systemInfoTextBox.AppendText("Uptime: " + $cimuptime.ToString("d") + " days, " + $cimuptime.ToString("h") + " hours, " + $cimuptime.ToString("m") + " minutes, " + $cimuptime.ToString("s") + " seconds`n")
$systemInfoTextBox.AppendText("Architecture: " + $cimarch + "`n")
$systemInfoTextBox.AppendText("Processor: " + $cimproc + "`n")
$systemInfoTextBox.AppendText("Serial: " + $cimserial + "`n")

$tab3.Controls.Add($systemInfoTextBox)

$form.Controls.Add($tabControl)


$form.Add_Shown({$form.Activate()})
$form.ShowDialog()