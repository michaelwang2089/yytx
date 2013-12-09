#!/bin/bash

pro_root=$HOME/work/dev
user="michaelwang"
param="platform=-DFOR_MOBILE"
export LD_LIBRARY_PATH=$pro_root/libs

result=$(echo $1 | grep 'l')
if [[ $result != "" ]] 
then
  echo -e '\e[0;33;1mmake logic\e[0m'
  cd .. && seq 50|xargs -i echo '\e[0;33;1mI L\e[0m\e[0;33;1mo\e[0mve Y\e[0;33;1mou\e[0\e[0;33;1mm Forever\e[0m'
  cd $pro_root/logic && make $param 
fi

result=$(echo $1 | grep 'w')
if [[ $result != "" ]] 
then
  echo -e '\e[0;33;1mmake world\e[0m'
  cd $pro_root/world && make $param 
fi

result=$(echo $1 | grep 'd')
if [[ $result != "" ]] 
then
  echo -e '\e[0;33;1mmake db_proxy\e[0m'
  cd $pro_root/db_proxy && make $param
fi

result=$(echo $1 | grep 'c')
if [[ $result != "" ]] 
then
  echo -e '\e[0;33;1mmake chat\e[0m'
  cd $pro_root/chat && make $param
fi
