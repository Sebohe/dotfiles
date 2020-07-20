with import <nixpkgs-unstable> {};
{
  allowUnfree = true;
  permittedInsecurePackages = [
    "p7zip-16.02"
  ];
  packageOverrides = pkgs: with pkgs; {
    mySc2 = pkgs.buildEnv {
      name = "sc2";
      paths = [
        wine-staging
        winetricks
        libpulseaudio
        libjpeg_turbo
        libpng
      ];
    };
    myArt = pkgs.buildEnv {
      name = "myArt";
      paths = [
        jack2Full
        a2jmidid
        qjackctl
        python38Packages.foxdot
        supercollider
        gimp
        audacity
      ];
    };
    myBrowsers = pkgs.buildEnv {
      name = "myBrowsers";
      paths = [
        tor-browser-bundle-bin
        firefox-devedition-bin
        brave
        spotify
      ];
    };
    myUI = pkgs.buildEnv {
      name = "myUI";
      paths = [
        # UI
        (dwm.override {
          patches =
            [
              /home/sebas/.dotfiles/dwm/dwm-config.patch
            ];
        })
        dwm-status # this is the rust version
        dmenu
        feh
        dunst
        tmux
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
      ];
    };
    myProgramming = pkgs.buildEnv {
      name = "myProgramming";
      paths = [
        ripgrep
        rustup
        go_1_14
        ansible
        docker-compose
        lazydocker
        #dive # analyze docker image layers
        lazygit
        gitAndTools.gitFull
        gitAndTools.diff-so-fancy # needed for diff-highlight?
        #R
        pipenv
      ];
    };
    myMessaging = pkgs.buildEnv {
      name = "myMessaging";
      paths = [
        #discord
        signal-desktop
        #tdesktop
        riot-desktop
      ];
    };
    myTools = pkgs.buildEnv {
      name = "myTools";
      paths = [
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
        taskwarrior
        nomacs
        breeze-icons
        speedcrunch #caculator
        dolphin # file manager
        calibre # ebooks
        gptfdisk
        qrencode
        pciutils
      ];
    };
  };
}
