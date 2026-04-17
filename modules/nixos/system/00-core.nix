{ config, pkgs, lib, ... }:
{
  time.timeZone = "Europe/Madrid";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 22 ];

  services.pipewire = {
    enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  system.stateVersion = "24.11";
}
