function Get-TVdbLanguage {
    param (
        $id
    )

    $uri = "$global:TVdbBaseURL/languages"

    if ($id) {
        $uri = + "/$id"
    }

    (Invoke-RestMethod -Uri $uri -Headers $global:headers -Method Get ).data
}