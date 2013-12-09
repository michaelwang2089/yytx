#!/bin/bash

pro_root=$HOME/work/dev
user="michaelwang"

export LD_LIBRARY_PATH=$pro_root/libs

result=$(echo $1 | grep 'l')
if [[ $result != "" ]] 
then
  echo -e '\e[0;33;1mlaunch logic\e[0m'
  cd $pro_root/logic/bin
  killall -9 ilogic -u $user
  ./ilogic -u $user -C -i 1 1&
  ./ilogic -u $user -C -i 2 1&
fi

result=$(echo $1 | grep 'w')
if [[ $result != "" ]] 
then
  echo -e '\e[0;33;1mlaunch world\e[0m'
  cd $pro_root/world/bin
  killall -9 iworld -u $user
  ./iworld -u $user -C -p 4399 -s 1&
fi

result=$(echo $1 | grep 'd')
if [[ $result != "" ]] 
then
  echo -e '\e[0;33;1mlaunch db_proxy\e[0m'
  cd $pro_root/db_proxy/bin
  killall -9 db_proxy -u $user
  ./db_proxy -u $user -C -n 5 -p 4399 -s 1&
fi

result=$(echo $1 | grep 'c')
if [[ $result != "" ]] 
then
  echo -e '\e[0;33;1mlaunch chat\e[0m'
  cd $pro_root/chat/bin
  killall -9 ichat -u $user
  ./ichat -u $user -C -p 4399 -s 1&
fi
