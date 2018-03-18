#!/bin/bash

echo "Overwriting your dot-files from /etc/skel in 2 seconds"
sleep 2

{% for file in shell_files %}
cp -Rv /etc/skel/.{{ file }} ~/
{% endfor %}

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
