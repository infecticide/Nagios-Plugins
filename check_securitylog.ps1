param($computer,$logname,$timeperiod)

$scriptname = $MyInvocation.MyCommand.Name

# Check parameters, make sure all are filled out
if($computer -eq $null -or $logname -eq $null -or $timeperiod -eq $null) {
    write-host "Parameters missing"
    write-host " "
    write-host "Example:"
    write-host " "
    write-host "$scriptname <hostname> <logname> <timeperiod>"
    write-host " "
    write-host "<hostname> - the DNS name of the machine you want to check"
    write-host "<logname> - the Windows EventLog you want to check"
    write-host "<timeperiod> - how far back to check for events in minutes"
    write-host " "
    exit 1
    }

# Is Server reachable?
ping -n 1 $computer | out-null
if($? -ne $TRUE) {
    write-host "ERROR - Host is unreachable"
    exit 1
    }

# Does log exist?
$available_logs = (Get-WinEvent -ListLog * -ComputerName $computer).LogName
if($available_logs -notcontains $logname) {
    write-host "ERROR - $logname Log does not exist on this host"
    exit 1
    }

# Is log accessible?
$log_entry = Get-WinEvent -LogName $logname -MaxEvents 1 -ComputerName $computer -ErrorAction SilentlyContinue
if($? -ne $TRUE) {
    Write-Host "ERROR - $logname Log is not accessible"
    exit 1
    }

# Is log current?
$timeCreated = $log_entry.TimeCreated
$now = get-date
$difference = New-TimeSpan -Start $timeCreated -End $now
$diff_mins = $difference.TotalMinutes
if($diff_mins -gt $timeperiod) {
    Write-Host "ERROR - $logname Log has no new data in the last $timeperiod minutes"
    exit 1
    } ELSE {
    Write-Host "OK - $logname Log is accessible and current"
    exit 0
    }
