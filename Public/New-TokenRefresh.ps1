function New-TokenRefresh {
    [CmdletBinding()]
    param()

    try {
        $NewToken = Invoke-RestMethod -Uri "https://api.thetvdb.com/refresh_token" -Headers $headers -Method Get
        $Global:headers.Authorization = "Bearer $($NewToken.token)"
        Write-Verbose "Successfully Refresh Token"
    } catch {
        Write-Host $_.Exception.Message -ForegroundColor Red -BackgroundColor Black
    }
}
