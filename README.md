Unified shell configurator
==========================

Configures a shell environment:
- offline copy of oh-my-zsh 
  https://github.com/robbyrussell/oh-my-zsh - MIT License
  installed system-wide in /etc/oh-my-zsh
- tmux, screen, git, vim (packages and configuration)
- /usr/local/bin/where-is-my-shell.sh script which updates user with a shell from /etc/skel
  for pre-existing weird users which were left behind.
- Currently works in system-wide mode only. Could configure only single user
  you have access to (assuming the zsh package at least is available)

Also:
- Don't touch anything else. Don't break anything. Changing the root shell to
  /bin/zsh is the most invasive change here.
- User can put his configuration inside `~/.zshrc_private` and scripts in `~/_bin`
- Don't assume network connection is available.
- Don't execute or depend on anything out of this package.
- Don't "save" space on trivial/small packages you might need some day.
- Don't include tools which in some circumstances could be used for an attack,
  or can be handy for attackers (nmap, netcat, tcpdump). 

Testing
=======

With default hosts entry:

  localhost ansible_connection=local

you can run it like this:

  ansible-playbook -i hosts site.yml
