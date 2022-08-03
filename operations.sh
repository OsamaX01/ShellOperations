#!/bin/bash

directory=$1
operation_type=$2
operation_argument=$3

get_existing_directory() {
	while :
	do
		find . -type d -iname "${directory}" > dir.txt
		if [ -s ./dir.txt ] ; then break ; fi
		read -p "please enter an existing directory: " directory
	done
}

get_operation_type() {
	while :
	do
		if [[ "${operation_type}" != "ana" ]] && [[ "${operation_type}" != "del" ]] && [[ "${operation_type}" != "arr" ]]
		then 
			read -p "please enter one of the operations \"ana\"(analytics), \"del\"(delete), or \"arr\"(arrange): " operation_type
		else 
			break
		fi
	done

}

get_valid_argument() {
	case $operation_type in 
		ana) 
			if [ -z ${operation_argument} ] ; then read -p "please enter a pattern to search: " operation_argument ; fi
			;;
		del) 
			number='^[0-9]+$'
			while [ -z ${operation_argument} ] || ! [[ $operation_argument =~ $number ]]
			do
				read -p "please enter a number represinting biggest file size (only numbers allowed): " operation_argument 
			done
			;;
		arr)
			char='^[a-zA-Z]+$'
			while [ -z ${operation_argument} ] || ! [[ $operation_argument =~ $char ]]
			do
				read -p "please enter type of file you want to arrange (only alphabatical characters allowed): " operation_argument 
			done
	esac
}

analyze() {
	count=0
	cd $directory
	for file in *
	do
		tmp="`grep -c ${operation_argument} ./$file`" 
		count=$(expr $count + $tmp)
	done
	echo "Number of occurences is ${count}"
}

delete() {
	
}

arrange() {
	cd $directory
	mkdir "$operation_argument" > /dev/null 2>&1
	mv *.$operation_argument ./$operation_argument
}

operate() {
	case $operation_type in 
		ana) 
			analyze 
			;;
		del) 
			delete
			;;
		arr)
			arrange
	esac
}

get_existing_directory
get_operation_type
get_valid_argument
operate