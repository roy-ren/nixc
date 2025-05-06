source ($nu.default-config-dir | path join "aliases.nu")
source ($nu.default-config-dir | path join "defines/normal.nu")
source ($nu.default-config-dir | path join "defines/flutter.nu")

add-to-path ".pub-cache/bin"

# starship
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
