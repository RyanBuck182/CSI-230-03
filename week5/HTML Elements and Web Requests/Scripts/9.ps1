$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://184.171.147.226/ToBeScraped.html

$scraped_page.Links.Count