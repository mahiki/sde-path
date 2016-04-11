## composing programs
[Composing Programs booksite](http://composingprograms.com/)

### ch 1
*python 3 is not yet installed, but 2.7 is there*

#### 1.1.2 install python3
	brew update && brew install python3
	brew linkapps python3				# this gets it into the applications directory

now let's try some python!

	>>> print("Hellllooooooo World!!")
	Hellllooooooo World!!

#### 1.1.4 first example **functions**
using a datafile of all of shakespeare's plays

	python3
	>>> from urllib.request import urlopen
	>>> shakespeare = urlopen('http://composingprograms.com/shakespeare.txt')
	>>> words = set(shakespeare.read().decode().split())

that's interesting, how do i learn more about python sets?

	>>> help(set)
	class set(object)
	 |  set() -> new empty set object
	 |  set(iterable) -> new set object
	 |  Build an unordered collection of unique elements.
	 |  Methods defined here:
	 |  __and__(self, value, /)
	 |      Return self&value.
	.....

now a cool text search snippet

	>>> {w for w in words if len(w) == 6 and w[::-1] in words}
	{'repaid', 'drawer', 'reward', 'diaper', 'redder'}

these are all the words in shakespeare that are the 6 letter words whose reverse spelling are also found in the shakespeare corpus.

notation

`w[::-1]` enumerates each letter in w[], the `-1` indicates step backward.

