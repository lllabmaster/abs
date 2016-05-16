#!/bin/bash

# author: andy

declare -ir N=21
declare -ir L=10
declare -ir S=500
declare -a  SLOTS

init_slots()
{
    for i in $(seq $N)
    do
	SLOTS[$i]=0
    done
}

show_slots()
{
    for i in $(seq $N)
    do
	for j in $(seq ${SLOTS[$i]})
	do
	    echo -n '*'
	done
	echo
    done
}

simu_slots()
{
    declare -i  pos=0
    declare -ir range=3
    declare -ir shift=11

    for i in $(seq $L)
    do
	declare -i move=$RANDOM

	let "move %= range"
	case "$move" in
	    0) ;;
	    1) (( pos-- ));;
	    2) (( pos++ ));;
	    *) echo -n "Error";;
	esac
    done

    let "pos += shift"
    (( SLOTS[$pos]++ ))
}

fill_slots()
{
    for i in $(seq $S)
    do
	simu_slots
    done
}

init_slots
fill_slots
show_slots

exit $?
