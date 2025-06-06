# Define colors using ANSI escape sequences (NuShell doesn't use `tput`)
let red = "\e[38;5;160m"
let bright_red = "\e[38;5;196m"
let green = "\e[38;5;34m"
let pink =  "\e[38;5;205m"
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

let separator = $"($etc_color)]-["
let start = $"($etc_color)┌─["
let end = $"($etc_color)]\n"
let secondLine = $"($etc_color)└──╼ $($reset)"

# Construct the prompt
$env.PROMPT_COMMAND = {||
    let dir = match (do -i { $env.PWD | path relative-to $nu.home-path }) {
        null => $env.PWD
        '' => '~'
        $relative_pwd => ([~ $relative_pwd] | path join)
    }

    # If last command failed, add [✗] to the prompt
    let on_error = if ($env.LAST_EXIT_CODE != 0) {
        $"($at_color)✗" 
    } else {
        $"($green)k" 
    }

    let is_git = (isGit)
    let git = if ($is_git == "True") {
        let branch = (git rev-parse --abbrev-ref HEAD | str trim) 
        let branch_str = $"($separator)($bold)($pink)($branch)"

        let modified = (git status --short | grep '^ M' | wc -l) | into int
        let deleted = (git status --short | grep '^ D' | wc -l) | into int
        let diff = (git status --short | wc -l) | into int
        let new = $diff - $modified - $deleted

        let new_str = if ($new == 0) {
            ""
        } else {
            $"($separator)($green)N($new)"
        }

        let modified_str = if (($modified) == 0) {
            ""
        } else {
            $"($separator)($orange)M($modified)"
        }

        let deleted_str = if (($deleted) == 0) {
            ""
        } else {
            $"($separator)($bright_red)D($deleted)"
        }

        $"($branch_str)($new_str)($modified_str)($deleted_str)"
    } else {
        ""
    }

    let directory = $"($directory_color)($dir)"
    let user = $"($username_color)($env.USER)"
    let host = $"($host_color)($env.HOSTNAME)"

    $"($start)($on_error)($separator)($user)($separator)($host)($separator)($directory)($git)($end)($secondLine)"
}

$env.PROMPT_INDICATOR = " "
