function Search-TVdbSerie {
    param(
        $Name,
        $imdbId,
        $zap2itId,
        $lang,
        [switch]$AllInfos
    )

    if ($Name -and -not $imdbId -and -not $zap2itId) {

        $ConvertName = $Name.replace(" ","%20")
        $Uri = "$global:TVdbBaseURL/search/series?name=$ConvertName"

    } elseif ($imdbId -and -not $zap2itId -and -not $Name) {

        $Uri = "$global:TVdbBaseURL/search/series?imdbId=$imdbId"  

    } elseif ($zap2itId -and -not $imdbId -and -not $Name) {

        $Uri = "$global:TVdbBaseURL/search/series?zap2itId=$zap2itId"

    } elseif (-not $Name -and -not $imdbId -and -not $zap2itId) {

        Write-Host "No paramters set, one parameter is needeed for the search" -ForegroundColor Red -BackgroundColor Black
        break

    } else {

        Write-Host "Too many paramters set, only one at a time is needeed for the search" -ForegroundColor Red -BackgroundColor Black
        break
    }

    if ($lang) {
        $global:headers['Accept-Language'] = "$lang"
    }

    $Result = Invoke-RestMethod -Uri $uri -Headers $global:headers -Method Get
    if ($AllInfos) {
        $Result.data
    } else {
        $Result.data | Select-Object seriesName,firstAired,id,status
    }
    
}