# File: aliases.nu

# Listing aliases
alias ll = ls -l
alias lA = ls -A
alias la = ls -la
alias l = ls -CF
alias lf = {|args| ls -la | grep $args }

# Permission change macros
alias givex = chmod -v u+x
alias givexo = chmod -v uo+x

# Application launchers
alias vi = vim

# Tmux Shortcuts
alias tmuxs = tmux new -s
alias tmuxa = tmux attach
alias tmuxd = tmux detach

# Git shortcuts
alias gcl = git clone
alias gco = git add -A && git commit -m
alias gps = git push
alias gpl = git pull

# Python alias
alias python = python3

# System power controls
alias sdn = sudo shutdown now
alias rbn = sudo reboot

