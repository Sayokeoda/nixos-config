{ config, pkgs, lib, ... }:
{
  time.timeZone = "Europe/Madrid";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];
}
