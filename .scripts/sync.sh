#!/bin/bash
CWD=$(pwd)
SUBMODULES=$(echo $(dotbare submodule) | tr -s ' ' | cut -d' ' -f2)
DT=$(date '+%d/%m/%Y %H:%M:%S')
for SUBMODULE in $SUBMODULES
do
    cd $SUBMODULE
    echo ---$(pwd)---
    git add .
    git commit -m "sync ($DT)"
    cd $CWD
done
echo ---dotbare---
dotbare add -u
dotbare commit -m "sync ($DT)"
dotbare push --recurse-submodules=on-demand

