# Load custom NuShell prompt (assuming it's in ~/.bashPrompt)
if ($nu.is-interactive) {
    source ~/.config/nushell/prompt.nu
}

# Load alias file
source ~/.config/nushell/aliases.nu

cd $env.HOME


