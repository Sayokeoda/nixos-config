{ pkgs, ... }:
{
  home.username = "Sayokeoda";
  home.homeDirectory = "/home/Sayokeoda";
  home.stateVersion = "24.11";

  imports = [
    ./desktop/compositor/niri/default.nix
#    ./apps/nvim
#    ./desktop/shell/quickshell
  ];

  home.packages = with pkgs; [
    neovim
    foot
  ];

  programs.home-manager.enable = true;
}
