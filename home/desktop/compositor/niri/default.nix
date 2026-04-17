{ pkgs, ... }

{
  xdg.configFile."niri/config.kdl".source = ./config.kdl;

  home.packages = with pkgs; [
    swww
    swaylock
  ];
}
