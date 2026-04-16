{ config, pkgs, lib, ... }:
{
  imports = [ ../system/00-core.nix ../desktop/wayland/default.nix ];
  services.pipewire.enable = true;
  system.stateVersion = "24.11";
}
