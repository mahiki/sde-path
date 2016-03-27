#!/bin/sh
# -------------------------------------------------------------------
#	test basic if statements
#
#  	author:	merlinr@
# -------------------------------------------------------------------

echo "lession 1 - strings vs boolean"
if [[ 0 ]]
	then 
	echo "0 is true"
fi

if [[ 1 ]]
	then 
	echo "1 is true"
fi
echo

echo "lession 2 - logical operators"
printf "3 < 4: "
echo $(( 3 < 4 ))

printf "3 < 4 && 3 > 7: "
echo $(( 3 < 4 )) " && " $(( 3 > 7 ))

printf "3 < 4 && 3 < 7: "
echo $(( 3 < 4 )) " && " $(( 3 < 7 ))

if [[ (( 3 < 4 )) && (( 3 > 7 )) ]]
	then
	echo "this won't print"
elif [[ (( 3 < 4 )) && (( 3 < 7 )) ]]
	then
	echo "passed both"
fi
echo

echo "lesson 3 - variable expressions"
# 		as well as loops, formatted print 
# 		note: 	in arithmetic conditionals 1 is true
#				but when testing exit values 0 is true
#		note: 	if [[ condition ]] is usually how to do

for RANDO in {0..9} 
do
	
	printf '%s' "( "
	printf '%s' "$RANDO < 7: "
	printf '%s' $(( $RANDO < 7 )) " )  &&  ( "
	printf '%s' $RANDO " % 2 == 0 : "
	printf '%s%s\n' $(( ($RANDO % 2) == 0 )) " )"

	if (( $RANDO < 7 )) && (( $RANDO % 2 == 0 ))
		then
		printf '     %s\n' "RANDO < 7 && RANDO even"
	else
		printf '     %s && %s makes false\n' $(( $RANDO < 7 )) $(( $RANDO % 2 == 0 ))
	fi

done
# shit I think this worked!

echo "lession 3 - simplified output"
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


