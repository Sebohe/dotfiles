# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
in
{
  imports = [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      #/etc/nixos/wireguard-mullvad.nix
      /etc/nixos/wireguard.nix
      #/etc/nixos/openvpn.nix
      #/etc/nixos/cachix.nix
      #/home/sebas/repos/nix/nixos-configs/virtual.nix
    ];
  boot = {
    # Needed for pi3 iso img
    binfmt.emulatedSystems = [ "aarch64-linux" ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "amd_iommu=on"
      "ivrs_ioapic[32]=00:14.0"
      "iommu=pt"
      "quiet"
      "acpi_backlight=video"
    ];
    kernelModules = [ "kvm-amd" ];
    extraModulePackages = [ ];
    loader = {
     systemd-boot.enable = true;
     systemd-boot.configurationLimit = 20;
     systemd-boot.consoleMode = "keep";
     timeout = 1;
     efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "mini"; # Define your hostname.
    networkmanager.enable = true;
    interfaces.enp2s0.useDHCP = true;
    interfaces.wlp4s0.useDHCP = true;
    #defaultGateway.address = "192.168.1.254";
    enableIPv6 = true; # enable to allow wireguard to capture ::/0
    nameservers = [ 
      "10.100.0.1"
      "165.227.245.71"
      "1.1.1.1"
    ];
    wireguard.enable = true;
 };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  environment.systemPackages = with pkgs; [
    #direnv
    lsof
    wireguard
    wireguard-tools
    acpi
    wget
    curl
    nmap
    traceroute
    bind # provides dig
    ldns # provides drill
    less # better than the busybox less
    htop
    git
    binutils
    gcc
    gnumake
    gnupg
    openssl
    vim
    xorg.xbacklight
    libnotify
    glib
    alsaLib
    alsaUtils
    gtk2
  ];

  # Enable sound.
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  hardware = {
    bluetooth.enable = true;
    bluetooth.config.General.Enable = "Source,Sink,Media,Socket";
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };
    enableRedistributableFirmware = true;
    acpilight.enable = true;
    ledger.enable = true;
    cpu.amd.updateMicrocode = true;
    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
      support32Bit = true;
      extraConfig = ''
        load-module module-echo-cancel
	      load-module module-bluetooth-policy
	      load-module module-bluetooth-discover
        load-module module-bluez5-device
        load-module module-bluez5-discover
      '';
    };
  };

  nixpkgs.config.allowUnfree = true;
  fonts.fonts = with pkgs; [
    corefonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    noto-fonts-extra
    xkcd-font
    opensans-ttf
    liberation_ttf
    fira-code
    fira-code-symbols
    symbola
    google-fonts
    hack-font
    liberation_ttf
    mplus-outline-fonts
    freefont_ttf 
    dina-font
    proggyfonts
    dejavu_fonts
    fira
    fira-mono
    font-awesome
    inconsolata
    emojione
    twemoji-color-font
    twitter-color-emoji
  ];

  services = {
    #printing = {
    #  enable = true;
    #  drivers = with pkgs; [ gutenprint ];
    #};
    lorri.enable = false;
    # TLP power management
    tlp.enable = true;
    #usbguard.enable = true;
    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      layout = "us";
      videoDrivers = [ "amdgpu" ];
      # caps locks boot
      xkbOptions = "ctrl:nocaps,compose:ralt";
      autorun = true;
      # Enable touchpad support.
      libinput = {
        enable = true;
        tapping = true;
        tappingDragLock = false;
      };
      libinput.accelSpeed = "0.8";
      synaptics = {
        dev = "/dev/input/event12";
        minSpeed = "0.8";
        maxSpeed = "1";
	      scrollDelta = 800;
      };
      desktopManager.plasma5.enable = true;
      #displayManager.startx.enable = false;
      #desktopManager.default = "plasma5";
      displayManager.defaultSession = "none";
      displayManager.startx.enable = true;
      desktopManager.xterm.enable = false;
    };
  };

  # I'm gonna keep this zsh config to the bare minum
  # because I don't want to rebuild the dotfiles.
  # This is enough to avoid sourcing errors
  # when I start zsh the first time and also makes it easy
  # to bootstrap the dotfiles in other computers in which
  # nixos is not present
  programs = {
    adb.enable = false;
    gnupg = {
      agent = {
        enable = true;
        pinentryFlavor = "gtk2";
      };
    };
    zsh = {
      ohMyZsh = {
        enable = true;
        custom = "/home/sebas/.oh-my-zsh";
        plugins = [
          "nix-zsh-completions"
          "nix-shell"
        ];
      };
      enable = true;
      enableCompletion = true;
      autosuggestions = {
        enable = true;
        highlightStyle = "fg=6";
        # "Chooses the most recent match whose preceding history item matches the most
        # recently executed command (more info). Note that this strategy won't work as
        # expected with ZSH options that don't preserve the history order such as
        # HIST_IGNORE_ALL_DUPS or HIST_EXPIRE_DUPS_FIRST"
        strategy = "match_prev_cmd";
      };
      # interactiveShellInit = builtins.readFile ./zshrc;
      interactiveShellInit = ''
         # z - jump around
         source ${pkgs.fetchurl {
           url = "https://raw.githubusercontent.com/rupa/z/6586b61384cff33d2c3ce6512c714e20ea59bfed/z.sh";
           sha256 = "b3969a36b35889a097cd5a38e5e9740762f0e45f994b5e45991e2a9bdb2b8079";
         }}
         export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
      '';
      promptInit = "";
    };
  };

  users = {
    # Sets the default shell for all users
    defaultUserShell = pkgs.zsh;
    # Define a user account. 
    users.sebas = {
      isNormalUser = true;
      extraGroups = [ 
        "wheel" # Enable ‘sudo’ for the user.
        "audio"
        "sound"
        "video"
        "networkmanager"
        "docker"
        "plugdev"
        "adbusers"
        "jackaudio"
      ];
    };
  };
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
    gc = {
      automatic = true;
      options = "--delete-older-than 10d";
    };
  };
  virtualisation = {
    docker = {
      enable = false;
      liveRestore = false;
      enableOnBoot = true;
      autoPrune.enable = true;
    };
    libvirtd = {
      enable = false;
      qemuOvmf = true;
      qemuRunAsRoot = false;
      onBoot = "ignore";
      onShutdown = "shutdown";
    };
  };
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
