# Help is available in the configuration.nix(5) man page and 
# in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, lib, pkgs, ... }:

{
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

  imports = [
    ./hardware-configuration.nix
  ];

  hardware.enableAllFirmware = true;

  # Turn on nvidia drivers? I couldn't get it to work :(
  # services.xserver.videoDrivers = [ "nvidia" ];

  # hardware.nvidia = {
  #   modesetting.enable = true;
  #   powerManagement.enable = true;
  #   powerManagement.finegrained = true;
  #   open = true;
  #   nvidiaSettings = true;
  #   # package = config.boot.kernelPackages.nvidiaPackages.stable;
  #   prime = {
  #     offload = {
  #       enable = true;
  #       enableOffloadCmd = true;
  #     };
  #     # sync.enable = true;
  #     # reverseSync.enable = true;
  #     intelBusId = "PCI:0:2:0";
  #     nvidiaBusId = "PCI:1:0:0";
  #   };
  # };

  # Blacklist Nvidia entirely.
  boot.extraModprobeConfig = ''
    blacklist nouveau
    options nouveau modeset=0
  '';
  services.udev.extraRules = ''
    # Remove NVIDIA USB xHCI Host Controller devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
    # Remove NVIDIA USB Type-C UCSI devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
    # Remove NVIDIA Audio devices, if present
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
    # Remove NVIDIA VGA/3D controller devices
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
  '';
  boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # Laptop battery stuff.
  services.thermald.enable = true;

  services.tlp = {
    enable = true;
  };

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = ''\xff\xff\xff\xff\x00\x00\x00\x00\xff\xff\xff'';
    magicOrExtension = ''\x7fELF....AI\x02'';
  };

  # Enable networking
  networking = {
    hostName = "archibald";
    networkmanager = {
      enable = true;
    };
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "Africa/Johannesburg";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_ZA.UTF-8";

  # Enable the X11 windowing system.
  # services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  # services.xserver = {
  #   layout = "za";
  #   xkbVariant = "";
  # };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    # media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  
  # Programs and stuff
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  programs.zsh = {
    enable = true;
  };
  programs.steam = {
    enable = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
  programs.gamemode.enable = true;
  programs.git.enable = true;
  programs.neovim.enable = true;
  programs.waybar.enable = true;
  programs.thunar.enable = true;
  programs.droidcam.enable = true;
  programs.firefox.enable = true;
  programs.java.enable = true;
  programs.npm.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.benjamin = {
    isNormalUser = true;
    description = "Benjamin Frederick Kleyn";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      alacritty
      wofi
      hyprpaper
      libreoffice-qt
      grim
      slurp
      libnotify
      mako
      wl-clipboard
      sioyek
      eww
      discord
      minecraft
      gimp
      wine
      wineWowPackages.stable
      winetricks
      obsidian
      virtualbox
      inkscape
      obs-studio
      qbittorrent-qt5
      shotwell
      ttyper
      vlc
      gedit
      networkmanagerapplet
      gnome.gnome-calculator
      gnome.gnome-mines
      tuxpaint
      tuxtype
      tuxguitar
      lutris
      superTuxKart
      superTux
      pingus
      hedgewars
      dolphin-emu
      rpcs3
      # retroarchFull
      (retroarch.override {
        cores = with libretro; [
	  citra
	  desmume
	  gambatte
	  vba-next
          nestopia
          snes9x
          mupen64plus
          dolphin
          pcsx-rearmed
          pcsx2
        ];
      })
      # emulationstation-de
    ];
  };

  # Allow unfree packages and electron lol
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "freeimage-unstable-2021-11-01"
      "electron-25.9.0"
    ];
  };

  # Fonts
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    (nerdfonts.override { 
      fonts = [ 
        "IosevkaTerm" 
        "FiraMono" 
        "JetBrainsMono" 
        "Inconsolata" 
      ];
    })
  ];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager
    vim
    wget
    unzip
    p7zip
    unrar
    btop
    (python3.withPackages (ps: with ps; [
      numpy
      pillow
      requests
      networkx
    ]))
    gcc
    libgcc
    ghc
    nodejs
    neofetch
    termdown
    fzf
    zsh-forgit
    zsh-fzf-history-search
    zsh-fzf-tab
    thefuck
    eza
    lf
    gh
    cava
    libsForQt5.qt5ct
    qt6Packages.qt6ct
    glxinfo
    mesa-demos
    texlive.combined.scheme-full
    brightnessctl
    xorg.xauth
    appimage-run
  ];

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
  system.stateVersion = "24.05"; # Did you read the comment?

}
