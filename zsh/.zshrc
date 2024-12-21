# Set up the prompt
autoload -Uz promptinit
promptinit

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

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

plugins=(git fzf)
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
eval "$(fzf --zsh)"

# Use modern completion system
autoload -Uz compinit
compinit

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

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh
source <(fzf --zsh)

zplug "yous/vanilli.sh"

zplug "$DOTFILES/zsh", use:"{aliases,my-accept-line,up}.zsh", from:local
zplug "~/graphyte-repos/scripts", use:"aliases.zsh", from:local
zplug load

bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' emacs-forward-word

export PATH=$HOME/repos/scripts:$PATH

# zsh-z
source $DOTFILES/zsh/zsh-z.plugin.zsh
autoload -U compinit && compinit
zstyle ':completion:*' menu select

# my-accept-line
# my-accept-line, `^M' is enter
# bindkey '^M' my-accept-line


# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export HOMEBREW_NO_AUTO_UPDATE=1

PATH=$PATH:$HOME/.local/bin

export VIRTUAL_ENV_DISABLE_PROMPT=1

# Dotfiles path
export REPOS=$HOME/repos
export DOTFILES=$REPOS/dotfiles

# Ensure a symlink to dotfiles exists in Shared dir
if [[ ! -L /Users/Shared/dotfiles && ! -e /Users/Shared/dotfiles ]]; then
  ln -s "$HOME/repos/dotfiles" /Users/Shared/dotfiles
fi
