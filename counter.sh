#!/usr/bin/env bash

COUNT=$1
FIRST_COUNTER=1
while [ $FIRST_COUNTER -le $COUNT ]
do
    echo "Count = $FIRST_COUNTER"
    ((FIRST_COUNTER++))
done

echo "Loop Finished"
exit 0

