Shell configurator
==================

Configure a shell environment:
- consisting of:
  - oh-my-zsh offline copy
  - tmux, screen, git and configuration,
  - /usr/local/bin/where-is-my-shell.sh script which updates user with a shell from /etc/skel
    for pre-existing weird users which weren't configured beforehand.
- Currently works in system-wide mode only, but sameday...

Also:
- Don't touch anything else. Don't break anything.
  changing root shell to /bin/zsh is the most dangerous move here.
- Don't assume network connection is available.
- Don't execute or depend on anything out of this package.
- Don't "save" space on trivial/small packages you might need.

