{ config, pkgs, ... }:
let
  swarmMetricsPort = 9323;
  dockerbip="172.17.0.1";
  hostname = "mini";
  ethWgInterface = "wg1eth";
  enableVPN = true;
in
{
  #services.prometheus.exporters.node.enable = true;
  imports = [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      #/etc/nixos/wireguard-mullvad.nix
      (import /home/sebas/repos/nix/mynixos-config/wireguard.nix {
        inherit config;
        hostname = hostname;
        server = "bastion";
        enabled = enableVPN;
      })
      #/etc/nixos/openvpn.nix
      #/etc/nixos/cachix.nix
      #/home/sebas/repos/nix/nixos-configs/virtual.nix
      (import /home/sebas/repos/nix/mynixos-config/stakers/wg-ethereum-nodes.nix {
          inherit config hostname pkgs;
          server="eth2-vpn";
          interface=ethWgInterface;
          enabled = true;
          enableCompose = true;
      })
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
    hostName = hostname;
    networkmanager.enable = true;
    interfaces.enp2s0.useDHCP = true;
    interfaces.wlp4s0.useDHCP = true;
    #interfaces.wlp4s1 = { ipv4 = { addresses = [{ address = "192.168.0.3"; prefixLength = 16; }]; routes = [ { address = "192.168.0.3"; prefixLength = 16; via = "192.168.1.1"; }];};};
    #defaultGateway.address = "192.168.1.254";
    enableIPv6 = true; # enable to allow wireguard to capture ::/0
    nameservers = [ 
      "192.168.1.1"
      "10.100.0.1"
      "165.227.245.71"
      "1.1.1.1"
    ];
    wireguard.enable = true;
 };

  # Set your time zone.
  time.timeZone = "Europe/Edinburgh";

  environment.systemPackages = with pkgs; [
    libfaketime
    fakeroot
    glibc

    direnv
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
    bluetooth.enable = true; # https://github.com/google/security-research/security/advisories/GHSA-h637-c88j-47wq
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
    pcscd.enable = true;
    udev = {
      packages = [
        pkgs.yubikey-personalization
        pkgs.libu2f-host
      ];
      # disables builtin bluetooth
      extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="8087", ATTRS{idProduct}=="0025", ATTR{authorized}="0"
      '';
    };
    printing = {
      enable = true;
      drivers = with pkgs; [ gutenprint ];
    };
    lorri.enable = true;
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
      libinput.accelSpeed = "0.2";
      synaptics = {
        dev = "/dev/input/event12";
        minSpeed = "0.2";
        maxSpeed = "0.5";
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
  hardware.trackpoint = {
    enable = true;
    sensitivity = 16;
    speed = 32;
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
        pinentryFlavor = "gtk2"; # curses, tty, gtk2
      };
    };
    zsh = {
      ohMyZsh = {
        enable = true;
        custom = "/home/sebas/.oh-my-zsh";
        # For some reason this is very slow
        #plugins = [ "nix-zsh-completions" "nix-shell" ];
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
           url = "https://raw.githubusercontent.com/rupa/z/125f4dc47e15891739dd8262d5b23077fe8fb9ab/z.sh";
           sha256 = "ea8fb754e83fab8cff672ca705e9c0206d2f0e7076ec18da98e7a4a41df32233";
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
        "kvm"
      ];
    };
  };
  nix = {
    package = pkgs.nixStable;
    useSandbox = true;
    #extraOptions = ''experimental-features = nix-command flakes'';
    gc = {
      automatic = true;
      options = "--delete-older-than 10d";
    };
  };
  virtualisation.kvmgt.enable = true;
  virtualisation = {
    docker = {
      enable = true;
      liveRestore = false;
      enableOnBoot = true;
      autoPrune.enable = true;
      extraOptions = ''--metrics-addr=${dockerbip}:${toString swarmMetricsPort} --experimental --bip=${dockerbip}/16'';
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
