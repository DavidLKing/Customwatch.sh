#!/usr/bin/env bash

# Figure out how many folders the user wants to check.
echo "How many folders, relative to this location, do you want to monitor?" 

# Assign that number to variable $number
read number 

# Begin incrementation for while loop
i=1 
folders=() # Get a nice clean array

# Below, we are opening a while loop, starting with the number 1, counting up,
# and asking the user to tell which directories to check, then adding them to
# directory array $folders.
while [ "$i" -le "$number" ]; do	
	echo -n "Folder "; echo -n $i; echo -n " is:"
	read name
	folders+=("$name")
	i=$((i+1))
	done
	
commandarray=()
for n in ${folders[@]}; do
	command="echo -n 'FOLDER'; echo $n && ls -lsahrt $n | tail -n5 &&"
	commandarray+=($command)
	done

lsstring=`echo ${commandarray[@]} | sed -e "s/&&$//"`
watch -n 1 "$lsstring"
