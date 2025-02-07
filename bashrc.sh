#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/gcr/ssh"
export WHATSAPP_API="$(secret-tool lookup WA_TOKEN UBLE)"
export MY_PHONE_NUMBER="$(secret-tool lookup MY_PHONE NUMBER)"

alias zws-sync='(cd ~/src/zws && ./run.sh)'
alias cljs="clj -Sdeps '{:deps{org.clojure/clojurescript{:mvn/version\"1.11.132\"}}}' -M -m cljs.main -re node"

# alias ls='ls --color=auto'

git_branch() {
  GIT_STATUS="$(git status --porcelain 2> /dev/null)"
  (( $? == 0 )) || return
  [[ -z $GIT_STATUS ]] || return
  echo -n "$(git branch --show-current 2> /dev/null) "
}

git_branch_MOD() {
  GIT_STATUS="$(git status --porcelain 2> /dev/null)"
  (( $? == 0 )) || return
  [[ -z $GIT_STATUS ]] && return
  echo -n "$(git branch --show-current 2> /dev/null) "
}

C_GREEN='\[\e[1;32m\]'
C_RED='\[\e[1;31m\]'
C_BLUE='\[\e[1;34m\]'
C_WIPE='\[\e[0m\]'
PS1="\n[\${PIPESTATUS[@]} $C_BLUE\$(git_branch)$C_RED\$(git_branch_MOD)$C_WIPE$C_GREEN\w$C_WIPE \t]\n"
# PS1='[\u@\h \W]\$ '

