alias ls="ls -F --color"
alias l="ls -lAh --color"
alias ll="ls -l --color"
alias la='ls -A --color'
alias e='emacsclient -n'
alias m='less'
alias j='jobs'
alias pd='pushd .'
alias pop='popd'
alias ack="ack-grep --pager='less -R'"
alias gdb='gdb -q'
alias dups='find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 sha1sum | sort | uniq -w64'
alias disas='llvm-objdump-3.5 -disassemble -s -t'
alias show_relocations='llvm-readobj-3.5 -relocations'
