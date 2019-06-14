# Environment
setopt COMBINING_CHARS
setopt INTERACTIVE_COMMENTS

# Directory
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME
setopt CDABLE_VARS
setopt MULTIOS
setopt EXTENDED_GLOB
unsetopt CLOBBER

# History
setopt BANG_HIST
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt HIST_BEEP

export HISTFILE=$HOME/.zhistory
export HISTSIZE=10000
export SAVEHIST=$HISTSIZE

# Keybindings
bindkey -e
bindkey "^[^[[D" backward-word         # [Option] + [Left]
bindkey "^[^[[C" forward-word          # [Option] + [Right]

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

# Load aliases
[[ -f ~/.aliases ]] && source ~/.aliases
