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

## ch 24 writing shell scripts
its good practice to write shell scripts in standard bash, rather than zsh or what have you, for portability.

### hello world!
	#!/bin/bash
	# This is our first script.
	echo 'Hello World!

#### executable and findable by the shell
	chmod 755 scriptfile
	ln -s ./hello_world ~/bin

