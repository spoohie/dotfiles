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

# History options
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

# Completion system
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# Completion styling
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=2
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# Process completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Add aws completion
# autoload -U +X bashcompinit && bashcompinit
# complete -C '/opt/homebrew/bin/aws_completer' aws

# auto cd if command is a directory name
setopt auto_cd

# Tool initialization
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source $HOMEBREW_PREFIX/opt/zinit/zinit.zsh
source <(fzf --zsh)

# fzf completion
source $DOTFILES/zsh/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
bindkey '^I' fzf_completion
# press ctrl-r to repeat completion *without* accepting i.e. reload the completion
# press right to accept the completion and retrigger it
# press alt-enter to accept the completion and run it
keys=(
    ctrl-r:'repeat-fzf-completion'
    right:accept:'repeat-fzf-completion'
    alt-enter:accept:'zle accept-line'
)

zstyle ':completion:*' fzf-completion-keybindings "${keys[@]}"
# also accept and retrigger completion when pressing / when completing cd
zstyle ':completion::*:cd:*' fzf-completion-keybindings "${keys[@]}" /:accept:'repeat-fzf-completion'

# Zinit plugins and snippets
zinit light yous/vanilli.sh
zinit snippet $DOTFILES/zsh/my-accept-line.zsh

# Bindings
bindkey "^k" up_widget