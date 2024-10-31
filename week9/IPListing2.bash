# Display message if no argument is passed
[ "$#" -eq 0 ] && echo "Usage: $0 <Prefix>" && exit 1

# Prefix is the first input
prefix="$1"

# Verify input length
[ "${#prefix}" -lt 5 ] && \
printf "Prefix length is too short\nPrefix example: 10.0.17\n" && \
exit 1

for i in {1..255}
do
	echo "${prefix}.$i"
done
