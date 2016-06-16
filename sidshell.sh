#!/bin/bash

clear
#setting up logfile
touch sidlog.log
LOGFILE=sidlog.log
echo "$(date) : Log File Created!" > $LOGFILE

#create output file
touch output.txt
echo "$(date) : Output File Created!" >> $LOGFILE
#adding permissions just to be safe
chmod 755 output.txt

#counting occurences
COUNT="$(grep -c "00:00" input.txt)"
echo "$(date) : Count of patterns found -> ${COUNT}" >> $LOGFILE
echo "$(date) : Starting pattern removal..." >> $LOGFILE
#removing pattern
sed s/00:00// <input.txt >output.txt
echo "$(date) : Pattern removal done!" >> $LOGFILE
echo "$(date) : Output file -> output.txt!" >> $LOGFILE

echo "$(date) : Task complete. Exiting shell!" >> $LOGFILE
#display output file before exiting 
vi output.txt
exit
