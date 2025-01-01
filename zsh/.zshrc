# Set up the prompt
autoload -Uz promptinit
promptinit

setopt histignorealldups sharehistory

HISTSIZE=10000000
SAVEHIST=10000000
HISTORY_IGNORE="(ls|cd|pwd|exit|cd|gcm|gs|gu|lls|rm)*"
HISTFILE=~/.zsh_history

setopt EXTENDED_HISTORY      # Write the history file in the ':start:elapsed;command' format.
setopt INC_APPEND_HISTORY    # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY         # Share history between all sessions.
setopt HIST_IGNORE_DUPS      # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS  # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_SPACE     # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS     # Do not write a duplicate event to the history file.
setopt HIST_VERIFY           # Do not execute immediately upon history expansion.
setopt APPEND_HISTORY        # append to history file (Default)
setopt HIST_NO_STORE         # Don't store history commands
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks from each command line being added to the history.

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

eval "$(starship init zsh)"

source $HOMEBREW_PREFIX/opt/zinit/zinit.zsh

export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
source <(fzf --zsh)

zinit light yous/vanilli.sh

zinit snippet $DOTFILES/zsh/my-accept-line.zsh
zinit snippet $DOTFILES/zsh/up.zsh

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' emacs-forward-word

# Use modern completion system
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select

# my-accept-line
# my-accept-line, `^M' is enter
# bindkey '^M' my-accept-line

export HOMEBREW_NO_AUTO_UPDATE=1

PATH=$PATH:$HOME/.local/bin

export VIRTUAL_ENV_DISABLE_PROMPT=1

# Ensure a symlink to dotfiles exists in Shared dir
if [[ ! -L /Users/Shared/dotfiles && ! -e /Users/Shared/dotfiles ]]; then
  ln -s $DOTFILES /Users/Shared/dotfiles
fi

eval "$(zoxide init zsh)"