#!/bin/bash

set -e

current_dir=$(realpath $(dirname $0))
rm -rf output

# parse args from cmdline key=value
for i in $*;
do
	[[ ! "$i" =~ .*=+.* ]] && continue
	key=$(echo $i | cut -d= -f1  | tr -d '[:space:]')
	val=$(echo $i | cut -d= -f2- | tr -d '[:space:]')
	eval export $key=\"$val\"
done
# args parse end.

test "X${target}" = "X" && export target=${BOARD}

echo BOARD:$BOARD
echo target:$target

cmake -S . -B output \
	-DBOARD=${BOARD} \
	-DPROJECT_NAME=${BOARD} \
	-DCMAKE_TOOLCHAIN_FILE=${current_dir}/cmake/toolschain/${BOARD}_gcc.cmake

cmake --build output --target ${target}
