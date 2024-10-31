# Display message if no argument is passed
[ "$#" -eq 0 ] && echo "Usage: $0 <Prefix>" && exit 1

# Prefix is the first input
prefix="$1"

for i in {1..255}
do
	echo "${prefix}.$i"
done
