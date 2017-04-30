#!/bin/bash

echo "Copying files from skel in 2 seconds"
sleep 2

{% for file in shell_files %}
cp -Rv /etc/skel/.{{ file }} ~/
{% endfor %}

if [ -f /bin/zsh ]; then
    echo "Setting zsh as a shell for current user"
    chsh -s /bin/zsh
else
    echo "ZSH not found - not switching"
fi
