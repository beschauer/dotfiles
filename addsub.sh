#!/bin/bash

# This script executes 'git submodule add' for each entry in .gitmodules
# Execute it like this: ./addsub.sh .gitmodules


lnr=0
cmd=""

while read line 
do
  
  lnr=$((lnr+1))
  case $((lnr%3)) in
  0)
    #line with url
    url=$(echo "$line" | cut -c 7- )
    cmd="$cmd $url $path"
    # add the submodule
    $cmd
    ;;
  1)
    # line with submodule name.
    # reset cmd
    cmd="git submodule add"
    ;;
  2)
    # line with path of submodule
    path=$(echo "$line" | cut -c 8- )
    ;;
  esac
  
done < $1
