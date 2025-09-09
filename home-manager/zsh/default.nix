{ config, ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake ~/myFlake";
      f = "fastfetch";
      cls = "clear";
    };
  };
}
