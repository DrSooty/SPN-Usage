$MySearch = New-Object DirectoryServices.DirectorySearcher([ADSI]"")
$MySearch.filter = "(&(objectClass=user)(objectCategory=user)(servicePrincipalName=*))"
$MyResults = $MySearch.Findall()
write-host $pwd

foreach($result in $MyResults){
 $userEntry = $result.GetDirectoryEntry()
 $Service =  $userEntry.Name
 write-host "Object Name = " $Service -backgroundcolor "yellow" -foregroundcolor "black"
 Write-host "servicePrincipalNames"
$i=1
Add-Content -Path "./Service.txt" -Value $Service
foreach($SPN in $userEntry.servicePrincipalName){
  Write-host "SPN(" $i ")   = "   $SPN
  $i+=1
  }
  Write-host ""
}

