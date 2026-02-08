. "C:\ Path \To\Get-ProcessInfo.ps1"

 while ($true ) {
$processes = Get-HighCPUProcesses -CPUThreshold 10
 Clear-Host
 Write-Host " Processus haute consommation -$(Get-Date):"
 $processes | Format-Table -AutoSize
 Start-Sleep -Seconds 10

}
