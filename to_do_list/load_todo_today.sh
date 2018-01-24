#!/bin/bash

dateToday=$(date -R | cut -f 1,2,3,4 -d " ")
numericalDateToday=$(date --date="$headingToday" +"%s")

toDoPath=/home/matt/Documents/to-do.txt
firstLineOfToDo=$(head -1 $toDoPath)
numericalFirstLine=$(date --date="$firstLineOfToDo" +"%s")

if [ "$numericalDateToday" -gt "$numericalFirstLine" ] 
then
	currentToDoContent=$(cat "$toDoPath")

	echo "$dateToday" > "$toDoPath"

	charCount=$(wc -c < "$toDoPath")

	dashes="-"
	for ((i=2;i<charCount;i++))
	do
		dashes=${dashes}"-"
	done

	echo $dashes >> "$toDoPath"

	echo "" >> "$toDoPath"

	echo "apps" >> $toDoPath
	echo "training" >> $toDoPath
	echo "puzzle" >> $toDoPath
	echo "coding" >> $toDoPath

	echo "" >> "$toDoPath"
	echo "" >> "$toDoPath"

	echo "$currentToDoContent" >> $toDoPath
fi



