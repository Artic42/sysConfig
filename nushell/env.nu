$env.SSH_KEY = $"($env.HOME)/.keys/Artemis"
$env.HOSTNAME = ^hostname
$env.PATH = ($env.PATH | append $"($env.HOME)/bin")


$env.config.buffer_editor = "vi"
$env.config.show_banner = false


# Don't put duplicate lines or lines starting with space in history
$env.HISTORY_IGNORE = ['duplicates', 'leading_space']

# Set history size limits
$env.HISTORY_SIZE = 1000
$env.HISTORY_FILE_SIZE = 2000

# Enable checking window size after each command
$env.CHECK_WINSIZE = true

# Enable alias expansion
$env.EXPAND_ALIASES = true

# Append to history instead of overwriting
$env.HIST_APPEND = true

# Colored GCC warnings and errors
$env.GCC_COLORS = 'error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
