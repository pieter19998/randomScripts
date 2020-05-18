#!/usr/bin/env zsh
vared -p 'enter a address to connect to: ' -c address
vared -p 'amount of pings: ' -c ping

total=0

for ((i = 0 ; i < $ping; i++)); do
	time=$(curl -w "%{time_total}" -o /dev/null -s $address)
	echo "request time:  ${time}"
	((total=total+time)) 
done

echo "total time: ${total}"
echo "average roundtrip time: $((total / ping))"
