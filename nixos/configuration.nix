# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader = {
   # Use the systemd-boot EFI boot loader.
   systemd-boot.enable = true;
   systemd-boot.configurationLimit = 3;
   systemd-boot.consoleMode = "keep";
   timeout = 0;
   efi.canTouchEfiVariables = true;
   # grub.device = "/dev/sda";
  };

  networking = {
   hostName = "mini"; # Define your hostname.
   wireless.enable = true;  # Enables wireless support via wpa_supplicant.
   interfaces.enp0s25.useDHCP = true;
   interfaces.wlp3s0.useDHCP = true;
  };

  # Set your time zone.
  time.timeZone = "America/Managua";

  environment.systemPackages = with pkgs; [
    wget
    vim
    firefox
    git
    tmux
    dwm
    dmenu
    binutils
    gcc
    gnumake
    openssl
    pkgconfig
  ];

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    # caps locks boot
    xkbOptions = "ctrl:nocaps";
    autorun = true;
    desktopManager.plasma5.enable = true;
    # Enable touchpad support.
    libinput.enable = true;
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
    defaultUserShell = pkgs.zsh;
    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.sebas = {
      # The set of packages that should be made availabe to the user. This is in
      # contrast to environment.systemPackages, which adds packages to all users. 
      packages = with pkgs; [
        cargo
        rustup
	 neovim
      ];
      isNormalUser = true;
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
  };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?
}
