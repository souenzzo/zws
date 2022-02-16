#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
alias status='systemctl --user status'
alias restart='systemctl --user restart'
alias fofoca='journalctl --user -f'
