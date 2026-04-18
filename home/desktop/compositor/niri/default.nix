{ pkgs, ... }:
{
  home.file.".config/niri/wallpaper_cycler.sh" = {
    source = ./wallpaper_cycler.sh;
    executable = true;
  };

  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  home.packages = with pkgs; [
    awww
    swaylock
  ];
}
