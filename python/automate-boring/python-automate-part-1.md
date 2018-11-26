## automate the boring stuff - part I
beginning with the book.

### chapter 1: python basics
```python
>>> print('hello world')
hello world

# shell commands
from subprocess import call
call('ls')
```

#### first program
```python
cat << EOF > script-1.py
print('hello world')
print('what is your name?')   # um asking name
myname = input()
print('great to meet you, ' + myname)
print('the length of your name is ')
print(len(myname))
print('what is your age?')
myage = input()
print('you will be ' + str( -int(myage) + 2112) + ' in the year 2112.')
EOF
```

```python
# annoy loop
name = ''
while name != 'your name':
     print('\nplease type "your name" please\n')
     name = input()
     print('your name is ' + name)
print('\ngood day to you\n')
```

#### loops and flow
```python
while <condition> :
     <statement>
          continue
     <statement>
          break
```

#### true false madness
```python
0 == False
0.0 == False

# check this out
>>> '' == False
False

>>> not ''
True
```
#### for loops
```python
# range(n) is [0,n)
for i in range(3):
     print(i)
0
1
2
>>> range(3)
range(0,3)
# ranges don't include the right endpoint
```

### chapter 3: functions
