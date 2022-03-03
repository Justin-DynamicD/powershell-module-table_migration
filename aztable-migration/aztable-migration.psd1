@{
    ModuleVersion = '0.1'
    GUID = '740cfbc1-db4c-4310-ae0e-49f6c9ef5f33'
    Author = 'Justin King'
    CompanyName = 'Unknown'
    Copyright = 'GNU General Public License v3.0'
    Description = 'Allows the bulk download/upload of tables from storage accounts'
    PowerShellVersion = '4.0'
    NestedModules = @(
      '.\functions\Export-AzTable',
      '.\functions\Import-AzTable'
    )
    FunctionsToExport = @(
      'Export-AzTable',
      'Import-Aztable'
    )
    PrivateData = @{
      PSData = @{
        Tags = @('AzStorage','backup', 'azstoragetable')
        ProjectUri = 'https://github.com/Justin-DynamicD/powershell-module-table_migration'
        LicenseUri = 'https://github.com/Justin-DynamicD/powershell-module-table_migration/blob/master/LICENSE'
      } # End of PSData hashtable
    } # End of PrivateData hashtable
  }