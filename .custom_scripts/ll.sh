#!/bin/bash

unalias ll 2>/dev/null

function ll() {
  is_ls=true
  file='.'
  if [[ ! -z "$1" ]]; then
    file=$1
    if [[ -f "$1" ]]; then
      is_ls=false
    fi
  fi
  if [[ "$is_ls" = true ]]; then
    ls -1A $file
  else
    cat $file
  fi
}
