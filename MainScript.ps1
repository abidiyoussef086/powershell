Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath "Get-ProcessInfo.psm1")

[int]$cpuThreshold = Read-Host "Entrez le seuil CPU (%)"
$processes = Get-HighCPUProcesses -CPUThreshold $cpuThreshold

$processes | Format-Table -AutoSize

$export = Read-Host "Exporter les resultats en CSV ? (O/N)"
if ($export -eq "O") {
    $dir = Join-Path -Path ([Environment]::GetFolderPath("Desktop")) -ChildPath "powershell"
    if (-not (Test-Path -Path $dir)) {
        New-Item -Path $dir -ItemType Directory | Out-Null
    }
    $file = Join-Path -Path $dir -ChildPath "HighCPUProcesses.csv"
    $processes | Export-Csv $file -NoTypeInformation -Force
    Write-Host "Resultats sauvegardes dans $file"
    code $file
}
