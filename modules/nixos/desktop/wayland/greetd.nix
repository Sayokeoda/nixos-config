{ config, lib, ... }:

{
  options.modules.greetd.enable =
    lib.mkEnableOption "Servicio greetd base";

  config = lib.mkIf config.modules.greetd.enable {
    services.greetd.enable = true;
  };
}
