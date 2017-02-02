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
      ls zsh-demo/**/*.txt               	 		# <= this is a glob, two ** required for folder name

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
	# list text files that end in a number from 1 to 10
	ls -l zsh-demo/**/*<1-10>.txt

	# list text files that start with the letter a
	ls -l zsh-demo/**/[a]*.txt

	# list text files that start with either ab or bc
	ls -l zsh-demo/**/(eu|po)*.txt

	# list text files that don't start with a lower or uppercase c
	ls -l zsh-demo/**/[^cC]*.txt

example results

	l zsh-demo/**/[i]*.txt
		-rw-r--r-- 1 merlinr 2.0K Nov 17 12:29 zsh-demo/data/africa/kenya/income.txt
		-rw-r--r-- 1 merlinr 2.0K Nov 17 12:29 zsh-demo/data/africa/malawi/income.txt
		-rw-r--r-- 1 merlinr 2.0K Nov 17 12:29 zsh-demo/data/asia/laos/income.txt
		-rw-r--r-- 1 merlinr 2.0K Nov 17 12:29 zsh-demo/data/asia/nepal/income.txt
		..

#### glob qualifiers
	print -l zsh-demo/**/*(/)					# show only folders

	print -l zsh-demo/**/[^adklmnp]*(/)				# awesome
		zsh-demo/calculations
		zsh-demo/calculations/europe
		zsh-demo/data/europe

	print -l zsh-demo/**/*(.)					# all the regular files
		zsh-demo/calculations/africa/kenya/literacy_index.txt
		zsh-demo/calculations/africa/kenya/median_income.txt
		..

	ls -l zsh-demo/**/*(L0)						# show empty files
	ls -l zsh-demo/**/*(Lk+3)					# show files greater than 3 KB
	print -l zsh-demo/**/*(mh-1) 					# show files modified in the last hour
	ls -l zsh-demo/**/*(om[1,3])					# sort files from most to least recently modified and show the last 3

a crazy example	

	ls -l zsh-demo/**/*(.Lm-2mh-1om[1,3])			# regular files, < 2MB, modified in last hour, sort by modification, 3 results

	print -l zsh-demo/*/*(e:'[[ ! -e $REPLY/malta ]]':)	# folders that don't contain malta
		zsh-demo/calculations/africa
		zsh-demo/calculations/asia
		zsh-demo/data/africa
		zsh-demo/data/asia

#### variable transformations
