#!/bin/bash

# Update date: 2024-08-30

echo "Overwriting your dot-files from /etc/skel in 2 seconds"
sleep 2

cp -v /etc/skel/.bash_logout ~/
cp -v /etc/skel/.bashrc ~/
cp -v /etc/skel/.screenrc ~/
cp -v /etc/skel/.tmux.conf ~/
cp -v /etc/skel/.vim ~/ -R
cp -v /etc/skel/.vimrc ~/
cp -v /etc/skel/.zshenv ~/
cp -v /etc/skel/.zshrc ~/

CURRENT_SHELL=$(getent passwd $UID | awk -F: '{ print $7 }')

if [ ! -f /bin/zsh ]; then
    echo "WARNING: zsh doesn't seem to be installed"
    exit 1
fi

if [ "$CURRENT_SHELL" == "/bin/zsh" ]; then
    echo "Zsh is already your shell"
    exit 0
fi

echo "Setting zsh as a shell for current user - you will be asked for your password"
chsh -s /bin/zsh

