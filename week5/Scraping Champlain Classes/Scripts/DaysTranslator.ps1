function daysTranslator($FullTable) {
    for ($i=0; $i -lt $FullTable.length; $i++) {
        $Days = @()

        if ($FullTable[$i].Days -ilike "M*") { $Days += "Monday" }

        # Checking for a T, W, or F after isn't enough because of 3 hour classes on Tuesdays
        if ($FullTable[$i].Days -ilike "T$") { $Days += "Tuesday" }

        if ($FullTable[$i].Days -ilike "W*") { $Days += "Wednesday" }

        if ($FullTable[$i].Days -ilike "*TH*") { $Days += "Thursday" }

        if ($FullTable[$i].Days -ilike "*F") { $Days += "Friday" }

        $FullTable[$i].Days = $Days
    }

    return $FullTable
}