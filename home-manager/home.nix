{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./Hyprland
    ./kitty
    ./wofi
    ./swww
    ./zeditor
    ./git
    ./zsh
    ./waybar
    ./spicetify
    ./shell
  ];
  home = {
    username = "elontsu";
    homeDirectory = "/home/elontsu";
    stateVersion = "25.11";
  };

  # programs.ssh = {
  #   enable = true;
  #   matchBlocks = {
  #     "github.com" = {
  #       hostname = "gihub.com";
  #       user = "git";
  #       identityFile = "~/.ssh/id_ed25519";
  #       identitiesOnly = true;
  #     };
  #   };
  # };
}
