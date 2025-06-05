# Define colors using ANSI escape sequences (NuShell doesn't use `tput`)
let red = "\e[38;5;160m"
let bright_red = "\e[38;5;196m"
let light_purple = "\e[38;5;60m"
let orange = "\e[38;5;172m"
let blue = "\e[38;5;21m"
let light_blue = "\e[38;5;80m"
let bold = "\e[1m"
let reset = "\e[0m"

# Determine user color (light blue for normal user, bright red for root)
let username_color = $bold + $light_blue

# Define prompt symbols and colors
let at_color = $bold + $orange
let host_color = $bold + $orange
let directory_color = $light_purple
let etc_color = $red

# If last command failed, add [✗] to the prompt
let on_error = if ($env.LAST_EXIT_CODE != 0) { $"($etc_color)[($at_color)✗($etc_color)]─" } else { "" }

# Last prompt symbol (# for root, $ otherwise)
let symbol = $bold + $bright_red + "$"

# Construct the prompt
$env.PROMPT_COMMAND = $"($etc_color)┌─($on_error)[($username_color)($env.USER)($at_color)@($host_color)($env.HOSTNAME)($etc_color)]-[($directory_color)($env.PWD)($etc_color)]\n($etc_color)└──╼ ($symbol)($reset)"
$env.PROMPT_INDICATOR = ""
$env.PROMPT_INDICATOR = ">"
