cat /var/log/apache2/access.log | egrep "GET /page2.html" | cut -d ' ' -f 1,7 | tr -d "/"
