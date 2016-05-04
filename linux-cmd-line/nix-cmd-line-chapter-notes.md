# linux command line
book by William Shotts, "The Linux Command Line"

## ch 23 compiling programs
	mkdir src; cd src
	sftp <source code host like: sftp.gnu.org>
	sftp> cd gnu/foldername
	sftp> get tar-file
	sftp> bye
	tar xzf tar-file
	./configure
	make
	sudo make install

compiler is usually `gcc`

you are not gonna need this too often, when you need it look it up.  
book uses `$> ftp ftp.gnu.org`, [which is known to be insecure.](http://security.stackexchange.com/questions/23124/good-practices-to-secure-ftp-access)  
`FAIL`   
use sftp, or ftps  

## ch 24 - ch 26 writing shell scripts
its good practice to write shell scripts in standard bash, rather than zsh or what have you, for portability.

### hello world!
	#!/bin/bash
	# This is our first script.
	echo 'Hello World!

### executable and findable by the shell
	chmod 755 scriptfile
	ln -s ./hello_world ~/bin

### variable declarations and other notes
all variables are strings and don't need declarations, but there are some rarely used options. `declare` with an -r flag creates an immutable constant (-r, 'read only')

	declare -r TITLE="$HOSTNAME System Information Report"

	cat << _EOF_			# here document, stops at token

### here documents
a way to pass text to a command. quotes are treated as literal text. 

**very important!** no whitespace is allowed in front of your token. so if you are sublime and replacing tabs with spaces, you are F'cked! Just push you `_EOF_` to the left edge, indents be damned.

the example from the book shows you can use it to pass a list of commands to a program:

	ftp -n << _EOF_
	open $FTP_SERVER
	user anonymous me@linuxbox
	cd $FTP_PATH
	hash
	get $REMOTE_FILE
	bye
	_EOF_
	ls -l $REMOTE_FILE

### shell functions
examples of format. the `return` command is optional, but when you are creating stubs its handy because functions must contain at least one command.

	function name {
		commands
		return
	}

	name () {
		commands
		return
	}

### example script `sysinfogen`
see `/rsrc/sysinfogen` for the sample script we are building to generate an HTML system information page.

### local variablesd
obvi, shell function vars should be local. just declare it local

	local foo
	foo=1

also, as a best practice its good to keep your developing script in a runnable state while making changes, so that the breaking change will be the latest one. *Stubs*, and printline feedback are good monitors of control flow.

### shell functions in .bashrc
better than aliases, and better than piles of script files in your ~/bin (maybe), is setting up functinos in your `.bashrc`

its debatable, I don't mind the ~/bin locations, and it allows me to deal with each script separately. there is a place for simple utility functions though, "when the time comes you will know"

## ch 27 flow control and branching
now you are into the `if`





