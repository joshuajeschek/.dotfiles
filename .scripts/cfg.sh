#!/bin/bash
dotbare fedit
dotbare add -u
dt=$(date '+%d/%m/%Y %H:%M:%S')
dotbare commit -m "cfg ($dt)"
dotbare push
source ~/.zshrc
