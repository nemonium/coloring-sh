#!/bin/bash

# argument analysis
#
for i in "$@"
do
  test "${kw}" && keywords=("${keywords[@]}" "$i") && kw= && continue
  case $i in
    '-k' | '--keyword' )
      kw=1;;
    * )
      argv=("${argv[@]}" "$i")
      ;;
  esac
done

# coloring
#
for k in "${keywords[@]}"
do
  coloring=("${coloring[@]}" "| perl -pe 's/${k}/\033\[1;36m$&\033\[0m/gi' ")
done

# exec
#
cmd="\tail ${argv[@]} ${coloring[@]}"
eval "$cmd"

exit 0
