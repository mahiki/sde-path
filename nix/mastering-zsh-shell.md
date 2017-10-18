## master your z shell 
[by Nacho Caballero](http://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell/) *ever*

### begin!
      echo $0
            -zsh
      cd ~repo/sde-path/nix

#### create folder structure
```
      # create the folder structure
      mkdir -pv zsh-demo/{data,calculations}/africa/{kenya,malawi}/ zsh-demo/{data,calculations}/europe/{malta,poland}/ zsh-demo/{data,calculations}/asia/{nepal,laos}/
      
      # create dummy files inside the data folder
      for country_folder in zsh-demo/data/*/*; do
          dd if=/dev/zero of="${country_folder}/population.txt" bs=1024 count=1
          dd if=/dev/zero of="${country_folder}/income.txt" bs=2048 count=1
          dd if=/dev/zero of="${country_folder}/literacy.txt" bs=4096 count=1
          # we say these are dummy files because they don't have any content,
          # but we are making them occupy disk space
      done
      
      # create dummy files inside the calculations folder
      for country_folder in zsh-demo/calculations/*/*; do
          touch "${country_folder}/population_by_province.txt"    # this file is empty
          dd if=/dev/zero of="${country_folder}/median_income.txt" bs=2048 count=1
          dd if=/dev/zero of="${country_folder}/literacy_index.txt" bs=4096 count=1
      done
      
      # because all the files are nested within the zsh-demo folder you will
      # be able to easily delete them by running:
      # rm -r zsh-demo
```

now you are ready

#### globbing
      ls zsh-demo/
	ls zsh-demo/*/*						# files two levels down
	
	ls zsh-demo/**/*.txt               	 		# unlimited levels down

      ls zsh-demo/*/*.txt                	 		# zsh: no matches found: zsh-demo/*/*.txt

      ls zsh-demo 
            calculations  datals zsh-demo             

      ls zsh-demo/*                      	 		# files/folders one level down
            zsh-demo/calculations:
            africa      asia  europe

            zsh-demo/data:
            africa      asia  europe

      ls zsh-demo/*/*                    	 		# files/folders two levels down
            zsh-demo/calculations/africa:
            kenya  malawi

            zsh-demo/calculations/asia:
            laos  nepal
            ...

		ls zsh-demo/**/*					# any file/folder below root folder

#### most useful glob operators
	# list .txt files that end in a number from 1 to 10  NOTE THE ANGLE BRACKET FOR NUMBERS
	ls -l zsh-demo/**/*<1-10>.txt

	# list .txt files that start with the letter a
	ls -l zsh-demo/**/[a]*.txt

	# list .txt files that start with either ab or bc
	ls -l zsh-demo/**/(eu|po)*.txt

	# list .txt files that don't start with a lower or uppercase c
	ls -l zsh-demo/**/[^cC]*.txt

	# list .txt files that contain u or 5
	print -l zsh-demo/**/*[5u]*.txt

example results

	l zsh-demo/**/[i]*.txt
		-rw-r--r-- 1 merlinr 2.0K Nov 17 12:29 zsh-demo/data/africa/kenya/income.txt
		-rw-r--r-- 1 merlinr 2.0K Nov 17 12:29 zsh-demo/data/africa/malawi/income.txt
		-rw-r--r-- 1 merlinr 2.0K Nov 17 12:29 zsh-demo/data/asia/laos/income.txt
		-rw-r--r-- 1 merlinr 2.0K Nov 17 12:29 zsh-demo/data/asia/nepal/income.txt
		..

#### glob qualifiers
	print -l zsh-demo/**/*(/)					# show only folders
	print -l zsh-demo/**/*/						# show only folders, with the trailing slash

	print -l zsh-demo/**/[^adklmnp]*(/)				# awesome
		zsh-demo/calculations
		zsh-demo/calculations/europe
		zsh-demo/data/europe

	print -l zsh-demo/**/*(.)					# all the regular files
		zsh-demo/calculations/africa/kenya/literacy_index.txt
		zsh-demo/calculations/africa/kenya/median_income.txt
		..

	ls -l zsh-demo/**/*(L0)						# empty files
	ls -l zsh-demo/**/*(Lk+3)					# files greater than 3 KB
	print -l zsh-demo/**/*(mh-1) 					# files modified in the last hour
	print -l zsh-demo/**/*(mM+1) 					# modified more than 1 month ago
	ls -l zsh-demo/**/*(om[1,3])					# sort files from most to least recently modified and show the last 3

a crazy example	

	ls -l zsh-demo/**/*(.Lm-2mh-1om[1,3])			# regular files, < 2MB, modified in last hour, sort by modification, 3 results

	print -l zsh-demo/*/*(e:'[[ ! -e $REPLY/malta ]]':)	# folders that don't contain malta
		zsh-demo/calculations/africa
		zsh-demo/calculations/asia
		zsh-demo/data/africa
		zsh-demo/data/asia

#### variable transformations
**modifiers** are led by a colon in glob qualifiers `(:_____)`

	print -l zsh-demo/data/europe/poland/*.txt(:t)		# tail, meaning just the file name
	print -l zsh-demo/data/europe/poland/*.txt(:t:r)	# tail, remove extension
	print -l zsh-demo/data/europe/poland/*.txt(:e)		# extention only
	print -l zsh-demo/*/europe/poland/*.txt(:h)		# head, the parent folder path, containing .txt files
	print -l zsh-demo/data/**/*.txt(:h:t)			# head, the parent only tail, containing .txt files
	print -l zsh-demo/data/europe/poland/*.txt(:h:h)	# parent folder of the parent
	print -l zsh-demo/data/europe/poland/*.txt([1]:h)	# parent folder of the first file

#### parameter expansion
```bash
# run me, you'll like it

my_file=(zsh-demo/data/europe/poland/*.txt([1]))
# If you want to store a glob in a variable, you must use parentheses

print -l $my_file
print -l $my_file(:h)    # this is the syntax we saw before
print -l ${my_file:h}    # I find this syntax more convenient
print -l ${my_file(:h)}  # don't mix the two, or you'll get an error

print -l ${my_file:u}    # the :u modifier makes the text uppercase
```

Let’s say we wanted to calculate the maximum income for each country, and store it in a file named `{country}_max_income.txt` in the corresponding calculations folder. We can do this easily using my favorite modifier `(:s`)`:

```bash
for file in zsh-demo/data/**/income.txt ; do
    output_dir=${file:h:s/data/calculations/}
    country=${output_dir:t}
    output_file="${output_dir}/${country}_max_income.txt"
    echo "The max salary is $RANDOM dollars" > $output_file
done

# let's see what we just did
grep "" zsh-demo/calculations/**/*_max_income.txt
```

to see how the substitution parameter works `(:s)`

	print -l zsh-demo/data/europe/poland/*.txt([1]:h)
		zsh-demo/data/europe/poland
	print -l zsh-demo/data/europe/poland/*.txt([1]:h:s/data/calculations)
		zsh-demo/calculations/europe/poland

it substitues the text in the slashes

##### explanation of the max income script
- Each time the for loop runs, the $file variable is set to a different income file: zsh-demo/data/africa/kenya/income.txt.
- We use the :h modifier to get rid of the file name: zsh-demo/data/africa/kenya/,
and then we use the :s modifier to substitute data with calculations: zsh-demo/calculations/africa/kenya/,
then we store that substituted path in the $output_dir variable.
- We use the :t modifier to get the name of the country (kenya) and we store it in the $country variable
- Then we stick a slash / between the $output_dir and $country variables, and append _max_income.txt to get our output file path: zsh-demo/calculations/africa/kenya/kenya_max_income.txt
- The $RANDOM variable gives you a random number every time you call it (it’s just a quick way of generating some content).
- The right arrow > saves the calculation to the output file.

### there's some more, saved in evernote and here:
[mastering the z shell](http://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell/)

	:gs			# global substitute instead of just one
	expansion flags	# split file names on a character
				(s) split
				(j) join
	splitting file name into an array to extract elements like continent, country, calculations

#### use previous argument for new command with bang
	echo zsh-demo/data/asia/laos/population.txt
	ls -l !!1 <tab>				# ls -l zsh-demo/data/asia/laos/population.txt

	echo a b c 					# 3 argumnents
	print -l !!*				# print all the previous arguments
		a
		b
		c

#### the event designators
```
# ![bang] command:[![previous] | -N[Nth previous] | $[last]] argument:[N[Nth] | $[last]]
!!					# previous command
!!1					# 1st argument of previous command
!!3					# 3rd argument of previous command
!!$					# last argument of previous command
!$					# last argument of previous command
!!*					# all previous arguments, previous command
!-2$					# last argument from 2 commands ago
!-3:2					# second argument from 3 commands ago
```

### other things
```
zmv -n				# alwasy use this to preview before mangling your file system


