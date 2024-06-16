try {
	[System.Console]::Beep(500,300)
	Start-Sleep -milliseconds 300
	exit 0 #vau
} catch {
	"Error $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}