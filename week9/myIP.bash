myIP="$(ip addr | grep -o -E "inet ([0-9]{1,3}\.){3,4}[0-9]{1,3}/24 brd")"
start=6
end="$((${#myIP}-7))"
echo "$(cut -c 6-$end <<< $myIP)"
