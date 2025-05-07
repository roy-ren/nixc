{
  services.tlp.enable = false;

  programs.auto-cpufreq = {
    enable = true;
    settings = {
      charger = {
        # performance
        governor = "ondemand";
        turbo = "auto";
      };

      battery = {
        governor = "powersave";
        turbo = "auto";
      };
    };
  };
}
