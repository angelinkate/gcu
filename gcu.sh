#!/bin/bash

id=$1
if [ -z $id ]; then 
echo "####### wranning #######"
echo "if you want to clone a git repository, please pass your id."
exit 0
fi

target=$2
if [ -z $target ]; then
target=$(pwd)
fi
me=$(pwd)

echo "your id is " $id

# TODO: put a repository url
inits=(
"git clone https://github.com/${id}/gcu.git"
)

# TODO: put a git local directory
rnames=( 
"android-qlog"
)

echo "root directory is ${target}"
echo "current directory is ${me}"
echo "you have ${#rnames[@]} repositories"

i=0
for repo in "${rnames[@]}"
do
  echo "---"
  cd "${target}"
  if [ ! -d "${repo}" ]; then
  	echo "clone" ${inits[$i]} 
	${inits[$i]} 
  else
  	echo "git pull " ${repo}
  	cd "${repo}"
  	git pull
  fi

  cd "${me}"
  i=$[i+1]

done

echo "done"

