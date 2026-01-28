# Set the hosname as a enviroment variable for use in other staff
$env.HOSTNAME = ^hostname

# Set path to the ssh key, this allows to share ssh config file between computers
$env.SSH_KEY = $"($env.HOME)/.keys/($env.HOSTNAME)"

# Add {HOME}/bin to the path for my cli applications
#$env.PATH = ($env.PATH | append $"($env.HOME)/bin")

# Add tmuxifier to path
#$env.PATH = ($env.PATH | append $"($env.HOME)/.tmuxifier/bin")
 
# Set NVIM as the config editor
$env.config.buffer_editor = "/usr/bin/nvim"

# Remove start banner on nushell
$env.config.show_banner = false

# Set an enviroment variable with the path to the config 
# This makes it easier to reload the config when changing config 
$env.CONIFG_PATH = "~/.config/nushell/config.nu"
$env.ENV_PATH = "~/.config/nushell/env.nu"

