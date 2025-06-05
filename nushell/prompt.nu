# Color variables (using ANSI escape codes)
let red = "\e[38;5;160m"
let bright_red = "\e[38;5;196m"
let light_purple = "\e[38;5;60m"
let orange = "\e[38;5;172m"
let blue = "\e[38;5;21m"
let light_blue = "\e[38;5;80m"
let bold = "\e[1m"
let reset = "\e[0m"

# Define prompt function
def create-prompt [] {
    let is-root = ($env.USER == "root")
    let username_color = if $is-root { $"{reset}{bold}{bright_red}" } else { $"{reset}{bold}{light_blue}" }
    let at_color = $"{reset}{bold}{orange}"
    let host_color = $"{reset}{bold}{orange}"
    let directory_color = $"{reset}{light_purple}"
    let etc_color = $"{reset}{red}"
    let symbol = if $is-root { "#" } else { "$" }

    let error_code = $env.LAST_EXIT_CODE
    let on_error = if $error_code != 0 {
        $"($etc_color)[($at_color)✗($etc_color)]─"
    } else {
        ""
    }

    let user = $env.USER
    let host = (hostname)
    let dir = (pwd)

    # Prompt shape:
    # ┌─[user@host]-[cwd]
    # └──╼ $
    $'($etc_color)┌─($on_error)[($username_color)($user)($at_color)@($host_color)($host)($etc_color)]-[(directory_color)($dir)($etc_color)]\n└──╼ ($reset)($symbol) '
}

# Set the prompt
let-env PROMPT_COMMAND = { create-prompt }

