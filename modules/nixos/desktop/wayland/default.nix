{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ foot neovim fuzzel firefox ];
  services.pipewire.enable = true;
#  services.mako.enable = true;
}
