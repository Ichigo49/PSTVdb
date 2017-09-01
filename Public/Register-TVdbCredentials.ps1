function Register-TVdbCredentials {
    <#
        TODO : Setup help
    #>
    param (
        [Parameter(Mandatory=$true)]$ApiKey,
        [Parameter(Mandatory=$true)]$UserKey,
        [Parameter(Mandatory=$true)]$UserName
    )

    try {
        $ApiKey | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | Out-File $global:ApiKeyFile -Force
        $UserKey | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | Out-File $global:UserKeyFile -Force
        $UserName | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | Out-File $global:UserNameFile -Force
        Write-Host "Successfully Save User info to files" -ForegroundColor Green
    } catch {
        Write-Host $_.Exception.Message -ForegroundColor Red -BackgroundColor Black
    }
}