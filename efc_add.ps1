<#
    Adds the necessecary EntityFramework Core packages to a C# .NET project. 
    All packages will be installed with latest versions.

    TODO: Add parameter for choosing EFC version
#>

param (
    [string]$provider
)
$AddEfcCommand = "dotnet add package Microsoft.EntityFrameworkCore"

Invoke-Expression $AddEfcCommand

$AddEfcDesignCommand = "dotnet add package Microsoft.EntityFrameworkCore.Design"

Invoke-Expression $AddEfcDesignCommand

if($provider)
{
    if($provider -eq "sqlite")
    {
        $AddEfcSqliteCommand = "dotnet add package Microsoft.EntityFrameworkCore.Sqlite"
        Invoke-Expression $AddEfcSqliteCommand
    }
    elseif($provider -eq "psql")
    {
        $AddEfcPsqlCommand = "dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL"
        Invoke-Expression $AddEfcPsqlCommand
    }
}

