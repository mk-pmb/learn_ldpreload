#!/bin/bash
# -*- coding: utf-8, tab-width: 2 -*-


function build_and_test () {
  export LANG{,UAGE}=en_US.UTF-8  # make error messages search engine-friendly
  local SELFPATH="$(readlink -m -- "$BASH_SOURCE"/..)"
  cd -- "$SELFPATH" || return $?

  compile hello.elf   || return $?
  compile argdump.so  || return $?
  echo
  LD_PRELOAD="$PWD"/argdump.so ./hello.elf foo bar qux
}


function compile () {
  local DEST="$1"; shift
  rm -- "$DEST" 2>/dev/null
  local SRC="${DEST%.*}".cpp
  local GCC_CMD=(
    g++
    -Wall
    )
  case "$DEST" in
    *.so )
      GCC_CMD+=(
        -shared
        -Wl,--no-as-needed  # https://github.com/rofl0r/proxychains-ng/pull/65
        -fPIC
        -ldl
        )
      ;;
  esac
  GCC_CMD+=(
    -o "$DEST"
    "$SRC"
    )
  echo "D: ${GCC_CMD[*]}"
  "${GCC_CMD[@]}" || return $?
  echo -n 'D: SHA-1: '; sha1sum --binary "$DEST" || return $?
}










build_and_test "$@"; exit $?
