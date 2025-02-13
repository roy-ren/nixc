{
  lib,
  pkgs,
  config,
  ...
}:
with lib; let
  cfg = config.services.dotfiles;
  # 获取当前目录下所有条目（排除 default.nix）
  entries = builtins.readDir ./.;
  # 过滤并生成配置项
  genXdgConfig = name: type: {
    name = name;
    value = {
      source = ./. + "/${name}"; # 获取绝对路径
      recursive = type == "directory"; # 目录需要递归链接
    };
  };
  # 过滤掉 default.nix 和不需要的文件
  filteredEntries =
    lib.filterAttrs
    (name: type: name != "default.nix" && type != "unknown")
    entries;
in {
  options.services.dotfiles = {
    enable = mkEnableOption "启用 dotfiles 自动链接";
    name = mkOption {
      type = types.str;
      default = "user";
      description = "配置名称（可选）";
    };
  };

  config = mkIf cfg.enable {
    # 自动生成 xdg.configFile 配置
    xdg.configFile = lib.mapAttrs' genXdgConfig filteredEntries;

    # 可选：添加调试信息
    warnings =
      optional (entries ? "secrets")
      "检测到敏感目录 'secrets'，请确认已正确过滤！";
  };
}
