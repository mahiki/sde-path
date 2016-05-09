## nix importancies
critical things i've learned while studying all this other stuff

## sh bash zsh
[the difference between `sh` and `bash`](http://stackoverflow.com/questions/5725296/difference-between-sh-and-bash)

- sh is the POSIX standard, bash is an implementation that is mostly available everywhere but sh always will
- `zsh` has differences: zsh arrays first index is [1], bash is [0]

### scripts shebang
	#!/usr/bin/env bash			# finds the first bash on the path

[what's best shebang](http://stackoverflow.com/questions/10376206/what-is-the-preferred-bash-shebang)  
**portability** is achieved with #!/usr/bin/env bash

	#!/bin/bash					# doesn't exist on mac osx
	#!/bin/sh					# executable is bash3.2 on osx, with weird variable and array probs

	sh --version
	bash --version

- for most scripts use `#!/bin/sh`, it will be available everywhere and probably will be bash
- `which sh` gives /bin/sh usually, but perhaps symlink it to your bash
- bash invoked with `/bin/sh` will use `--posix` switch to mimix POSIX
- `#!/bin/bash` will fail with error message if bash is not available. *but could this be better? and, it didn't.*

### shebang, usage, arguments, flags in `datafilegen`
The script `repo/utility/shell/datafilegen` contains many of the idioms used in shell scripting:

- portable shebang
- gnu command dependency
- date formats
- random numbers generated
- brace expansion
- user defined function
- index array
- usage error message with exit code
- argument flags

### FreeBSD unix source code example
learn much from unix souce code in C, such as [FreeBSD source code `/usr/bin`](http://svnweb.freebsd.org/csrg/usr.bin/)

	repo/sde-path/nix/src/head.c			# great example of standard bash code

