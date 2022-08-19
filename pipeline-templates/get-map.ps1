<#
 .SYNOPSIS
    Get's the content of the file passed in and sets it to the content variable

 .PARAMETER filePath
    Path of the map to get
#>

param(
    [Parameter(Mandatory = $True)]
    [string]
    $filePath
)

$fileContent = Get-Content $filePath -Raw -Encoding UTF8;
Write-Host "fileContent: $fileContent";
$encodedContent = $fileContent -replace "`n","\n" -replace "`r","\r" -replace '"','\"' -replace "{{","\u007b\u007b" -replace "}}", "\u007d\u007d";
Write-Host "##vso[task.setvariable variable=content;isOutput=true;]$encodedContent";
