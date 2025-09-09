{ config, pkgs, ... }:
{
  programs.wofi = {
    enable = true;
    style = ./style.css;
    settings = {
      show = "drun";
      columns = 2;
      width = "35%";
      no_actions = true;
      allow_images = true;
      insensitive = true;
      image_size = 40;
      prompt = "   Search...";
    };
  };
}
