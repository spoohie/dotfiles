ln -s "$(pwd)/.vimrc" ~
ln -s "$(pwd)/.bash_settings" ~
ln -s "$(pwd)/.bash_aliases" ~

echo -e "\nif [ -f ~/.bash_settings ]; then\n    . ~/.bash_settings\nfi" >> ~/.bashrc

source ~/.bashrc

