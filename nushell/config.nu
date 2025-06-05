# Append history rather than overwrite
set-env config.history_file_format = "plaintext"

# Set history limits
set-env config.history_max_size = 2000
set-env config.history_max_entries = 1000

# Check terminal size after each command (Nushell handles this automatically)

# Enable aliases
alias ls = ls --color=auto
alias grep = grep --color=auto
alias fgrep = grep --fixed-strings --color=auto
alias egrep = grep --extended-regexp --color=auto

# Load system aliases
if (path exists ~/.config/nushell/aliases.nu) {
    source ~/.config/nushell/aliases.nu
}

# Source custom prompt
if ($nu.is-interactive) {
    if (path exists ~/.config/nushell/prompt.nu) {
        source ~/.config/nushell/prompt.nu
    }
}

