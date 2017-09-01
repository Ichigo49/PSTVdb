#Global Base URL of the TVdb  REST API
$global:TVdbBaseURL = 'https://api.thetvdb.com'
$global:ApiKeyFile = "$Home\.psh\TVdbApi.key"
$global:UserKeyFile = "$Home\.psh\TVdbUser.key"
$global:UserNameFile = "$Home\.psh\TVdb.name"


$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )

Foreach($Import in @($Public + $Private))
{
    Try
    {
        . $Import.FullName
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($Import.FullName): $_"
    }
}

$ModuleMembers = $Public.BaseName

Export-ModuleMember -Function $ModuleMembers
