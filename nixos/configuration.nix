# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];



  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [ "amd__iommu=pt" "iommu=soft" ];
  boot.kernelPatches = [
    {
      name ="amdgpu-config";
      patch = null;
      extraConfig = ''
        DRM_AMD_DC_DCN1_0 y
     '';
    }
  ];

  boot.extraModulePackages = [ config.boot.kernelPackages.wireguard ];
  boot.loader = {
   # Use the systemd-boot EFI boot loader.
   systemd-boot.enable = true;
   systemd-boot.configurationLimit = 20;
   systemd-boot.consoleMode = "keep";
   timeout = 0;
   efi.canTouchEfiVariables = true;
   # grub.device = "/dev/sda";
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
  ];

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    extraConfig = "load-module module-echo-cancel";
  };
  hardware.ledger.enable = true;
  services.tlp.enable = true;
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    videoDrivers = [ "amdgpu" ];
    # caps locks boot
    xkbOptions = "ctrl:nocaps,compose:ralt";
    autorun = true;
    # Enable touchpad support.
    libinput = {
      enable = true;
      tapping = false;
    };
    displayManager.startx.enable = true;
    #desktopManager.plasma5.enable = true;
    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
  };

  # I'm gonna keep this zsh config to the bare minum
  # because I don't want to rebuild the dotfiles.
  # This is enough to avoid sourcing errors
  # when I start zsh the first time and also makes it easy
  # to bootstrap the dotfiles in other computers in which
  # nixos is not present
  programs.zsh = {
    enable = true;
    # ohMyZsh.enable = true; # not needed because it is in referenced in
    # pkgs.oh-my-zsh
    interactiveShellInit = ''
      # z - jump around
      source ${pkgs.fetchurl {url = "https://github.com/rupa/z/raw/2ebe419ae18316c5597dd5fb84b5d8595ff1dde9/z.sh"; sha256 = "0ywpgk3ksjq7g30bqbhl9znz3jh6jfg8lxnbdbaiipzgsy41vi10";}}
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
    '';
    promptInit = "";
  };

  users = {
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
      ];
    };
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
