#/bin/bash

MODE="$1"

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SCRIPT_TMP_DIR="/tmp/linux_from_scratch"
BOOTSTRAP_SCRIPT_DIR="$SCRIPT_TMP_DIR/scripts/build_pre_chroot_bootstrap_tools"

rm -rf $SCRIPT_TMP_DIR
cp -rf $SCRIPT_DIR/../ $SCRIPT_TMP_DIR

source $SCRIPT_TMP_DIR/scripts/lfs_common.shrc

if [[ -n "$(inValidMode "binutils_pass1" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_binutils_pass1.sh" ; fi

if [[ -n "$(inValidMode "gcc_pass1" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_gcc_pass1.sh" ; fi

if [[ -n "$(inValidMode "linux_headers" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_linux_headers.sh" ; fi

if [[ -n "$(inValidMode "glibc" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_glibc.sh" ; fi

if [[ -n "$(inValidMode "libstdc++" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_libstdc++.sh" ; fi


if [[ -n "$(inValidMode "m4" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_m4.sh" ; fi

if [[ -n "$(inValidMode "ncurses" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_ncurses.sh" ; fi

if [[ -n "$(inValidMode "bash" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_bash.sh" ; fi

if [[ -n "$(inValidMode "coreutils" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_coreutils.sh" ; fi

if [[ -n "$(inValidMode "diffutils" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_diffutils.sh" ; fi

if [[ -n "$(inValidMode "file" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_file.sh" ; fi

if [[ -n "$(inValidMode "findutils" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_findutils.sh" ; fi

if [[ -n "$(inValidMode "gawk" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_gawk.sh" ; fi

if [[ -n "$(inValidMode "grep" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_grep.sh" ; fi

if [[ -n "$(inValidMode "gzip" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_gzip.sh" ; fi

if [[ -n "$(inValidMode "make" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_make.sh" ; fi

if [[ -n "$(inValidMode "patch" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_patch.sh" ; fi

if [[ -n "$(inValidMode "sed" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_sed.sh" ; fi

if [[ -n "$(inValidMode "tar" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_tar.sh" ; fi

if [[ -n "$(inValidMode "xz" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_xz.sh" ; fi

if [[ -n "$(inValidMode "binutils_pass2" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_binutils_pass2.sh" ; fi

if [[ -n "$(inValidMode "gcc_pass2" "$MODE")" ]] ; then sudo su lfs -c "$BOOTSTRAP_SCRIPT_DIR/build_gcc_pass2.sh" ; fi
