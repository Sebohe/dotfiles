{ pkgs ? import <nixpkgs-unstable> {} }:
let
  sc2 = {
    name = "sc2";
    paths = with pkgs; [
      wine-staging
      winetricks
      libpulseaudio
      libjpeg_turbo
      libpng
    ];
  };
  browsers = {
    name = "myBrowsers";
    paths = with pkgs; [
      #tor-browser-bundle-bin
      firefox-devedition-bin
      ungoogled-chromium
    ];
  };
  art = {
    name = "myArt";
    paths = with pkgs; [
      jack2Full
      a2jmidid
      qjackctl
      python38Packages.foxdot
      supercollider
      gimp
      audacity
    ];
  };
  ui = {
    name = "myUI";
    paths = with pkgs; [
      (dwm.override {
        patches =
          [
            /home/sebas/.dotfiles/dwm/dwm-config.patch
          ];
      })
      (import /home/sebas/repos/programs/romodoro {inherit pkgs;})
      #(import /home/sebas/repos/programs/dwm-status {})
      dmenu
      feh
      dunst
      i3lock-color
      libnotify
      scrot
      alacritty
      pass
      pavucontrol
      xclip
      lsd
      xbindkeys
      transmission-gtk
      yubioath-desktop
      blueman
      lm_sensors
      lshw
      pinentry
      qtpass
      starship
      #obinskit
    ];
  };
  programming = {
    name = "myProgramming";
    paths = with pkgs; [
      ripgrep
      rustup
      go_1_16
      morph
      terraform_0_15
      dive
      nixops
      fd
      fzf
      lazydocker
      gitAndTools.gitFull
      gitAndTools.diff-so-fancy # needed for diff-highlight?
      #R
      rnix-lsp
      neovim
      niv
    ];
  };
  messaging = {
    name = "myMessaging";
    paths = with pkgs; [
      #zoom-us
      discord
      signal-desktop
      #tdesktop
      element-desktop
    ];
  };
  tools = {
    name = "myTools";
    paths = with pkgs; [
      age
      cheat
      gitAndTools.git-annex
      gitAndTools.gitRemoteGcrypt
      #pythonPackages38.youtube-dl
      jq
      unzip
      ncdu
      xorg.xev
      ipcalc
      whois
      tcpdump
      libreoffice-fresh
      vlc
      nomacs
      breeze-icons
      speedcrunch #caculator
      dolphin # file manager
      calibre # ebooks
      gptfdisk
      qrencode
      pciutils
      arandr
      sshuttle
      usbutils
      exiftool
    ];
  };
in {
  allowUnfree = true;
  permittedInsecurePackages = [
    #"p7zip-16.02"
  ];

  packageOverrides = pkgs: rec {
    #myPenrose =  (import /home/sebas/repos/programs/my-penrose);
    mySc2 = pkgs.buildEnv sc2;
    myBrowsers = pkgs.buildEnv browsers;
    myArt = pkgs.buildEnv art;
    myUi = pkgs.buildEnv ui;
    myProgramming = pkgs.buildEnv programming;
    myMessaging = pkgs.buildEnv messaging;
    myTools = pkgs.buildEnv tools;
    myAll = pkgs.buildEnv {
      name = "myAll";
      paths = tools.paths ++ programming.paths ++ messaging.paths ++ ui.paths ++ browsers.paths;
    };
  };
}
