#/bin/bash

source $(dirname $(readlink -e ${BASH_SOURCE[0]}))/setup.shrc $(basename ${BASH_SOURCE[0]}) Y $@

BOOTSTRAP_SCRIPT_DIR="$LFS_REPO_DIR/scripts/build_pre_chroot_bootstrap_tools"

if [[ -n "$(inValidMode "binutils_pass1" "$MODE")" ]] ; then echo "STARTING BUILD BINUTILS_PASS1" ; $BOOTSTRAP_SCRIPT_DIR/build_binutils_pass1.sh ; echo "FINISHED BUILD BINUTILS_PASS1" ; fi

if [[ -n "$(inValidMode "gcc_pass1" "$MODE")" ]] ; then echo "STARTING BUILD GCC_PASS1" ; $BOOTSTRAP_SCRIPT_DIR/build_gcc_pass1.sh ; echo "FINISHED BUILD GCC_PASS1" ; fi

if [[ -n "$(inValidMode "linux_headers" "$MODE")" ]] ; then echo "STARTING BUILD LINUX_HEADERS" ; $BOOTSTRAP_SCRIPT_DIR/build_linux_headers.sh ; echo "FINISHED BUILD LINUX_HEADERS" ; fi

if [[ -n "$(inValidMode "glibc" "$MODE")" ]] ; then echo "STARTING BUILD GLIBC" ; $BOOTSTRAP_SCRIPT_DIR/build_glibc.sh ; echo "FINISHED BUILD GLIBC" ; fi

if [[ -n "$(inValidMode "libstdc++" "$MODE")" ]] ; then echo "STARTING BUILD LIBSTDC++" ; $BOOTSTRAP_SCRIPT_DIR/build_libstdc++.sh ; echo "FINISHED BUILD LIBSTDC++" ; fi


if [[ -n "$(inValidMode "m4" "$MODE")" ]] ; then echo "STARTING BUILD M4" ; $BOOTSTRAP_SCRIPT_DIR/build_m4.sh ; echo "FINISHED BUILD M4" ; fi

if [[ -n "$(inValidMode "ncurses" "$MODE")" ]] ; then echo "STARTING BUILD NCURSES" ; $BOOTSTRAP_SCRIPT_DIR/build_ncurses.sh ; echo "FINISHED BUILD NCURSES" ; fi

if [[ -n "$(inValidMode "bash" "$MODE")" ]] ; then echo "STARTING BUILD BASH" ; $BOOTSTRAP_SCRIPT_DIR/build_bash.sh ; echo "FINISHED BUILD BASH" ; fi

if [[ -n "$(inValidMode "coreutils" "$MODE")" ]] ; then echo "STARTING BUILD COREUTILS" ; $BOOTSTRAP_SCRIPT_DIR/build_coreutils.sh ; echo "FINISHED BUILD COREUTILS" ; fi

if [[ -n "$(inValidMode "diffutils" "$MODE")" ]] ; then echo "STARTING BUILD DIFFUTILS" ; $BOOTSTRAP_SCRIPT_DIR/build_diffutils.sh ; echo "FINISHED BUILD DIFFUTILS" ; fi

if [[ -n "$(inValidMode "file" "$MODE")" ]] ; then echo "STARTING BUILD FILE" ; $BOOTSTRAP_SCRIPT_DIR/build_file.sh ; echo "FINISHED BUILD FILE" ; fi

if [[ -n "$(inValidMode "findutils" "$MODE")" ]] ; then echo "STARTING BUILD FINDUTILS" ; $BOOTSTRAP_SCRIPT_DIR/build_findutils.sh ; echo "FINISHED BUILD FINDUTILS" ; fi

if [[ -n "$(inValidMode "gawk" "$MODE")" ]] ; then echo "STARTING BUILD GAWK" ; $BOOTSTRAP_SCRIPT_DIR/build_gawk.sh ; echo "FINISHED BUILD GAWK" ; fi

if [[ -n "$(inValidMode "grep" "$MODE")" ]] ; then echo "STARTING BUILD GREP" ; $BOOTSTRAP_SCRIPT_DIR/build_grep.sh ; echo "FINISHED BUILD GREP" ; fi

if [[ -n "$(inValidMode "gzip" "$MODE")" ]] ; then echo "STARTING BUILD GZIP" ; $BOOTSTRAP_SCRIPT_DIR/build_gzip.sh ; echo "FINISHED BUILD GZIP" ; fi

if [[ -n "$(inValidMode "make" "$MODE")" ]] ; then echo "STARTING BUILD MAKE" ; $BOOTSTRAP_SCRIPT_DIR/build_make.sh ; echo "FINISHED BUILD MAKE" ; fi

if [[ -n "$(inValidMode "patch" "$MODE")" ]] ; then echo "STARTING BUILD PATCH" ; $BOOTSTRAP_SCRIPT_DIR/build_patch.sh ; echo "FINISHED BUILD PATCH" ; fi

if [[ -n "$(inValidMode "sed" "$MODE")" ]] ; then echo "STARTING BUILD SED" ; $BOOTSTRAP_SCRIPT_DIR/build_sed.sh ; echo "FINISHED BUILD SED" ; fi

if [[ -n "$(inValidMode "tar" "$MODE")" ]] ; then echo "STARTING BUILD TAR" ; $BOOTSTRAP_SCRIPT_DIR/build_tar.sh ; echo "FINISHED BUILD TAR" ; fi

if [[ -n "$(inValidMode "xz" "$MODE")" ]] ; then echo "STARTING BUILD XZ" ; $BOOTSTRAP_SCRIPT_DIR/build_xz.sh ; echo "FINISHED BUILD XZ" ; fi

if [[ -n "$(inValidMode "binutils_pass2" "$MODE")" ]] ; then echo "STARTING BUILD BINUTILS_PASS2" ; $BOOTSTRAP_SCRIPT_DIR/build_binutils_pass2.sh ; echo "FINISHED BUILD BINUTILS_PASS2" ; fi

if [[ -n "$(inValidMode "gcc_pass2" "$MODE")" ]] ; then echo "STARTING BUILD GCC_PASS2" ; $BOOTSTRAP_SCRIPT_DIR/build_gcc_pass2.sh ; echo "FINISHED BUILD GCC_PASS2" ; fi
