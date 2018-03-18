Unified shell configurator
==========================

Configures a shell environment:
- offline copy of oh-my-zsh installed system-wide in `/etc/oh-my-zsh`
  (https://github.com/robbyrussell/oh-my-zsh - MIT License)
- offline copy of zsh ZAW plugin in `/etc/zsh_zaw`
  (https://github.com/zsh-users/zaw.git - BSD License)
- tmux, screen, git, vim (packages and configuration)
- /usr/local/bin/where-is-my-shell.sh script which updates user with a shell
  from /etc/skel for pre-existing weird users which were left behind.
- Currently works in system-wide mode only. Copy files manually if you don't
  have root.

Also:
- Don't touch anything else. Don't break anything. Changing the root shell to
  /bin/zsh is the most invasive change here.
- User can put his configuration inside `~/.zshrc_private` and scripts in `~/_bin`
- Don't assume network connection is available.
- Don't execute or depend on anything out of this package.
- Don't "save" space on trivial/small packages you might need some day.
- Don't include tools which in some circumstances could be used for an attack,
  or can be handy for attackers (nmap, netcat, tcpdump). 
- Should work on Debian and Ubuntu. With small apt/yum fix also on RedHat-alike.
- zshrc was modified a bit to include few aliases. oh-my-zsh tarball should be
  vanilla.

Testing and running
===================

With default hosts entry:
```
  localhost ansible_connection=local
```

you can run it as root for configuring the local computer only:
```
  # ansible-playbook -i hosts site.yml
```

Or you can of course:
- can copy the role to your ansible scripts
- or edit the hosts and site.yml. 

