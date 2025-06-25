# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/xda-system-test"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "testSuite"; then

  # Create a new window inline within session layout definition.
  new_window "Lazygit"
  run_cmd "lazygit"
  new_window "nVim(Main)"
  run_cmd "nvim"
  new_window "nVim(Lib)"
  run_cmd "cd ../xda-pytest-env"
  run_cmd "nvim"
  new_window "taskManager"
  split_h 50
  split_v 50
  run_cmd "vit" 2
  new_window "terminal"

  # Select the default active window on session creation.
  select_window 2

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
