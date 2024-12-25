# ll (+ git status in repo) when ENTER
my-accept-line () {
    # check if the buffer does not contain any words
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
        # put newline so that the output does not start next to the prompt
        echo

        ll --no-permissions --octal-permissions --no-user
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
