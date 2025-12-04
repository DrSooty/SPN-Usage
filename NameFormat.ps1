#require file for script to run, use .\SPNScript -AccountListPasth .\filepath.txt to run
param(
[Parameter(Mandatory=$true)]
[string]$AccountListPath
)

#imports txt file
$AccountName = Get-Content -Path $AccountListPath | Where-Object { $_ -ne " " }


foreach ($line in $AccountName) {
$event = Get-WinEvent -LogName Security -FilterXPath "*[System/EventID=4769] and *[EventData/Data[@Name='ServiceName']='$line']" -MaxEvents 1 -ErrorAction SilentlyContinue
if ( $event.Message -eq $null ){
Write-host "No 4769 events for $line" -backgroundcolor "red" -foregroundcolor "white"
} Else {
Write-host "There are 4769 events for $line" -backgroundcolor "green" -foregroundcolor "black"
}}
