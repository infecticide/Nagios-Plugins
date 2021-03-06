##### Get latest stability index #####
$WMIQuery = Get-WmiObject Win32_ReliabilityStabilityMetrics | select -first 1
[int]$sindex = $WMIQuery.SystemStabilityIndex

##### Generate Nagios output #####
if($WMIQuery.SystemStabilityIndex -gt 8) {
    write-host "OK - Stability Index is $sindex of 10`|index=$sindex;8:5;4.9:0;0;10"
    exit 0
    }

if($WMIQuery.SystemStabilityIndex -gt 5) {
    write-host "Warning - Stability Index is $sindex of 10`|index=$sindex;8:5;4.9:0;0;10"
    exit 1
    }
    
if($WMIQuery.SystemStabilityIndex -lt 5) {
    write-host "Critical - Stability Index is $sindex of 10`|index=$sindex;8:5;4.9:0;0;10"
    exit 2
    }
    
write-host "UNKNOWN - An error occured retreiving the stability index"