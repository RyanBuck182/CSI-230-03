:> report.html

echo "<html><p>Access logs with IOC indicators:</p><body><table>" \
 >> report.html

cat "report.txt" | while read line;
do
	[ -z "$line" ] && continue

	echo "<tr>" >> report.html
	echo "$line" | awk \
	 '{ for(i=1;i<=3;i++) print "<td style=\"border: 1px solid black\">", $i, "</td>" }' \
	 >> report.html
	echo "</tr>" >> report.html
done

echo "</table></body></html>" >> report.html

mv report.html /var/www/html/report.html
