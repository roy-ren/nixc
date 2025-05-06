def flutter_watch [...args: string] {
  let folder = (pwd | path basename)
  let upper_folder = ($folder | str upcase)
  let current_window_name = (tmux display-message -p '#W' | str trim)
  let name = $"Debug-($upper_folder)"

  if $current_window_name != $name {
    tmux new-window -n $name
  }

  tmux send-keys $"f run ($args | str join ' ') --pid-file=/tmp/tf1.pid" C-m
}

# create new window run dart run build_runner watch
def w_drb_watching [
  --name: string
  --keys: string
] {
  let window_name = (tmux display-message -p '#W' | str trim)
  let resolved_name = if ($name | is-empty) { $window_name } else { $name }
  let name = $"[($resolved_name)] in Watching..."

  if $window_name != $name {
    tmux new-window -n $name
  }

  let keys = if ($keys | is-empty) { "drbw" } else { $keys }
  tmux send-keys $keys C-m
}

