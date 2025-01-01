# Custom paths
export REPOS=$HOME/repos
export DOTFILES=$REPOS/dotfiles
export PATH=$REPOS/scripts:$PATH

# Aliases
# because i can
alias sudo="sudo "
alias kurwa="sudo"

# ls
alias l="ls -laG"
alias ll="eza -lah --icons"
alias lls="eza -lah --icons --total-size -s size"

# cd
alias ..="cd .."
alias ...="cd ../.."

# miscellaneous
alias e="subl"
alias f="find . -iname"
alias g="grep --color=always -Rni"
alias c="rsync -ah --info=progress2" # pretty copy
alias v="view"
alias diff="colordiff"
alias less="less -R"
alias cat="bat"
t() { if [[ -z $1 ]]; then tree -h; else tree -hL $1; fi }

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

# python
alias p="python"
alias p3="python"

# venv
alias mkv="python3 -m venv .venv"
alias av="source .venv/bin/activate"
alias dv="deactivate"

# IDE
alias cur="cursor"
alias code="cursor"
alias code.="cursor ."

# faster config files edit
alias ec="vim + ~/.zshrc"
alias sc="source ~/.zshrc"
alias ea="vim + ~/.zshenv"

# Up widget
function up_widget() {
  BUFFER=".."
  zle accept-line
}

zle -N up_widget

# my-accept-line
# ll (+ git status in repo) when ENTER
my-accept-line () {
    # check if the buffer does not contain any words
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
        # put newline so that the output does not start next to the prompt
        echo

        eza --no-permissions --no-user
        # check if inside git repository
        if git rev-parse --git-dir > /dev/null 2>&1 ; then
            echo
            # if so, execute `git status'
            git status -sb --untracked-files=no
        fi
    fi
    # in any case run the `accept-line' widget
    zle accept-line
}
zle -N my-accept-line
