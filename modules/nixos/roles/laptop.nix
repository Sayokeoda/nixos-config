{ config, pkgs, lib, ... }:

{
  options.profiles.laptop.enable =
    lib.mkEnableOption "Laptop rol (TLP, battery, touchpad, ...)";

  config = lib.mkIf config.profiles.laptop.enable {

    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
      };
    };

    services.libinput = {
      enable = true;
      touchpad = {
        tapping = true;
        naturalScrolling = true;
      };
    };

    environment.systemPackages = with pkgs; [
      brightnessctl
      powertop
      acpi
    ];

    services.fwupd.enable = true; # Firmware update
  };
}
