#!/bin/bash
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
# Script to replace string 'OLD' by 'NEW' in files
#Usage: ./thisScript [-s] <-n NEW> <-o OLD> <list of files>

USAGE="Usage: $(basename $0) [-s] <-n NEW> <-o OLD> <list of files>\n"

if [ $# -lt 5 ]; then
  echo "$USAGE"
fi

nflag=
oflag=
simflag=

while getopts 'o:n:s' OPTION
do
  case $OPTION in
    n)	nflag=1
      	nval="$OPTARG"
        #echo new string: ${nval} 
	;;
    o)	oflag=1
      	oval="$OPTARG"
        #echo old string: ${oval} 
	;;
    s)	simflag=1
        echo "Simulation on"
        ;;
    ?)	printf "$USAGE" >&2
        exit 2
	;;
  esac
done
shift $(($OPTIND - 1))

for f in "${@}"; do
  if [ -f "$f" ]; then
    if [ $simflag ]; then
      sed "s|${oval}|${nval}|g" "$f"
    else
      sed -i "s|${oval}|${nval}|g" "$f"
    fi
  fi
done

