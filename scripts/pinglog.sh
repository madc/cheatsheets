#!/bin/bash

# Script to regularly ping a certain host and log missing packets and errors.

HOST=127.0.0.1"
COUNT=10
INTERVAL=5

echo "Pinging $HOST every $INTERVAL minutes."
echo "Press [CTRL+C] to stop..."

while :
do
	echo -ne "\r\e[93mPinging...\e[0m"

	STATS=$(ping -c $COUNT $HOST | grep 'received')
	STATSSENT=$(echo $STATS | awk -F',' '{ print $1 }' | awk '{ print $1 }')
	STATSPERCENT=$(echo $STATS | awk -F',' '{ print $3 }' | awk '{ print $1 }')
	STATSTIME=$(echo $STATS | awk -F',' '{ print $4 }' | awk '{ print $2 }')
	STATSDATE=$(date +"%Y-%m-%d %T")
	STATSSTATUS="\e[32mOK  \e[0m"

	# Add to log, if packet loss
	if [ "$STATSPERCENT" != "0%" ]; then
		# If "host is unreachable", packet loss is found at $4
		STATSSTATUSERRORTEXT=$(echo $STATS | awk -F',' '{ print $3 }' | awk '{ print $2 }')
		if [ "$STATSSTATUSERRORTEXT" != "packet" ]; then
			STATSSTATUS="\e[31mERROR\e[0m ($STATSPERCENT errors)"
			STATSPERCENT=$(echo $STATS | awk -F',' '{ print $4 }' | awk '{ print $1 }')
			STATSTIME=$(echo $STATS | awk -F',' '{ print $5 }' | awk '{ print $2 }')
		else
			STATSSTATUS="\e[31mBAD\e[0m ($STATSPERCENT packet loss)"
		fi

		# Log: Date, # packets sent, loss percent, request time, status message
		echo -e "$STATSDATE,$STATSSENT,$STATSPERCENT,$STATSTIME,$STATSSTATUS" | sed -r "s:\x1B\[[0-9;]*[mK]::g" >> ping.log
	fi

	echo -ne "\rLast Ping ($STATSDATE): $STATSSTATUS"

	# Wait for $INTERVAL min.
	sleep $(($INTERVAL*60))
done
