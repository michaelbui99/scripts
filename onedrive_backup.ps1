param (
    [Parameter(Mandatory = $false)]
    [string]$path,
    [Parameter(Mandatory = $false)]
    [string]$preset
)

$OneDrivePath = Get-Item -Path $Env:OneDriveConsumer

if ($path -and -not($preset)) {
    $CopyPathToOneDrive = "xcopy $path $OneDrivePath /s /e"

    Invoke-Expression $CopyPathToOneDrive
}
elseif (-not($path) -and $preset -eq "school") {
    $SchoolFolderPath = "C:\Users\Bruger\Desktop\Skole"
    $Destination = Join-Path -Path "$OneDrivePath" -ChildPath "\Skole"

    Invoke-Expression "echo Copying to $Destination..."
    $CopySchoolFolderToOneDrive = "copy -Recurse $SchoolFolderPath $OneDrivePath"

    if (Test-Path -Path $Destination) {
        Invoke-Expression "rm -Recurse -Force -Path $Destination"
        $CopySchoolFolderToOneDrive = "copy -Force -Recurse $SchoolFolderPath $Destination"
    }

    Invoke-Expression "$CopySchoolFolderToOneDrive"
}
else {
    throw "path and preset params cannot be used together or no params was provided"
}
