#!/bin/bash

name=$1
email=$2

if [ -z "$name" ]; then
echo "####### wranning #######"
echo "input name or e-mail address"
exit 0
fi

if [ "$name" = "-h" ]; then
echo "usage: ./gpconf.sh name e-email"
exit 0
fi

if [ -z $email ]; then
echo "####### wranning #######"
echo "input name or e-mail address"
fi

target=$3
if [ -z $target ]; then
target=$(pwd)
fi
me=$(pwd)

rnames=( 
"github"
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
    echo "ignore"
  else
  	echo "setting git config " ${repo}
  	cd "${repo}"
	git config --unset-all user.name
        git config --unset-all user.email
  	git config user.name "$name"
	git config user.email "$email"
  fi

  cd "${me}"

done

echo "done"

