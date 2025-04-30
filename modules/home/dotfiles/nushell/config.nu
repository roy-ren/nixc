def clearNvim [] {
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
}

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

# Shortcuts
alias .. = cd ..
alias ... = cd ../..
alias .... = cd ../../..
alias ..... = cd ../../../..

alias dl = cd ~/Downloads
alias dt = cd ~/Desktop
alias p = cd ~/projects
alias paas = cd ~/projects/paas/

# ls
alias l = ls
alias la = ls -a
alias ll = ls -l
alias lla = ls -la
alias lt = lsd --tree

# neovim
alias nv = nvim
alias vi = nvim
alias vim = nvim

# tmux
alias "t" = tmux
alias "ta" = tmux attach

# stow
alias stowr = stow -R . -v

# git
alias lg = lazygit
alias g = git

# just
alias j = just
alias jr = just run

# flutter
alias f = fvm flutter
alias fp = f pub
alias fpg = fp get
alias fpa = fp add
alias fpad = fp add --dev

# flutter watch
alias fw = flutter_watch
alias fcw = flutter_okmc_watch

alias fr = f run --pid-file=/tmp/tf1.pid
alias frp = f run --pid-file=/tmp/tf1.pid --profile

alias d = fvm dart
alias dp = d pub
alias dpg = dp get

alias dr = d run

# build_runner
alias drb = dr build_runner
alias drbc = drb clean
alias drbb = drb build
alias drbs = drb serve
alias drbw = drb watch
alias w_drb_watching_all = w_drb_watching --keys="m watch"

# melos
alias dpgam = dp global activate melos
alias m = fvm exec melos
alias mr = m run
alias mrg = m run gen
alias mrw = m run watch
alias mbs = m bootstrap
alias mbsnp = mbs --no-private
alias mp = m publish
alias mpdr = mp --dry-run
