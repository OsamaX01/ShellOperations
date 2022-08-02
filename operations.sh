#!/bin/bash

directory=$1
operation_argument=$3
operation_type=$2

test() {
	while :
	do
		find . -type d -iname "${directory}" > dir.txt
		if [ -s ./dir.txt ] ; then break ; fi
		read -p "please enter an existing directory: " directory
	done

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

test