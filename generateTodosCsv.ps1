# Parameters
param(
    [Parameter(Mandatory)]
    [string]$outputFile
)

# Functions
function Create-Baseline-Wiki() {
    $TodosUrl = "https://jsonplaceholder.typicode.com/todos/"

    $FetchedTodos = Invoke-RestMethod -Uri $TodosUrl -Method Get
    Create-CSV-From-Todos($FetchedTodos) 
}

function Create-CSV-From-Todos($Todos) {
    if (Test-Path -Path $outputFile) {
        Remove-Item -R -Force $outputFile
    }

    # Add column headings to csv file
    Add-Content $outputFile "UserId,Id,Title,IsCompleted"

    # Adding todo entries to csv file
    foreach ($Todo in $Todos) {
        $TodoUserId = $Todo.userId
        $TodoId = $Todo.id
        $TodoTitle = $Todo.title
        $TodoCompleted = $Todo.completed

        Add-Content $outputFile "$TodoUserId,$TodoId,$TodoTitle,$TodoCompleted"
    }
}


# Script execution
Create-Baseline-Wiki
Write-Output "Finished generating csv file at $outputFile"