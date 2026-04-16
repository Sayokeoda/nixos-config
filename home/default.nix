{ pkgs, ... }:
{
  home.username = "Sayokeoda";
  home.homeDirectory = "/home/Sayokeoda";
  home.packages = with pkgs; [ neovim ];
}
