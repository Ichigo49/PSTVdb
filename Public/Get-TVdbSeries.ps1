function Get-TVdbSeries {
    param(
        [parameter(Position=0,
        ValueFromPipeline=$true,
        ValueFromPipelineByPropertyName=$true)]
        [System.Object]$Serie,

        $id
    )

    if ($Serie.count -le 1) {
        $id = $Serie.id
    }

    $uri = "$global:TVdbBaseURL/series/$id"
    $Result = Invoke-RestMethod -Uri $uri -Headers $global:headers -Method Get
    $Result.data
}