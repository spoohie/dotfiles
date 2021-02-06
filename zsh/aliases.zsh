# because i can
alias sudo="sudo "
alias kurwa="sudo"

# miscellaneous
alias v="vim"
alias f="find . -iname"
alias g="grep --color=always -Rni"
alias c="rsync -ah --info=progress2" # pretty copy

# ls
alias ls="ls --color=auto"
alias l="ls -l"
alias ll="ls -lA"
alias lt="ls --human-readable --size -1 -S --classify" # sort by size (human-readable)

# cd
alias ..="cd .."
alias ...="cd ../.."

# git
alias gs="git status"
alias ga="git add -u"
alias gcm="git commit -m"
alias gitl="git log --graph --decorate --oneline"

# docker
alias d="docker"
alias dps="docker ps"

# faster config files edit
alias ec="v + $HOME/.zshrc"
alias sc="source $HOME/.zshrc"
alias ea="v $HOME/repos/dotfiles/zsh/aliases.zsh"
