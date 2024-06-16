try {
	[System.Console]::Beep(500,300)
	Start-Sleep -milliseconds 300
	exit 0 # Teeb arvutisse lühikese heli ja ootab veidi aega enne kui lõpetab.
} catch {
	"Error $($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
	exit 1
}
