# miscellaneous
alias v="vim"
alias f="find . -iname"
alias g="grep --color=always -Rni"
alias cpv="rsync -ah --info=progress2" # pretty copy

# ls
alias ls="ls --color=auto"
alias ll="ls -la"
alias lt="ls --human-readable --size -1 -S --classify" # sort by size (human-readable)

# cd on steroids
alias ..="cd .."
alias ...="cd ../.."

# git
alias gs="git status"
alias gcm="git commit -m"
alias gitl="git log --graph --decorate --oneline"

# docker aliases
alias d="docker"
alias dps="docker ps"

# faster config files edit
alias ec="v $HOME/.zshrc"
alias sc="source $HOME/.zshrc"
alias ea="v $HOME/repos/dotfiles/zsh/aliases.zsh"
