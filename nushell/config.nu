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

# Load custom NuShell prompt (assuming it's in ~/.bashPrompt)
if ($nu.is-interactive) {
    source ~/.config/nushell/prompt.nu
}

# Load alias file
source ~/.config/nushell/aliases.nu

