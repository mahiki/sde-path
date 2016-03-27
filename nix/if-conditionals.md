### if conditionals
*in shell scripts*

I've had some problems just getting simple shell scripts to run, because of the strange behavior or bash boolean values (they don't exist, maybe?), the 0/1 error code vs. true false dichotomy, whatever.

#### reminders
	$(( arithmetic in here ))				# this is how to evaluate expressions
	if [[ logical-test && logical-test ]]		# the conditional test

- spaces matter!
- the double (( or [[ are the better POSIX compliant one
- `#!/bin/sh` shebang for the most basic bash, not zsh, ksh, or korn

#### examples
based on my effort to write tiny utility scripts here are my notes

##### 