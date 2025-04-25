{...}: {
  # services.karabiner-elements.enable = true;
  security.pam.services.sudo_local = {
    reattach = true;
    touchIdAuth = true;
  };
}
