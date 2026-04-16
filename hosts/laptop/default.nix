{ config, pkgs, lib, ... }:

{
  imports = [
    ../../modules/nixos/roles/laptop.nix
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
