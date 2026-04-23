{ config, pkgs, lib, ... }:

{
  options.profiles.niri.enable =
    lib.mkEnableOption "niri compositor";

  config = lib.mkIf config.profiles.niri.enable {

    programs.niri.enable = true;

    # greetd activation
    modules.greetd = {
      enable = true;
      sessionCommand = "${pkgs.tuigreet}/bin/tuigreet --time --cmd niri";
    };

  };
}
