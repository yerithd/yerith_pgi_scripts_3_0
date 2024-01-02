#!/bin/bash
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
#Usage: ./thisScript [-s] <-n NEW> <-o OLD> <list of files>


function remove_execute_bit_on_NON_BASH
{
	FOLDER_TO_PROCESS="$1"
  
	echo "PROCESSING DIRECTORY: ${FOLDER_TO_PROCESS}"

	for relative_path_f in $(dir ${FOLDER_TO_PROCESS}); do
	
		f="$(readlink -f "$relative_path_f")"
		
		if [ -d "${f}" ]; then
			cd "$f"
		  remove_execute_bit_on_NON_BASH "$f"
			cd ..
		fi

		if [ ${f: -3} != ".sh" ]; then
	  	if [ $simflag ]; then
		  	echo " chmod -x $f"
	  	else
		  	echo " chmod -x $f"
      	chmod -x "$f"
			fi
		fi
	done
}


USAGE="Usage: $(basename $0) [-s] <folder>\n"

if [ $# -lt 1 ]; then
  echo "$USAGE"
	exit 1
fi

simflag=

while getopts 's' OPTION
do
  case $OPTION in
    s)	simflag=1
        echo "Simulation on"
        ;;
    ?)	printf "$USAGE" >&2
        exit 2
	;;
  esac
done
shift $(($OPTIND - 1))

remove_execute_bit_on_NON_BASH "$1"

