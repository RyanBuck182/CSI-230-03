function pageCount() {
	count="$(cat /var/log/apache2/access.log | cut -d ' ' -f7  | sort | uniq -c -i)"
}

pageCount
echo "$count"
