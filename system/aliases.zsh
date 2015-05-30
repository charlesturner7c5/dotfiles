# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias l="gls -lAh --color"
  alias ll="gls -l --color"
  alias la='gls -A --color'
  # TODO: alias find to GNU find
fi

alias e='emacsclient -n'
alias m='more'
alias j='jobs'
alias pd='pushd .'
alias pop='popd'
alias ack="ack-grep --pager='less -R'"
alias gdb='gdb -q'
alias dups='find -not -empty -type f -printf "%s\n" | sort -rn | uniq -d | xargs -I{} -n1 find -type f -size {}c -print0 | xargs -0 sha1sum | sort | uniq -w64'
alias disas='llvm-objdump-3.5 -disassemble -s -t'
alias show_relocations='llvm-readobj-3.5 -relocations'
