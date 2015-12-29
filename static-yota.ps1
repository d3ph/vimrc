$IPAddress = @("192.168.1.6")
$IPMasks = @("255.255.255.0")
$IPGateway = "172.16.0.1"
$IPDNS = "172.16.0.1"

$netNAC = Get-WmiObject Win32_NetworkAdapterConfiguration -Filter "Index = 7"
$wmi = Get-WmiObject win32_networkadapterconfiguration -filter "ipenabled = 'true'"

$wmi.EnableStatic($IPAddress, $IPMasks)
$wmi.SetGateways()
$wmi.SetDNSServerSearchOrder()

ipconfig | Select-String ipv4
