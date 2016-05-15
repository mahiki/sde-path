## Part A - Linux Command Line
*notes and excercizes from the book, save the best*

#### variables
	declare -r var=<value>				# immutable (read-only variable declaration)
	declare -i int=<integer value>
	local -a array=(element1 element2 ...)	# declare local variable (say for inside a function)

##### here documents
	cat << EOF
	text and variables, with "quoted" or 'single-quoted' stuff
	EOF							# mainly because 

## bash scripts - ch 24
### loops in bash scripts
I wanted to use Amazon's `drive upload <target> <destination>` command to upload a bunch of files.

Two options: bash script, or pipe in xargs or something

#### pass file list to looping script
I found an example online. I don't need the increment variable, but I can pass a list and it will call the drive command one at a time (there is a lot of I/O, so execution is slow)

	i=1
	for day
	do
	 echo "Weekday $((i++)) : $day"
	done

`day` is the variable holding the file list. here is what I came up with:

	for filename
	do
		drive upload $filename BISS/BIE-Lending-Library/
	done
