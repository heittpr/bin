#!/bin/sh

[ -z $* ] && exit

file=$1; shift
[ ! -f $file ] && { echo "no such file"; exit; } 

base=${file%.*}
ext=${file##*.}

case $ext in
  c)
    gcc $@ $file -o $base -lm
  ;;

  cpp|cc)
    g++ $@ $file -o $base
  ;;

  *)
    echo "invalid file"
    exit
  ;;
esac
