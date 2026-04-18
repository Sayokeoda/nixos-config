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

        colors-dark = {
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

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;

    settings = {
      manager = {
        show_hidden = true;

        sort_by = "mtime";
      };
    };
  };

  home.packages = with pkgs; [
    ffmpegthumbnailer
    poppler-utils
    unzip
    fzf
  ];

  programs.home-manager.enable = true;
}
