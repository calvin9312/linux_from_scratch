#/bin/bash

MODE="$1"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_TMP_DIR="/tmp/linux_from_scratch"

rm -rf $SCRIPT_TMP_DIR
cp -rf $SCRIPT_DIR/../ $SCRIPT_TMP_DIR

source $SCRIPT_TMP_DIR/scripts/lfs_common.shrc

if [[ -n "$(inValidMode "binutils" "$MODE")" ]]
then
	sudo su lfs -c "$SCRIPT_TMP_DIR/scripts/build_bootstrap_tools/build_binutils.sh"
fi

if [[ -n "$(inValidMode "gcc" "$MODE")" ]]
then
	sudo su lfs -c "$SCRIPT_TMP_DIR/scripts/build_bootstrap_tools/build_gcc.sh"
fi

if [[ -n "$(inValidMode "linux_headers" "$MODE")" ]]
then
	sudo su lfs -c "$SCRIPT_TMP_DIR/scripts/build_bootstrap_tools/build_linux_headers.sh"
fi

if [[ -n "$(inValidMode "glibc" "$MODE")" ]]
then
	sudo su lfs -c "$SCRIPT_TMP_DIR/scripts/build_bootstrap_tools/build_glibc.sh"
fi

if [[ -n "$(inValidMode "libstdc++" "$MODE")" ]]
then
	sudo su lfs -c "$SCRIPT_TMP_DIR/scripts/build_bootstrap_tools/build_libstdc++.sh"
fi

