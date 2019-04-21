#!/bin/bash

if [ $(id -u) -ne 0 ]; then
	echo This requires root
	exit 1
fi

echo "This script does dumb, ansible-less install. Prefer the ansible if possible"
sleep 3

ROLE=roles/shell
FILES=$ROLE/files

SKEL="bash_logout bashrc screenrc tmux.conf vimrc zshenv zshrc"

# Trying apt-get on Debian
apt-get install -y zsh tmux screen atop iotop htop lnav ifstat sysstat ranger strace

echo "Replace repositories in /etc"
rm -rf /etc/oh-my-zsh /etc/zsh_zaw
tar -Jxf $FILES/oh-my-zsh.tar.xz -C /etc

chown root:root /etc/oh-my-zsh /etc/zsh_zaw -R
chmod o-w,g-w /etc/oh-my-zsh /etc/zsh_zaw -R

echo "Install files in /etc/skel"
for filename in $SKEL;
do
	cp -v $FILES/shell/$filename /etc/skel/.${filename}
done

cat > /usr/local/bin/where-is-my-shell.sh <<EOF
#!/bin/bash

echo "Overwriting your dot-files from /etc/skel in 2 seconds"
sleep 2

cp -v /etc/skel/.bash_logout ~/
cp -v /etc/skel/.bashrc ~/
cp -v /etc/skel/.screenrc ~/
cp -v /etc/skel/.tmux.conf ~/
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
EOF


echo Done
