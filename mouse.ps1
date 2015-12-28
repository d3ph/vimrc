$core = @"
using System.Runtime.InteropServices;

namespace System
{
    public class MyWin32
    {
        public static bool SystemInfoByRef(uint uAction, uint uParam, ref uint lpvParam, uint fuWinIni)
        {
            return SystemParametersInfo(uAction, uParam, ref lpvParam, fuWinIni);
        }

        public static bool SystemInfoNonRef(uint uAction, uint uParam, uint lpvParam, uint fuWinIni)
        {
            return SystemParametersInfo(uAction, uParam, lpvParam, fuWinIni);
        }

        public static bool SystemInfoByArray(uint uAction, uint uParam, uint[] lpvParam, uint fuWinIni)
        {
            return SystemParametersInfo(uAction, uParam, lpvParam, fuWinIni);
        }

        [DllImport("User32.dll")]
        private static extern bool SystemParametersInfo(uint uiAction, uint uiParam, ref uint pvParam, uint fWinIni);

        [DllImport("User32.dll")]
        private static extern bool SystemParametersInfo(uint uiAction, uint uiParam, uint pvParam, uint fWinIni);

        [DllImport("User32.dll")]
        private static extern bool SystemParametersInfo(uint uiAction, uint uiParam, uint[] pvParam, uint fWinIni);
    }
}
"@

Add-Type -TypeDefinition $core

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

[System.UInt32[]] $threshold = @(0, 0, 0)
[System.MyWin32]::SystemInfoByArray(0x4,0,$threshold,2);

$speed = 0
[System.Boolean] $res = [System.MyWin32]::SystemInfoByRef(0x70, 0, [REF] $speed, 0)
if ($res -eq $true) {
    Write-Host $speed –foregroundcolor “blue”
    if ($speed -eq 10 )
    {
        $speed = 4
    }
    else
    {
        $speed = 10
    }
    
    [System.MyWin32]::SystemInfoNonRef(0x71, 0, $speed, 0)
    <# [Windows.Forms.MessageBox]::Show("Mouse speed updated to $speed", "Success!", [Windows.Forms.MessageBoxButtons]::OK, [Windows.Forms.MessageBoxIcon]::Information) #>
    [System.Windows.Forms.MessageBox]::Show("Mouse speed updated to $speed", "Success!")
}
# Read-Host
