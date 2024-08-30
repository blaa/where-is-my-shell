#!/bin/bash

echo "Doing user install in 3 seconds. Some system packages are required (zsh, zstd, ...)"
sleep 3

FILES=$(dirname $0)/files/

SKEL="bash_logout bashrc screenrc tmux.conf vimrc zshenv zshrc"

echo "Replace repositories in /etc"
rm -rf ~/.oh-my-zsh ~/.zsh_zaw ~/.zsh-zaw
tar -axf $FILES/oh-my-zsh.tar.zst -C ~
mv ~/oh-my-zsh ~/.oh-my-zsh
mv ~/zsh-zaw ~/.zsh-zaw

echo "Install shell files"
for filename in $SKEL;
do
	cp -R -v $FILES/shell/$filename ~/.${filename}
done

mkdir -p ~/.vim
mv $FILES/shell/vim/colors ~/.vim/

sed -i 's,/etc/oh-my-zsh,$HOME/.oh-my-zsh,g' ~/.zshrc
sed -i 's,/etc/zsh-zaw,$HOME/.zsh-zaw,g' ~/.zshrc

echo Done
