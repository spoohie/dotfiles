# because i can
alias sudo="sudo "
alias kurwa="sudo"

# miscellaneous
alias e="subl"
alias f="find . -iname"
alias g="grep --color=always -Rni"
alias c="rsync -ah --info=progress2" # pretty copy
alias v="view"
alias diff="colordiff"
alias cur="cursor"
alias code="cursor"
alias code.="cursor ."
alias less="less -R"
t() { if [[ -z $1 ]]; then tree -h; else tree -hL $1; fi }

# ls
alias ll="eza -lah --icons"
alias lls="eza -lah --icons --total-size"

# cd
alias ..="cd .."
alias ...="cd ../.."

# tar
alias ltar="tar -ztvf"
alias untar="tar -zxvf"
alias ctar="tar -cvzf"

# git
alias gs="git status"
alias GS="git status"
alias ga="git add"
alias gu="git add -u"
alias gcm="git commit -m"
alias gcp="git cherry-pick"
alias gitl="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)'"
gdl() { curr="$(git rev-parse --abbrev-ref HEAD)"; if [ "$curr" = "$1" ]; then echo "Detaching..." && git checkout --detach; fi &&  git branch -D $1 && git push origin --delete $1}
#alias gitl="git log --all --graph --decorate --oneline"

# pyenv virtualenv
#alias lsv="pyenv virtualenvs"
#alias mkv="pyenv virtualenv"
#alias av="pyenv activate"
#alias dv="pyenv deactivate"

# venv
alias mkv="python3 -m venv .venv"
alias av="source .venv/bin/activate"
alias dv="deactivate"

# faster config files edit
alias ec="vim + ~/.zshrc"
alias sc="source ~/.zshrc"
alias ea="vim ~/repos/dotfiles/zsh/aliases.zsh"
