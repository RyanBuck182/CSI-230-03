. (Join-Path $PSScriptRoot "GatherClasses.ps1")
. (Join-Path $PSScriptRoot "DaysTranslator.ps1")

$FullTable = gatherClasses
$FullTable = daysTranslator $FullTable


$FullTable | Select-Object "Class Code", Instructor, Location, Days, "Time Start", "Time End" `
    | Where-Object { $_.Instructor -ilike "Furkan Paligu" }

$FullTable | Where-Object { ($_.Location -ilike "JOYC 310") -and ( $_.Days -contains "Monday" ) } `
    | Sort-Object "Time Start" `
    | Select-Object "Time Start", "Time End", "Class Code"

$ITSInstructors = $FullTable | Where-Object { `
        ( $_."Class Code" -ilike "SYS*" ) -or `
        ( $_."Class Code" -ilike "NET*" ) -or `
        ( $_."Class Code" -ilike "SEC*" ) -or `
        ( $_."Class Code" -ilike "FOR*" ) -or `
        ( $_."Class Code" -ilike "CSI*" ) -or `
        ( $_."Class Code" -ilike "DAT*" ) `
    } `
    | Select-Object "Instructor" `
    | Sort-Object "Instructor" -Unique
$ITSInstructors

$FullTable | Where-Object { $_.Instructor -in $ITSInstructors.Instructor } `
    | Group-Object "Instructor" `
    | Select-Object Count, Name `
    | Sort-Object Count -Descending