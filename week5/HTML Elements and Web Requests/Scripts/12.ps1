$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://184.171.147.226/ToBeScraped.html

$h2s=$scraped_page.ParsedHtml.body.getElementsByTagName("h2") | Select outerText
$h2s