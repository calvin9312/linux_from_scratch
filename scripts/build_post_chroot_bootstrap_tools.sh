#/bin/bash

MODE="$1"

mkdir -p logs/build_post_chroot_bootstrap_tools

SCRIPT_ORIG_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_DIR="/mnt/lfs/linux_from_scratch"

BOOTSTRAP_SCRIPT_DIR="$SCRIPT_DIR/scripts/build_post_chroot_bootstrap_tools"

rm -rf $SCRIPT_DIR
cp -rf $SCRIPT_ORIG_DIR/../ $SCRIPT_DIR

source $SCRIPT_DIR/scripts/lfs_common.shrc


if [[ -n "$(inValidMode "gettext" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_gettext.sh" ; fi

if [[ -n "$(inValidMode "bison" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_bison.sh" ; fi

if [[ -n "$(inValidMode "perl" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_perl.sh" ; fi

if [[ -n "$(inValidMode "python" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_python.sh" ; fi

if [[ -n "$(inValidMode "texinfo" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_texinfo.sh" ; fi

if [[ -n "$(inValidMode "util_linux" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_util_linux.sh" ; fi
