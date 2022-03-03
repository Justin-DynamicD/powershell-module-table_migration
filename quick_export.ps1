[CmdletBinding()]
Param
(
    # Param1 help description
    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string] $StorageAccountName,

    [Parameter(Mandatory=$true, ValueFromPipelineByPropertyName=$true)]
    [string] $ResourceGroupName,

    [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$false)]
    [string] $Destination = ".\export",

    [Parameter(Mandatory=$false, ValueFromPipelineByPropertyName=$false)]
    [int] $ParallelCount = 5
)

Begin {
  if (!(Test-Path $Destination)) {
    Write-Verbose "$Destination does not exist, creating"
    mkdir $Destination
  }
  $sa_context = (Get-AzStorageAccount $StorageAccountName -ResourceGroupName $ResourceGroupName ).Context
}

Process {
  $tableList = Get-AzStorageTable -Context $sa_context
  $tableList | ForEach-Object -ThrottleLimit $ParallelCount -Parallel {
    Write-Output "Downloading $($_.Name)"
    #Get-AzTableRow -Table $_.CloudTable | Export-csv "$($using:Destination)\$($_.Name).csv"
    Write-Output "Download complete for $($_.Name)"
  }
}

End {
}