
function Get-HighCPUProcesses {
    param ([int] $CPUThreshold = 10)

    Get-Process |
        Where-Object { $_.CPU -gt $CPUThreshold } |
        Select-Object Name, Id, @{Name = "MemoryMB"; Expression = { [math]::Round($_.WorkingSet / 1MB, 2) } } |
        Sort-Object MemoryMB -Descending
}

Export-ModuleMember -Function Get-HighCPUProcesses
