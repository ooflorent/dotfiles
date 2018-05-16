# Directory options
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt EXTENDED_GLOB
setopt MULTIOS
unsetopt CLOBBER

# History options
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000
setopt EXTENDED_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Keybindings
bindkey -e
bindkey "^[^[[D" backward-word         # alt-left
bindkey "^[^[[C" forward-word          # alt-right
bindkey "^[^?" backward-kill-word      # alt-backspace

# Enable colors
alias grep="grep --color=auto"
alias less="less -R"
alias ls="ls -FG"

# Utilities
alias ll="ls -lh"
alias la="ll -A"

# Safeguards
alias cp="cp -i"
alias ln="ln -i"
alias mv="mv -i"
alias rm="rm -i"

# Completion
# setopt ALWAYS_TO_END
# setopt PATH_DIRS
# unsetopt CASE_GLOB
# unsetopt LIST_BEEP
# zstyle ':completion:*:*:cd:*:directory-stack' force-list always
# zstyle ':completion:*:*:cd:*:directory-stack' menu yes select

# Prompt
setopt PROMPT_SUBST
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' use-simple true
zstyle ':vcs_info:*' stagedstr '✚'
zstyle ':vcs_info:*' unstagedstr '*'
zstyle ':vcs_info:git*' formats ' %b%u%c'
zstyle ':vcs_info:git*' actionformats ' %b|%a'

precmd() { vcs_info }

PROMPT='%c%F{242}${vcs_info_msg_0_}%f %(?.%F{blue}.%F{red})%#%f '
RPROMPT=''
