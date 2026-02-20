Import-Module "C:\Users\GIGABYTE\Desktop\powershell\.vscode\Get-ProcessInfo.psm1" -Force

while ($true) {
    $processes = Get-HighCPUProcesses -CPUThreshold 10
    Clear-Host
    Write-Host "Processus haute consommation - $(Get-Date):"
    $processes | Format-Table -AutoSize
    Start-Sleep -Seconds 10
}
