{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Elontsu_";
        email = "killorden@gmail.com";
      };
    };
  };
}
