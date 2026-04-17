{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/nixos/system/00-core.nix
    ../../modules/nixos/roles/laptop.nix
    ../../modules/nixos/desktop/wayland/default.nix
    ../../profiles/nixos/minimal.nix
  ];

  networking.hostName = "laptop";

  users.users.Sayokeoda = {
    isNormalUser = true;
    extraGroups = [ "wheel" "audio" "video" ];
    home = "/home/Sayokeoda";
  };

  security.sudo.wheelNeedsPassword = true;
}
