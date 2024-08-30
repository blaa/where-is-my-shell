#!/bin/bash
if [ $(id -u) -ne 0 ]; then
	echo This requires root
	exit 1
fi

echo "Doing system-wide install in 3 seconds. Some packages might be installed. Assumes Debian/Ubuntu."
sleep 3


FILES=$(dirname $0)/files/

SKEL="bash_logout bashrc screenrc tmux.conf vimrc zshenv zshrc"

# Trying apt-get on Debian
# Basic and required packages.
apt-get install -y zsh tmux iotop ifstat sysstat zstd fzf ripgrep iftop psmisc
# Additional packages
apt-get install -y debsums atop htop strace ranger neovim bc git pwgen age lsof nethogs

echo "Replace repositories in /etc"
rm -rf /etc/oh-my-zsh /etc/zsh_zaw /etc/zsh-zaw
tar -axf $FILES/oh-my-zsh.tar.zst -C /etc

chown root:root /etc/oh-my-zsh /etc/zsh-zaw -R
chmod o-w,g-w /etc/oh-my-zsh /etc/zsh-zaw -R

echo "Install files in /etc/skel"
for filename in $SKEL;
do
	cp -R -v $FILES/shell/$filename /etc/skel/.${filename}
done

mkdir -p /etc/skel/.vim
cp -R -v $FILES/shell/vim/colors /etc/skel/.vim/

cp $FILES/where-is-my-shell.sh /usr/local/bin/where-is-my-shell.sh
chmod a+x /usr/local/bin/where-is-my-shell.sh

echo Done
