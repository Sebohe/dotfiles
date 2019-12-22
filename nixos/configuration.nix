# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "amd__iommu=pt" "iommu=soft" "acpi_backlight=vendor" ];
    extraModulePackages = [ config.boot.kernelPackages.wireguard ];
    loader = {
     systemd-boot.enable = true;
     systemd-boot.configurationLimit = 20;
     systemd-boot.consoleMode = "keep";
     timeout = 0;
     efi.canTouchEfiVariables = true;
    };
  };

  networking = {
    hostName = "mini"; # Define your hostname.
    networkmanager.enable = true;
    interfaces.enp2s0.useDHCP = true;
    interfaces.wlp4s0.useDHCP = true;
  };

  # Set your time zone.
  time.timeZone = "America/Managua";

  environment.systemPackages = with pkgs; [
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
  ];

  # Enable sound.
  sound = {
    enable = true;
    mediaKeys.enable = true;
  };
  hardware = {
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
      '';
    };
  };

  services = {
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
      libinput.accelSpeed = "0.6";
      synaptics = {
        dev = "/dev/input/event12";
        minSpeed = "0.5";
        maxSpeed = "1";
      };
      displayManager.startx.enable = true;
      desktopManager.plasma5.enable = true;
      desktopManager.default = "none";
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
    zsh = {
      enable = true;
      interactiveShellInit = ''
        # z - jump around
        source ${pkgs.fetchurl {url = "https://github.com/rupa/z/raw/2ebe419ae18316c5597dd5fb84b5d8595ff1dde9/z.sh"; sha256 = "0ywpgk3ksjq7g30bqbhl9znz3jh6jfg8lxnbdbaiipzgsy41vi10";}}
        export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
      '';
      promptInit = "";
    };
    adb.enable = true;
  };

  users = {
    groups = {
       plugdev = { };
       jackaudio = { };
    };
    # Sets the default shell for all users
    defaultUserShell = pkgs.zsh;
    # Define a user account. 
    users.sebas = {
      # moved 
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

  virtualisation.docker = {
    enable = true;
    liveRestore = false;
    enableOnBoot = true;
    autoPrune.enable = true;
  };
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
