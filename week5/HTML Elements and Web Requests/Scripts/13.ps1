$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://184.171.147.226/ToBeScraped.html

$divs1=$scraped_page.ParsedHtml.body.getElementsByTagName("div") | `
    Where { $_.getAttributeNode("class").Value -ilike "div-1" } | `
    Select innerText

$divs1