if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt NO_BG_NICE # don't nice background tasks
setopt NO_HUP
setopt NO_LIST_BEEP
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps
setopt HIST_VERIFY
setopt SHARE_HISTORY # share history between sessions ???
setopt EXTENDED_HISTORY # add timestamps to history
setopt PROMPT_SUBST
setopt CORRECT
setopt COMPLETE_IN_WORD
setopt IGNORE_EOF

setopt APPEND_HISTORY # adds history
setopt INC_APPEND_HISTORY SHARE_HISTORY  # adds history incrementally and share it across sessions
setopt HIST_IGNORE_ALL_DUPS  # don't record dupes in history
setopt HIST_REDUCE_BLANKS

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

autoload -U zsh-mime-setup
zsh-mime-setup

# Outside TMUX, these are the correct bindings
# for C-Right, C-Left.
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
# Inside TMUX, these are the correct bindings,
# bindkey '^[[C' forward-word
# bindkey '^[[D' backward-word
# TODO: How to I select which ones to pick based on whether
# I'm in TMUX or not?

bindkey '^A' beginning-of-line
bindkey '^E' end-of-line
bindkey '^[[3~' delete-char
# TODO: What is this?
zle -N newtab
bindkey '^[^N' newtab
bindkey '^?' backward-delete-char

autoload replace-string
zle -N replace-string
zle -N replace-pattern replace-string
bindkey '^[%' replace-pattern

function create_new_gerrit_branch() {
    local br_name=$(git rev-parse --abbrev-ref HEAD)
    git push origin HEAD:review/$br_name
}

function delete_gerrit_branch() {
    local br_name=$(git rev-parse --abbrev-ref HEAD)
    git push origin --delete review/$br_name
}

function push_to_gerrit() {
    local br_name=$(git rev-parse --abbrev-ref HEAD)
    git push origin HEAD:refs/for/review/$br_name
}
