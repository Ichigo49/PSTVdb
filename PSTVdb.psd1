@{
    RootModule = 'PSTVdb.psm1'
    ModuleVersion = '0.0.1'
    GUID = '2906fcd8-447e-410a-955e-fb83e4ac7d23'
    Author = 'Mathieu (Ichigo49) ALLEGRET'
    CompanyName = 'home.mal'
    Copyright = '(c) 2017 Mathieu (Ichigo49) Allegret. All rights reserved.'
    Description = 'Module for Querying thetvdb.com .'
    PowerShellVersion = '3.0'
    FunctionsToExport = '*'
    CmdletsToExport = @()
    AliasesToExport = @()
    PrivateData = @{
        PSData = @{
            Tags = @('Utilities', 'TVdb')
            LicenseUri = 'https://github.com/Ichigo49/PSTVdb/blob/master/LICENSE'
            ProjectUri = 'https://github.com/Ichigo49/PSTVdb'
            IconUri = ''
            ReleaseNotes = '
* For now, everything has to be implemented !
* First Commit : stuff in the psm1 file, has to be splitted in files under \Public
* Source for the TVdb API : 
* https://api.thetvdb.com/swagger/
'
        }
    }
}
