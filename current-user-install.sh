#!/bin/bash

echo "This script does dumb, user-local, ansible-less install. Prefer the system-wide ansible if possible"
sleep 3

ROLE=roles/shell
FILES=$ROLE/files

SKEL="bash_logout bashrc screenrc tmux.conf vimrc zshenv zshrc"

echo "Replace repositories in /etc"
rm -rf ~/.oh-my-zsh ~/.zsh_zaw
tar -Jxf $FILES/oh-my-zsh.tar.xz -C ~
mv ~/oh-my-zsh ~/.oh-my-zsh
mv ~/zsh_zaw ~/.zsh_zaw

echo "Install shell files"
for filename in $SKEL;
do
	cp -v $FILES/shell/$filename ~/.${filename}
done

sed -i 's,/etc/oh-my-zsh,$HOME/.oh-my-zsh,g' ~/.zshrc
sed -i 's,/etc/zsh_zaw,$HOME/.zsh_zaw,g' ~/.zshrc

echo Done
