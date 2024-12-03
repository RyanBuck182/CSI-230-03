link="10.0.17.6/IOC.html"


fullPage=$(curl -sL "$link")

toolOutput=$(echo "$fullPage" | \
xmlstarlet format --html --recover 2>/dev/null | \
xmlstarlet select --template --value-of \
"//table//tr//td[1]")

echo "$toolOutput" > IOC.txt
