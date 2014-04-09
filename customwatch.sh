echo "How many folders, relative to this location, do you want to monitor?" # Figure out how many folders the user wants to check.
read number # Assign that number to variable $number
i=1 # Begin incrementation for while loop
folders=() # Get a nice clean array

## Below, we are opening a while loop, starting with the number 1, counting up, and asking the user to tell which directories to check, then adding them to directory array $folders
while [ "$i" -le "$number" ]; do	
	echo -n "Folder "; echo -n $i; echo -n " is:"
	read name
	folders+=("$name")
	i=$((i+1))
	done
	
# echo ${folders[@]} # A test to see if the above loop worked.

commandarray=()
for n in ${folders[@]}; do
	command="echo -n 'FOLDER'; echo $n && ls -lsah $n | tail -n5 &&"
	commandarray+=($command)
	done

lsstring=`echo ${commandarray[@]} | sed -e "s/&&$//"`
# echo $lsstring # Another test
watch -n 1 "$lsstring"
