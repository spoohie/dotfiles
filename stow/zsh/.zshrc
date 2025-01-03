# Environment variables
export HOMEBREW_NO_AUTO_UPDATE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1
export PYENV_VIRTUALENV_DISABLE_PROMPT=true

# Path modifications
PATH=$PATH:$HOME/.local/bin
PATH=$REPOS/scripts:$PATH

# History settings
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh_history
HISTORY_IGNORE="(ls|cd|pwd|exit|cd|gcm|gs|gu|lls|rm)*"

# History opts
setopt APPEND_HISTORY             # append to history file (Default)
setopt EXTENDED_HISTORY           # Write the history file in the ':start:elapsed;command' format.
setopt HIST_IGNORE_ALL_DUPS       # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS           # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE          # Do not record an event starting with a space.
setopt HIST_NO_STORE              # Don't store history commands
setopt HIST_REDUCE_BLANKS         # Remove superfluous blanks from each command line being added to the history.
setopt HIST_SAVE_NO_DUPS          # Do not write a duplicate event to the history file.
setopt HIST_VERIFY                # Do not execute immediately upon history expansion.
setopt histignorealldups sharehistory  # Enable history deduplication and sharing between sessions
setopt INC_APPEND_HISTORY         # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY              # Share history between all sessions.

# General opts
setopt auto_cd                    # auto cd if command is a directory name
setopt LIST_PACKED                # Completions menu compacted
setopt MENU_COMPLETE              # Automatically highlight first element of completion menu
setopt AUTO_LIST                  # Automatically list choices on ambiguous completion.

# Tool initialization
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source $HOMEBREW_PREFIX/opt/zinit/zinit.zsh
source <(fzf --zsh)

# Completion system
autoload -Uz compinit && compinit

# AWS completion system
autoload -U +X bashcompinit && bashcompinit
complete -C $HOMEBREW_PREFIX/bin/aws_completer aws

# Zinit plugins and snippets
# zinit light yous/vanilli.sh
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

# Main completion settings
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' menu no
# zstyle ':completion:*' verbose true

# Completion cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Completion styling
zstyle ':fzf-tab:*' continuous-trigger "right"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Bindings
bindkey "^k" up_widget # UP with Cmd+K
