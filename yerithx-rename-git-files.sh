#!/bin/bash
# @author: PROF. DIPL.-INF. DR. XAVIER NOUNDOU
# Script to rename file from
# pattern old*.X to new*.X
# Usage: ./thisScript <-n NEW> <-o OLD> <list of files>

USAGE="Usage: $(basename $0) [-s] <-n NEW> <-o OLD> <list of files>"

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
	;;
    o)	oflag=1
      	oval="$OPTARG"
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
  aTail="${f##${oval}}"
  if [ ${#aTail} -eq ${#f} ]; then
    continue
  else    
    echo "git mv "$f" "${nval}${aTail}""
    if [ ! $simflag ]; then
      git mv "$f" "${nval}${aTail}"
    fi
  fi
done

