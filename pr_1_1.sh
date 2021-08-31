#!/bin/bash 


declare -a array
array=()
counter=0
for ((i=1; i<=10; i++))
do
	R=$((RANDOM%99 + 1))
	if [ $R -lt 10 ]
	then
		var=$((R*100))
		array[ ((counter++)) ]=$var
	elif [ $R -lt 100 ]
	then
		var=$((R*10))
		array[ ((counter++)) ]=$var
	fi
done
echo ${array[@]}
echo ${!array[@]}

myfunc() {
	larger_no=0
	for  (( j=0; j<=${#array[@]}; j++ ))
	do
		if [ $larger_no -lt $((${array[$j]})) ]	
		then
			larger_no=${array[$j]}
		fi
	done

}

myfunc

array=(${array[@]/$larger_no})
echo ${array[@]}
echo ${!array[@]}

myfunc

echo "The Second Largest Number is:" $larger_no
