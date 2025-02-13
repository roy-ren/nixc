{flake, ...}: let
  inherit (flake.config) me;
in {
  # These users can add Nix caches.
  nix.settings.trusted-users = ["root" me.username];
}
