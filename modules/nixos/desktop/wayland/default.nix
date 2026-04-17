{ pkgs, ... }:
{
  imports = [
    ./niri.nix
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    config.common.default = "*";
  };

  fonts.packages = with pkgs; [
    nerdfonts
    noto-fonts
  ];

  environment.systemPackages = with pkgs; [
    wayland-utils
    wl-clipboard
    xwayland
  ];
}
