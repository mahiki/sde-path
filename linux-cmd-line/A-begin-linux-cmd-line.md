## Part A - Linux Command Line
*notes and excercizes from the book, save the best*

## stuff

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
