# Is log accessible?
$log_entry = Get-WinEvent -LogName Security -MaxEvents 1 -ErrorAction SilentlyContinue
if($? -ne $TRUE) {
    Write-Host "Security Log is NOT accessible"
    exit 1
    }

# Is log current?
$timeCreated = $log_entry.TimeCreated
$now = get-date
$difference = New-TimeSpan -Start $timeCreated -End $now
$diff_mins = $difference.Minutes
if($diff_mins -gt 5) {
    Write-Host "Security Log has no new data in the last 5 minutes"
    exit 1
    } ELSE {
    Write-Host "Security Log is accessible and current"
    exit 0
    }
