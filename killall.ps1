<#
$softwarelist = 'chrome|firefox|iexplore|opera'
get-process |
    Where-Object {$_.ProcessName -match $softwarelist} |
    stop-process -force

Get-Service | where-object {$_.name -like '*agent*'} | {$_.Status -eq "Running"}
#>
Get-Process -Name 'dwm','taskeng','taskhost','hamachi-2-ui','LWEMon','Skype','AutoHotkey','LMIGuardianSvc','EuWatch','TrayNotify','jusched','jucheck','AAM Updates Notifier','GoogleUpdate','PresentationFontCache' | Stop-Process -Force
(Get-Service "Hamachi2Svc").Stop()
(Get-Service "EaseUS Agent").Stop()
(Get-Service "wuauserv").Stop()
(Get-Service "Browser").Stop()
(Get-Service "Schedule").Stop()
(Get-Service "stisvc").Stop()
<#
$procs = @("jusched.exe", "adobearm.exe", "euwatch.exe", "hamachi-2-ui.exe", "traynotify.exe", "wuauclt.exe", "NkMC2.exe", "jucheck.exe")
foreach ($proc in $procs) {
    $ps = Get-WmiObject Win32_Process -Filter "Name='$proc'"
    foreach ($i in $ps)
    {
        $result = $i.Terminate()
        if ($result.ReturnValue -eq 0) { "Success $comp"}
        else {"Error $comp"}
    }
}
#>
