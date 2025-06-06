$env.HOSTNAME = ^hostname
$env.SSH_KEY = $"($env.HOME)/.keys/($env.HOSTNAME)"
$env.PATH = ($env.PATH | append $"($env.HOME)/bin")


$env.config.buffer_editor = "vi"
$env.config.show_banner = false

