{ config, pkgs, lib, ... }:

{
  options.modules.greetd = {
    enable = lib.mkEnableOption "greetd display manager";

    user = lib.mkOption {
      type = lib.types.str;
      default = "greeter";
      description = "Usuario que ejecuta la sesión de greetd";
    };

    sessionCommand = lib.mkOption {
      type = lib.types.str;
      default = "";
      description = "ejecuta la sesión (niri)";
    };
  };

  config = lib.mkIf config.modules.greetd.enable {
    services.greetd = {
      enable = true;

      settings.default_session = {
        command = config.modules.greetd.sessionCommand;
        user = config.modules.greetd.user;
      };
    };
  };
}
