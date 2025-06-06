# Define colors using ANSI escape sequences (NuShell doesn't use `tput`)
let red = "\e[38;5;160m"
let bright_red = "\e[38;5;196m"
let green = "\e[38;5;34m"
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


# Last prompt symbol (# for root, $ otherwise)
let symbol = $bold + $bright_red + "$"

# Construct the prompt
$env.PROMPT_COMMAND = {||
    let dir = match (do -i { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    # If last command failed, add [✗] to the prompt
    let on_error = if ($env.LAST_EXIT_CODE != 0) {
        $"($etc_color)[($at_color)✗($etc_color)]─" 
    } else {
        $"($etc_color)[($green)k($etc_color)]─" 
    }

    let directory = $"($directory_color)($dir)"
    let user = $"($username_color)($env.USER)"
    let host = $"($host_color)($env.HOSTNAME)"

    $"($etc_color)┌─($on_error)[($user)($at_color)@($host)($etc_color)]-[($directory)($etc_color)]\n└──╼ ($symbol)($reset)"}
$env.PROMPT_INDICATOR = " "
#$env.PROMPT_INDICATOR = ">"
