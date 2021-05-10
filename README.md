# Local HTTPS proxy

## Description

* Proxy local HTTPS:443 traffic to HTTP:80.
* Source: https://www.shanestillwell.com/2016/10/03/create-a-local-https-proxy-server/

## Add to Trusted

* Launch `mmc.exe` &rightarrow; Add/Remove Snap In... &rightarrow; Certificates &rightarrow; Add &rightarrow; OK
* Navigate: Console root &rightarrow; Trusted Root Certification Authorities &rightarrow; Certificates &rightarrow; Right-click &rightarrow; All Tasks &rightarrow; Import
* Pick `./ssl/cert.pem`