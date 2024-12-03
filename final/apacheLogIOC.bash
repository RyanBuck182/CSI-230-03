:> temp.txt
cat "IOC.txt" | while read ioc;
do
	susLogs=$(cat "access.log" | grep "$ioc" | cut -d " " -f 1,4,7 \
	| sed 's/\[//')
	echo "$susLogs" >> temp.txt
done

sort -k2 -n temp.txt > report.txt 
rm temp.txt
