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
alias ec="v + ~/.zshrc"
alias sc="source ~/.zshrc"
alias ea="v ~/repos/dotfiles/zsh/aliases.zsh"

# ls -l (+ git status in repo) when ENTER
my-accept-line () {
    # check if the buffer does not contain any words
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
        # put newline so that the output does not start next
        # to the prompt
        echo
        # check if inside git repository
        if git rev-parse --git-dir > /dev/null 2>&1 ; then
            # if so, execute `git status' and `ls'
        ls -l
        echo ""
            git status
        else
            # else run `ls'
            ls -l
        fi
    fi
    # in any case run the `accept-line' widget
    zle accept-line
}
