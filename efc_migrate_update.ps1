<#
    Adds a new EFC migration and updates the database
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$name,
    [Parameter(Mandatory=$false)]
    [String]$context
)

if (-not($name))
{
    Throw "Must provide name for new migration"
}
else 
{
    $AddMigration = "dotnet ef migrations add $name"

    if($context)
    {
        $AddMigration+= " --context $context"
    }

    Invoke-Expression $AddMigration

    $UpdateDB = "dotnet ef database update"

    if($context)
    {
        $UpdateDB+= " --context $context"
    }
    Invoke-Expression $UpdateDB
}
