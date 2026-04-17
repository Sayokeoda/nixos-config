{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ foot neovim fuzzel firefox ];
#  services.mako.enable = true;
}
