Import-Module "C:\Users\GIGABYTE\Desktop\powershell\.vscode\Get-ProcessInfo.psm1" -Force

$cpuThreshold = Read-Host "Entrez le seuil CPU (%)"
$processes = Get-HighCPUProcesses -CPUThreshold $cpuThreshold

$processes | Format-Table -AutoSize

$export = Read-Host "Exporter les resultats en CSV ? (O/N)"
if ($export -eq "O") {
    $file = "C:\Temp\HighCPUProcesses.csv"
    $processes | Export-Csv $file -NoTypeInformation
    Write-Host "Resultats sauvegardes dans $file"
}
