$env.config.show_banner = false

if not ($env.PATH | any {|p| $p == ($env.HOME + "/.pub-cache/bin") }) {
  $env.PATH = ($env.PATH | append ($env.HOME + "/.pub-cache/bin"))
}
