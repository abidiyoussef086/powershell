. "C:\ Path \To\Get-ProcessInfo.ps1"

$cpuThreshold = Read-Host " Entrez le seuil CPU (%) "
 $processes = Get-HighCPUProcesses - CPUThreshold $cpuThreshold

 $processes | Format-Table-AutoSize

 $export = Read-Host "Exporter les r s u l t a t s en CSV ? (O/N)"
 if ( $export -eq "O") {
 $file = "C:\ Temp \ HighCPUProcesses .csv "
 $processes | Export-Csv $file-NoTypeInformation
 Write-Host " R s u l t a t s s a u v e g a r d s dans $file "
 }
