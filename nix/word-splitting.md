### shell word splitting
this is a huge pitfall to shell utilities and scripting

[word splitting tutorial](http://mywiki.wooledge.org/WordSplitting)

#### bottom line: double quote all the time "$var"

#### args
start with a small script to test the parsing by shell of arguments

	#!/bin/sh
	printf "%d args:" $#
	printf " <%s>" "$@"
	echo

now wes can see (output is indented as per uszh):

```shell
	sh args hello world "how are you?"
		3 args: <hello> <world> <how are you?>

	var="this is a variable"
	echo $var
		this is a variable
	args $var
		1 args: <this variable man>		# ? this isn't what the example gives
```

*the author gets something different (perhaps differnt version of sh?):*

	griffon:~$ args $var
		4 args: <this> <is> <a> <variable>

#### IFS 
the input field separator

	IFS=/
	args $log
		1 args: </var/log/qmail/current>

well that's not working as intended, it isn't splitting on the separator

	unset IFS

#### a better example of spaces as separator

	touch "crappy named - file.txt"
	args $(ls)
		4 args: <crappy> <named> <-> <file.txt>

	array=(testing, testing, "1 2 3")
	echo $array
		testing, testing, 1 2 3
	echo $array[1]
		testing,
	args $array
		3 args: <testing,> <testing,> <1 2 3>

see, they are split into 3 elements. **double quoting** prevents the word splitting:

	args "$array"
		1 args: <testing, testing, 1 2 3>
	args "$array[@]"
		3 args: <testing,> <testing,> <1 2 3>

but, notice that the special `@` variable causes expansion.  
`"$@"` and `"$var[@]"` will cause word splitting expansion.

##### fin