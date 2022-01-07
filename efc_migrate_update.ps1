<#
    Adds a new EFC migration and updates the database
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$name
)

if (-not($name))
{
    Throw "Must provide name for new migration"
}
else 
{
    $AddMigration = "dotnet ef migrations add $name"

    Invoke-Expression $AddMigration

    $UpdateDB = "dotnet ef database update"

    Invoke-Expression $UpdateDB
}
