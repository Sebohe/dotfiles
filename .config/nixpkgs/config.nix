with import <nixpkgs> {};
{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
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
        firefox
        chromium
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
        #tmux
        i3lock-color
        libnotify
        scrot
        alacritty
        pass
        pavucontrol
        xclip
        lsd
        xbindkeys
      ];
    };
    myProgramming = pkgs.buildEnv {
      name = "myProgramming";
      paths = [
        vscode
        ripgrep
        rustup
        go_1_13
        ansible
        docker-compose
        lazydocker
        lazygit
        gitAndTools.gitFull
        gitAndTools.diff-so-fancy
        R
        travis
      ];
    };
    myMessaging = pkgs.buildEnv {
      name = "myMessaging";
      paths = [
        discord
        signal-desktop
        tdesktop
        riot-desktop
        zoom-us
        kbfs
        keybase
        keybase-gui
      ];
    };
    myTools = pkgs.buildEnv {
      name = "myTools";
      paths = [
        gitAndTools.git-annex
        gitAndTools.gitRemoteGcrypt
        pythonPackages.youtube-dl
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
      ];
    };
  };
}
