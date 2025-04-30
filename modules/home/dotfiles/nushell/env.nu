$env.config.show_banner = false

# $PATH
def --env add-to-path [
  path_to_add: string,
  --home: string # 可选传入
] {
  let resolved_home = (if ($home | is-empty) { $env.HOME } else { $home })
  let full_path = ($resolved_home | path join $path_to_add)
  if not ($env.PATH | any {|p| $p == $full_path }) {
    $env.PATH = ($env.PATH | append $full_path)
  }
}
add-to-path ".pub-cache/bin"

def --env set-xdg-var [
  varname: string,
  subpath: string,
  --home: string
] {
  let resolved_home = if ($home | is-empty) { $env.HOME } else { $home }
  let value = ($resolved_home | path join $subpath)
  load-env { $varname: $value }
}

set-xdg-var XDG_CONFIG_HOME ".config"
set-xdg-var XDG_CACHE_HOME ".cache"
set-xdg-var XDG_DATA_HOME ".local/share"
