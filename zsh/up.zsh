function up_widget() {
  BUFFER=".."
  zle accept-line
}

zle -N up_widget
bindkey "^k" up_widget
