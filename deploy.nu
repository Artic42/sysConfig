# Neovim config change
rm -rf $"($env.HOME)/.config/nvim"
cp -r nvim/ $"($env.HOME)/.config/nvim"

# Nushell config change
rm -rf $"($env.HOME)/.config/nushell"
cp -r nushell/ $"($env.HOME)/.config/nushell"

# Copy tmux config 
rm -f $"($env.HOME)/.tmux.conf"
cp tmux/tmux.conf $"($env.HOME)/.tmux.conf"

# Compile isGit and install it on ${HOME}/bin
gcc isGit.c -o isGit.app
cp isGit.app $"($env.HOME)/bin/isGit"

# Rerun  nushell config
source ~/.config/nushell/env.nu
source ~/.config/nushell/config.nu
