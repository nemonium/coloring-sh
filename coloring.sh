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
  [ ${#coloring[@]} -eq 0 ] && coloring="| sed"
  coloring=("${coloring[@]}" "-e 's/\(${k}\)/\x1b[33m\1\x1b[0m/g'")
done

# exec
#
cmd="\tail ${argv[@]} ${coloring[@]}"
eval "$cmd"

exit 0
