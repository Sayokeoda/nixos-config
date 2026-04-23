{ config, pkgs, lib, ... }:

{
  options.modules.greetd = {
    enable = lib.mkEnableOption "greetd display manager";
    sessionCommand = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "Comando de sesión por defecto";
    };
  };

  config = lib.mkIf config.modules.greetd.enable {
    services.greetd = {
      enable = true;
      settings.default_session = {
        command = config.modules.greetd.sessionCommand;
        user = "Sayokeoda"; # cámbialo
      };
    };
  };
}
