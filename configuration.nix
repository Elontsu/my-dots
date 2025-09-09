# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  inputs,
  ...
}:

# let
#   home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-25.05.tar.gz;
# in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    # inputs.spicetify-nix.nixosModules.default
    # (import "${home-manager}/nixos")
    #      /home/elontsu/.config/home-manager/home.nix

  ];

  #  home-manager.users.elontsu = { pkgs, ... }: {
  #      home.stateVersion = "25.05";
  #      imports = [
  # 	/home/elontsu/.config/home-manager/home.nix
  # ];
  # };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedTCPPorts = [
      3000
      34197
      12975
      32976
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
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  #
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  programs.yazi = {
    enable = true;
  };

  programs.waybar.enable = true;

  services.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    pulse.enable = true;
  };

  #  services.pulseaudio.extraConfig = ''unload-module module-echo-cancel
  #  load-module module-echo-cancel aec_method=webrtc aec_args="analog_gain_control=0 digital_gain_control=0"'';

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "uk_UA.UTF-8";
    LC_IDENTIFICATION = "uk_UA.UTF-8";
    LC_MEASUREMENT = "uk_UA.UTF-8";
    LC_MONETARY = "uk_UA.UTF-8";
    LC_NAME = "uk_UA.UTF-8";
    LC_NUMERIC = "uk_UA.UTF-8";
    LC_PAPER = "uk_UA.UTF-8";
    LC_TELEPHONE = "uk_UA.UTF-8";
    LC_TIME = "uk_UA.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # programs.zsh.enable = true;
  programs.fish.enable = true;

  users.defaultUserShell = pkgs.fish;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.elontsu = {
    isNormalUser = true;
    description = "Elontsu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
    ];
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = (
        with pkgs;
        [
          libva
          vaapiVdpau
          libvdpau-va-gl
          nvidia-vaapi-driver
        ]
      );
      extraPackages32 = (
        with pkgs.pkgsi686Linux;
        [
          vaapiVdpau
          libvdpau-va-gl
          nvidia-vaapi-driver
        ]
      );
    };
    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      forceFullCompositionPipeline = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };
  services.xserver.videoDrivers = [
    "nvidia"
  ];

  programs.dconf.profiles.user.databases = [
    {
      settings."org/gnome/desktop/interface" = {
        gtk-theme = "Adwaita";
        icon-theme = "Flat-Remix-Red-Dark";
        font-name = "Noto Sans Medium 11";
        document-font-name = "Noto Sans Medium 11";
        monospace-font-name = "Noto Sans Mono Medium 11";
      };
    }
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    withUWSM = false;
    xwayland.enable = true;
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  environment.systemPackages = with pkgs; [
    firefox
    lsd
    git
    unrar-free
    kitty
    wofi
    vesktop
    pipewire
    pavucontrol
    pwvucontrol
    fastfetch
    vim
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    inputs.caelestia-shell.packages.${pkgs.system}.default
    ox
    btop
    egl-wayland
    nvidia-system-monitor-qt
    telegram-desktop
    unzip
    swww
    zed-editor
    wlogout
    osu-lazer-bin
    r2modman
    qbittorrent
    hyprshot

    neovim

    nerd-fonts.jetbrains-mono
    prismlauncher
    rnnoise-plugin
    lmstudio
    libreoffice

    go

    rustup
    rustfmt

    libgcc
    gcc
    clang-tools
    clang_20

    nodejs_22

    nixd
    nil

    # ani-cli

    fd
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.variables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
    __GL_GSYNC_ALLOWED = "1";
    __GL_VRR_ALLOWED = "1";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
