# because i can
alias sudo="sudo "
alias kurwa="sudo"

# miscellaneous
alias e="vim"
alias f="find . -iname"
alias g="grep --color=always -Rni"
alias c="rsync -ah --info=progress2" # pretty copy
alias v="view"
alias diff="colordiff"
alias clock="sudo hwclock --hctosys"
alias code.="code ."
alias less="less -R"
t() { if [[ -z $1 ]]; then tree -h; else tree -hL $1; fi }

# ls
alias ls="ls -h --color=auto"
alias l="ls -l"
alias ll="ls -lA"
alias lt="ls --human-readable --size -1 -S --classify" # sort by size (human-readable)

# cd
alias ..="cd .."
alias ...="cd ../.."

# tar
alias ltar="tar -ztvf"
alias untar="tar -zxvf"
alias ctar="tar -cvzf"

# git
alias gs="git status"
alias ga="git add -u"
alias gcm="git commit -m"
alias gcp="git cherry-pick"
alias gitl="git log --all --graph --decorate --oneline"

# virtualenvwrapper
alias lsv="lsvirtualenv"
alias mkv="mkvirtualenv"
alias cv="workon"
alias dv="deactivate"

# docker
alias d="docker"
alias dps="docker ps"
alias dc="docker-compose"
alias dcr="dc down && dc up"

# faster config files edit
alias ec="vim + ~/.zshrc"
alias sc="source ~/.zshrc"
alias ea="vim ~/repos/dotfiles/zsh/aliases.zsh"
