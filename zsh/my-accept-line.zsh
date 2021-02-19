# ls -l (+ git status in repo) when ENTER
my-accept-line () {
    # check if the buffer does not contain any words
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
        # put newline so that the output does not start next
        # to the prompt
        echo
        # check if inside git repository
        if git rev-parse --git-dir > /dev/null 2>&1 ; then
            # if so, execute `git status'
            git status
	    ls -l
        else
            # else run `ls'
            ls -l
        fi
    fi
    # in any case run the `accept-line' widget
    zle accept-line
}

zle -N my-accept-line
