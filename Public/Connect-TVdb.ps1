function Connect-TVdb {
    param (
        [String]$UserName,
        [String]$ApiKey,
        [String]$UserKey
    )

    if (-not $ApiKey) {
        
        if (-not (Test-Path $global:ApiKeyFile)) {
            Write-Host "ERROR, no API Key found, please provide it in parameter" -ForegroundColor Red -BackgroundColor Black
            break
        } else {
            $ApiKey = Convert-SecureStringToString -SecureString $(Get-Content $global:ApiKeyFile | ConvertTo-SecureString)
        }
    }
    
    if (-not $UserKey) {
        if (-not (Test-Path $global:UserKeyFile)) {
            Write-Host "ERROR, no User Key found, please provide it in parameter" -ForegroundColor Red -BackgroundColor Black
            break
        } else {
            $UserKey = Convert-SecureStringToString -SecureString $(Get-Content $global:UserKeyFile | ConvertTo-SecureString)
        }
    }

    if (-not $UserName) {
        if (-not (Test-Path $global:UserNameFile)) {
            Write-Host "ERROR, no User Name found, please provide it in parameter" -ForegroundColor Red -BackgroundColor Black
            break
        } else {
            $UserName = Convert-SecureStringToString -SecureString $(Get-Content $global:UserNameFile | ConvertTo-SecureString)
        }  
    }
    
$SessionJson = @"
{
    "apikey": "$ApiKey",
    "userkey": "$UserKey",
    "username": "$UserName"
}
"@
    
    #Building Headers
   
    $global:headers = @{}  
    $global:headers["Accept"] = "application/json"  
    $global:headers["Content-Type"] = "application/json" 

    #API call to get token

    $global:TVdbSession = Invoke-RestMethod -Uri "$global:TVdbBaseURL/login" -Body $SessionJson -Headers $global:headers -Method Post
    $global:TVdbToken = $global:TVdbSession.token
   
    #add the 'Authorization' with the token to the header for other REST API calls
    $global:headers["Authorization"] = "Bearer $global:TVdbToken"
    
}