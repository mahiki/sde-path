### if conditionals
*in shell scripts*

I've had some problems just getting simple shell scripts to run, because of the strange behavior or bash boolean values (they don't exist, maybe?), the 0/1 error code vs. true false dichotomy, whatever.

[good cheatsheetz](http://ricostacruz.com/cheatsheets/sh.html#ifs)

#### reminders
	$(( arithmetic in here ))				# this is how to evaluate expressions
	if [[ logical-test && logical-test ]]		# the conditional test

- spaces matter!
- the double (( or [[ are the better POSIX compliant one
- `#!/bin/sh` shebang for the most basic bash, not zsh, ksh, or korn
- practice with literal values before putting literals in

#### examples
based on my effort to write tiny utility scripts here are my notes

##### test-if.sh
first of all, try to digest this:

###### lesson 1 - text vs boolean
```shell
# both 1 and 0 evaluate true, because they are just strings here
if [[ 0 ]]
	then 
	echo "0 is true"
fi
if [[ 1 ]]
	then 
	echo "1 is true"
fi
```

fine but if you are making arithmetic comparisons your expressions become boolean

###### lesson 2 - logical operators
```shell
printf "3 < 4: "
echo $(( 3 < 4 ))
if [[ (( 3 < 4 )) && (( 3 > 7 )) ]]
	then
	echo "this won't print"
elif [[ (( 3 < 4 )) && (( 3 < 7 )) ]]
	then
	echo "passed both"
fi
```

so that worked pretty well. for last one, let's get a loop with variables

###### lesson 3 - variable expressions in if
along with loop syntax, and if conditionals, and printf

a simplified version of the `test-if.sh` script:
```shell
for RANDO in {0..9} 
do
	printf 'i: %s' $RANDO
	if (( $RANDO < 7 )) && (( $RANDO % 2 == 0 ))
		then
		printf '  %s\n' "i < 7 && i even"
	else
		printf '  %s && %s makes false\n' $(( $RANDO < 7 )) $(( $RANDO % 2 == 0 ))
	fi
done
```