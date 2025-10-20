{
  config,
  pkgs,
  inputs,
  ...
}:
{
  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedTCPPorts = [
      3000
      34197
      12975
      32976
      25565
      7777
      6112
      6113
      6114
      6115
      6116
      6117
      6118
      6119
    ];
    allowedUDPPorts = [
      34197
      25565
      7777
      6112
      6113
      6114
      6115
      6116
      6117
      6118
      6119
    ];
  };
}
