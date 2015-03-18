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
colors=(30 31 32 33 34 35 36 37)
for k in "${keywords[@]}"
do
  idx=`expr ${idx:-0} + 1`
  color=${colors[`expr ${idx} % ${#colors[@]}`]}
  [ ${#coloring[@]} -eq 0 ] && coloring="| sed"
  coloring=("${coloring[@]}" "-e 's/\(${k}\)/\x1b[1;${color}m\1\x1b[0m/g'")
done

# exec
#
cmd="\${COLORING_CMD:-tail} ${argv[@]} ${coloring[@]}"
eval "$cmd"

exit 0
