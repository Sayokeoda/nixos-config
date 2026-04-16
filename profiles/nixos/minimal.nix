{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [ git curl wget vim ];
  i18n.defaultLocale = "es_ES.UTF-8";
  console.keyMap = "es";
}
