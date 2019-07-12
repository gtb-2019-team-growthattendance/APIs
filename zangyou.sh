#!/bin/bash

USERID=$1
O_TIME=$2

HOUR=`echo $D_TIME | grep -o '.' | grep -B2 h | grep [1-9] | awk '{if(NR%10){ORS=""}else{ORS="\n"};print;}' || echo "0"`
MINUTES=`echo $D_TIME | grep -o '.' | grep -B2 m | grep [1-9] | awk '{if(NR%10){ORS=""}else{ORS="\n"};print;}' || echo "0"`

OVR_MINUTES=$(($HOUR*60+$MINUTES))

SQL=INSERT INTO syain(userid,Overtime) VALUES ($USERID,$OVR_MINUTES);

echo $SQL | mysql -u app -h appdb001.abot.work -pjP6azn7V
