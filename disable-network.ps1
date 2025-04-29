# Disable all non-loopback network adapters
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq "Up" -and $_.Name -notmatch "Loopback" }
foreach ($adapter in $adapters) {
    Disable-NetAdapter -Name $adapter.Name -Confirm:$false
}
