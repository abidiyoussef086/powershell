
function Get-HighCPUProcesses {
 param ([ int] $CPUThreshold = 10)

 Get-Process | Where-Object {$_.CPU -gt $CPUThreshold } |
 Select-Object Name, Id, 
 @{Name =" Memory (MB)"; Expression={[math]:: Round($_.WorkingSet / 1MB, 2)}}
Sort-Object " Memory (MB)" -Descending
 }

Export-ModuleMember-Function Get-HighCPUProcesses
