function lboffline {
$lboffline = qfarm /lboff | findstr /i CTX;
if ($lboffline -eq $null) {
   $global:lboffline_status = "ok"
   }
   ELSE 
   {
   $thisserver_lboffline = $lboffline.contains("$env:computername")
   if ($thisserver_lboffline -eq $true) {
      $global:lboffline_status = "critical"
      }
      ELSE
      {
      $global:lboffline_status = "ok"
      }
    }
}

function offline {
$offline = qfarm /offline | findstr /i CTX;   
if ($offline -eq $null) {
    $global:offline_status = "ok"
    }
    ELSE
    {
    $thisserver_offline = $offline.contains("$env:computername")
    if ($thisserver_offline -eq $true) {
       $global:offline_status = "critical"
       }
       ELSE
       {
       $global:offline_status = "ok"
       }
    }
 }  

lboffline;
offline;

if ($lboffline_status -eq "ok") {
   if ($offline_status -eq "ok") {
      write-host OK - Server is participating in load balancing
      exit 0
      }
      ELSE
      {
      write-host CRITICAL - Server is offline in QFARM
      exit 2
      }
   }
   ELSE
   {
   write-host CRITICAL - Server has been removed from Xenapp load balancing
   exit 2
   }
 
# SIG # Begin signature block
# MIIQIQYJKoZIhvcNAQcCoIIQEjCCEA4CAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUz5nC6WwAraoTfMi/YPRMmPhR
# nT6ggg16MIIGYjCCBUqgAwIBAgIKYWPnnwAAAAAABTANBgkqhkiG9w0BAQUFADAZ
# MRcwFQYDVQQDEw5TYXNrUG93ZXIgUm9vdDAeFw0xMDA4MjQyMzUyNDRaFw0xNDA4
# MjUwMDAyNDRaMGIxEjAQBgoJkiaJk/IsZAEZFgJjYTESMBAGCgmSJomT8ixkARkW
# AnNrMRkwFwYKCZImiZPyLGQBGRYJc2Fza3Bvd2VyMR0wGwYDVQQDExRTYXNrUG93
# ZXIgSXNzdWluZyAwMjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL5w
# ZUWy4Nbg6d7RK5zBhzqAADWyCOYkTFzAxZ7PnG+TO9PjoLutdSYk1FKt6VXh2/sv
# WqXPB4oxryKpQm/U8ZOQoAJD+kAPYTAPfh3wmKRnvl4vlSdFRjcoQz5UiYx56bxw
# 4jek9f7PZKp2BKodsCAFXQshtkQcdaFmwCgnLIi0vJ//rueOygzQrDBu06V0yPE5
# 5/R7a5Q87r+Uakvltv0syN+aZwAO4VWpRAiUcHdEV/XZon9VNibp/uPlWpnz6vi1
# CjPJ4alrnzyPFlEoH3jze2GKnvP/MU6RT94ckXP6fp0o72KrPczh8twUSOHrTzOg
# viKHyc6KexFRsvPwe/MCAwEAAaOCA2EwggNdMBIGCSsGAQQBgjcVAQQFAgMBAAEw
# IwYJKwYBBAGCNxUCBBYEFCw6Ibro4XBLVvwgi29tIj4voe+KMB0GA1UdDgQWBBTi
# owCaxNh9OKnNqHskxprqDx6EADAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTAL
# BgNVHQ8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADAfBgNVHSMEGDAWgBSwak/3
# yWD5OplHkWxERq7UirJnfTCCAUEGA1UdHwSCATgwggE0MIIBMKCCASygggEohoGz
# bGRhcDovLy9jbj1TYXNrUG93ZXIlMjBSb290LENOPUNEUCxDbj1QdWJsaWMlMjBr
# ZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNlcyxDTj1Db25maWd1cmF0aW9uLERDPVNh
# c2twb3dlcixEQz1zayxEQz1jYT9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jh
# c2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJpYnV0aW9uUG9pbnSGN2h0dHA6Ly9wa2lp
# bnRlcm5hbC5zYXNrcG93ZXIuc2suY2EvU2Fza1Bvd2VyJTIwUm9vdC5jcmyGN2h0
# dHA6Ly9wa2lleHRlcm5hbC5zYXNrcG93ZXIuc2suY2EvU2Fza1Bvd2VyJTIwUm9v
# dC5jcmwwggFfBggrBgEFBQcBAQSCAVEwggFNMIHABggrBgEFBQcwAoaBs2xkYXA6
# Ly8vY249U2Fza1Bvd2VyJTIwUm9vdCxDTj1DRFAsQ049UHVibGljJTIwa2V5JTIw
# U2VydmljZXMsQ049U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1TYXNrcG93
# ZXIsREM9c2ssREM9Y2E/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdD9iYXNlP29i
# amVjdENsYXNzPWNSTERpc3RyaWJ1dGlvblBvaW50MEMGCCsGAQUFBzAChjdodHRw
# Oi8vcGtpaW50ZXJuYWwuc2Fza3Bvd2VyLnNrLmNhL1Nhc2tQb3dlciUyMFJvb3Qu
# Y3J0MEMGCCsGAQUFBzAChjdodHRwOi8vcGtpZXh0ZXJuYWwuc2Fza3Bvd2VyLnNr
# LmNhL1Nhc2tQb3dlciUyMFJvb3QuY3J0MA0GCSqGSIb3DQEBBQUAA4IBAQCG0mKn
# kIVo2RLgkhhcFqYp/JlBjFFq6MtINAQ5BrK3UH52sNzSS1J7zxXeVgddcJJrV8Je
# pv9p9P41HwWcVMPDWJTkukj/9oEB+ujJggExQ9Z6wS/xPyycpcamtBv7v9vj7d+5
# 6106wnrz3CvvILK1naDeB2P3VV3AMeIXWvwZl9D12cS20lMeppGKIGLuXpz+a401
# jeLQkkxFwfu5vIExfUDLuHnHXeYhS77YIlgKpHknEK5RmRCZddw3+ciKb4887yNI
# 89ZRtWBtyivKW7DEWYXi/pwX3DzESG2vUd2owaDB6hedu8nRpMRzftPF2OTdpjhD
# DkzvYIG+EDgpK4yWMIIHEDCCBfigAwIBAgIKMexnJAABAAAADTANBgkqhkiG9w0B
# AQUFADBiMRIwEAYKCZImiZPyLGQBGRYCY2ExEjAQBgoJkiaJk/IsZAEZFgJzazEZ
# MBcGCgmSJomT8ixkARkWCXNhc2twb3dlcjEdMBsGA1UEAxMUU2Fza1Bvd2VyIElz
# c3VpbmcgMDIwHhcNMTAxMjIxMjAxNTQ4WhcNMTExMjIxMjAxNTQ4WjBnMRIwEAYK
# CZImiZPyLGQBGRYCY2ExEjAQBgoJkiaJk/IsZAEZFgJzazEZMBcGCgmSJomT8ixk
# ARkWCXNhc2twb3dlcjEOMAwGA1UEAxMFVXNlcnMxEjAQBgNVBAMMCSRBRE1JTlNE
# QjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOT4xqxhiWjCo3AjlaJU
# fIJ6+060aOgOCmWBpx7asSmXVrCuL+dL8WAAQ6qk0No7gcS5pRv+swN6KWR3zI4y
# STxCzDRcoN8ZJ6Dj4p2+PH+nEbhdqVAL4U+D0Vvv8ULpxfmQAN/4eJjiBgY5J9x9
# zB4cU9v7To/SU+dPYJRUKHH4ZKPUxLxNod2s3s5/5eyc8ZntWQE92OMxH4CRUEXn
# zdIHSwG8Anlc7DKWA2EGVlv2OWevNgznC8tjCXa/B1qQFiES6SjaV32M8aEueKrS
# xxMrEoSjFeATdyQmoxmUq3CoE5GIY1mQaTqSSQWN+GX8WIGfEKYayCMR4Szcp9Z+
# 7BECAwEAAaOCA8EwggO9MDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIWs7w+E
# 1pB3h8WJPYK32U2GpKNcHoHTjXiQgG4CAWQCAQIwEwYDVR0lBAwwCgYIKwYBBQUH
# AwMwCwYDVR0PBAQDAgeAMBsGCSsGAQQBgjcVCgQOMAwwCgYIKwYBBQUHAwMwHQYD
# VR0OBBYEFMiXMI8u+X0ocpjTeLyaQkE89BJiMB8GA1UdIwQYMBaAFOKjAJrE2H04
# qc2oeyTGmuoPHoQAMIIBYQYDVR0fBIIBWDCCAVQwggFQoIIBTKCCAUiGgc9sZGFw
# Oi8vL0NOPVNhc2tQb3dlciUyMElzc3VpbmclMjAwMigxKSxDTj1TUlYtUEtJLUNB
# LTAzLENOPUNEUCxDTj1QdWJsaWMlMjBLZXklMjBTZXJ2aWNlcyxDTj1TZXJ2aWNl
# cyxDTj1Db25maWd1cmF0aW9uLERDPXNhc2twb3dlcixEQz1zayxEQz1jYT9jZXJ0
# aWZpY2F0ZVJldm9jYXRpb25MaXN0P2Jhc2U/b2JqZWN0Q2xhc3M9Y1JMRGlzdHJp
# YnV0aW9uUG9pbnSGMmh0dHA6Ly9wa2lpbnRlcm5hbC9TYXNrUG93ZXIlMjBJc3N1
# aW5nJTIwMDIoMSkuY3JshkBodHRwOi8vcGtpZXh0ZXJuYWwuc2Fza3Bvd2VyLmNv
# bS9TYXNrUG93ZXIlMjBJc3N1aW5nJTIwMDIoMSkuY3JsMIIBYQYIKwYBBQUHAQEE
# ggFTMIIBTzCBvgYIKwYBBQUHMAKGgbFsZGFwOi8vL0NOPVNhc2tQb3dlciUyMElz
# c3VpbmclMjAwMixDTj1BSUEsQ049UHVibGljJTIwS2V5JTIwU2VydmljZXMsQ049
# U2VydmljZXMsQ049Q29uZmlndXJhdGlvbixEQz1zYXNrcG93ZXIsREM9c2ssREM9
# Y2E/Y0FDZXJ0aWZpY2F0ZT9iYXNlP29iamVjdENsYXNzPWNlcnRpZmljYXRpb25B
# dXRob3JpdHkwPgYIKwYBBQUHMAKGMmh0dHA6Ly9wa2lpbnRlcm5hbC9TYXNrUG93
# ZXIlMjBJc3N1aW5nJTIwMDIoMSkuY3J0MEwGCCsGAQUFBzAChkBodHRwOi8vcGtp
# ZXh0ZXJuYWwuc2Fza3Bvd2VyLmNvbS9TYXNrUG93ZXIlMjBJc3N1aW5nJTIwMDIo
# MSkuY3J0MDQGA1UdEQQtMCugKQYKKwYBBAGCNxQCA6AbDBkkYWRtaW5zZGJAc2Fz
# a3Bvd2VyLnNrLmNhMA0GCSqGSIb3DQEBBQUAA4IBAQCeUfhGZPe/XK9zitIvSw+6
# XeixkPhEagKPWT+hNuBV/rDEw5zaGoRYogWs9cCrSm9MfbKz/vIgv6Sy22bUzSNy
# 9+ZlgdCzqAeZDbwzjEdK9Z/hqnjh1311l3YKdGzGJwBO5LJghTbBc9uto8mMKv3c
# PHiYxG+pIQq86wwzrfso52w9MduJO7Ydux4Rc/gbyo9MewZAmLYDrQymrn0hL7av
# 9FM7hJG4IR1luK+ESlbPyvwn+vsKvJkSJvxI3r33+iVquUvYHX3/UkhxvijXzkGX
# l5fNeYIZvsPGTta5ulOklH5Xy+nb2HxBdCOn0s2YtoJiiGH7RtpNhxxoXyrpVrV2
# MYICETCCAg0CAQEwcDBiMRIwEAYKCZImiZPyLGQBGRYCY2ExEjAQBgoJkiaJk/Is
# ZAEZFgJzazEZMBcGCgmSJomT8ixkARkWCXNhc2twb3dlcjEdMBsGA1UEAxMUU2Fz
# a1Bvd2VyIElzc3VpbmcgMDICCjHsZyQAAQAAAA0wCQYFKw4DAhoFAKB4MBgGCisG
# AQQBgjcCAQwxCjAIoAKAAKECgAAwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQw
# HAYKKwYBBAGCNwIBCzEOMAwGCisGAQQBgjcCARUwIwYJKoZIhvcNAQkEMRYEFK4i
# flIsCCCSiQTtBpd3Uy1y8QVbMA0GCSqGSIb3DQEBAQUABIIBAFbN5C4I4E/eH6vo
# D+E2/aE57Xi8XMbg8SzNltDmVk5aTf3sxQcZSVQHOSVVNQZ+CXMelqddSHZgMRlN
# grBx5JrmA2VJs3Yd0XdsWoDx05xQ1tkbKyz+1LhFVSJKYSEMTr+9koUu8KazC8wR
# YNsV0vfwUvHulU7xB08Cc698SkKdvtf153Qx43In3xoNDjqFbJbdvhX+/RGnBmA+
# 5R4p6IpTJ22RIYmrVci8Lsyg9g7lWT35gwwBvTFddx6wVZLJSDv5bot2hqc8ED/j
# GGWQ6z3GN+yapwILVlyjKj5IhAC2CkQwvKCNwyt3/COGvcUBikWeyJcQ1kZTysbO
# mpUZOOc=
# SIG # End signature block
