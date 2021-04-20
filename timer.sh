#!/bin/ksh
for (( i=$1; i>0; i--)); do
  sleep 1 &
  printf "  $i \r"
  wait
done
