$targets = @("8.8.8.8", "8.8.4.4", "208.67.222.222", "208.67.220.220", "1.1.1.1", "1.0.0.1", "9.9.9.9", "149.112.112.112", "76.76.2.0", "76.76.10.0", "185.228.168.9", "185.228.169.9", "76.76.19.19", "76.223.122.150", "94.140.14.14", "94.140.15.15")

foreach ($target in $targets) {
    $pings = Test-Connection -ComputerName $target -Count 4 -ErrorAction SilentlyContinue
    if ($pings) {
        $averagePing = ($pings.Latency | Measure-Object -Average).Average
        Write-Host "Ping to $target averaged $averagePing ms"
    }
    else {
        Write-Host "Ping to $target failed."
    }
}
