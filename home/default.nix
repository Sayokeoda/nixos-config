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

  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "JetBrainsMono Nerd Font:size=11";
        dpi-aware = "yes";
      };

        color = {
          alpha = "0.9";
          background = "1a1b26";
          foreground = "c0caf5";
        };

        mouse = {
          hide-when-typing = "yes";
        };
      };
    };

  programs.neovim = {
    enable = true;

    withRuby = false;
    withPython3 = false;
  };

  programs.home-manager.enable = true;
}
