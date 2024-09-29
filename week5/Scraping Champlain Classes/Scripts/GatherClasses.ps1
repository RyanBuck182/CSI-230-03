function gatherClasses() {
    $page = Invoke-WebRequest -TimeoutSec 2 http://184.171.147.226/Courses.html

    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    $FullTable = @()
    for ($i=0; $i -lt $trs.length; $i++) {
        $tds = $trs[$i].getElementsByTagName("td")
        
        $Times = $tds[5].innerText.Split("-")
        
        $FullTable += [pscustomobject]@{ `
            "Class Code" = $tds[0].innerText; `
            "Title" = $tds[1].innerText; `
            "Days" = $tds[4].innerText; `
            "Time Start" = $Times[0]; `
            "Time End" = $Times[1]; `
            "Instructor" = $tds[6].innerText; `
            "Location" = $tds[7].innerText; `
        }
    }

    return $FullTable
}