function gatherClasses() {
    $page = Invoke-WebRequest -TimeoutSec 10 http://184.171.147.24/Courses.html

    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    $FullTable = New-Object Object[] ($trs.length - 1)
    for ($i=1; $i -lt $trs.length; $i++) {
        $tds = $trs[$i].getElementsByTagName("td")
        
        $Times = $tds[5].innerText.Split("-")
        
        $FullTable[$i-1] = [pscustomobject]@{ `
            "Class Code" = $tds[0].innerText; `
            "Title" = $tds[1].innerText; `
            "Days" = $tds[4].innerText; `
            "Time Start" = $Times[0]; `
            "Time End" = $Times[1]; `
            "Instructor" = $tds[6].innerText; `
            "Location" = $tds[9].innerText; `
        }
    }

    return $FullTable
}