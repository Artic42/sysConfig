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

# Install tmuxifier if it's not
let tmuxifier_exist = ($"/($env.HOME)/.tmuxifier" | path exists)
if ($tmuxifier_exist) {
    print "Tmuxifier already installled"
} else {
    print "Tmuxifier not installled, installing..."
    git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
}

# Install tmuxifier if it's not
let tpm_exist = ($"/($env.HOME)/.tmux/plugins/tpm" | path exists)
if ($tpm_exist) {
    print "TPM already installled"
} else {
    print "TPM not installled, installing..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 
}

# Rerun  nushell config
source ~/.config/nushell/env.nu
source ~/.config/nushell/config.nu
