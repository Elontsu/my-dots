{ config, pkgs, ... }:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/myFlake";
      f = "fastfetch";
      cls = "clear";
    };
  };
}
