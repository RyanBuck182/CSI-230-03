cat /var/log/apache2/access.log | egrep "curl/?{1,2}\.?{1,2}\.?{1,2}" | cut -d " " -f1,12 | sort | uniq -c -i
