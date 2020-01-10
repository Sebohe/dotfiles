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
        #gimp
        audacity
      ];
    };
    myFonts = pkgs.buildEnv {
      name = "myFonts";
      paths = [
        aileron
        dejavu_fonts
        dina-font
        eunomia
        f5_6
        ferrum
        fira
        fira-code
        fira-code-symbols
        fira-mono
        font-awesome
        helvetica-neue-lt-std
        ibm-plex
        inconsolata
        league-of-moveable-type
        liberation_ttf
        libre-baskerville
        libre-bodoni
        libre-caslon
        libre-franklin
        medio
        mplus-outline-fonts
        national-park-typeface
        norwester-font
        penna
        proggyfonts
        route159
        seshat
        siji
        tenderness
        vegur
        vistafonts
      ];
    };
    myPackagesExtras = pkgs.buildEnv {
      name = "myPackagesExtras";
      paths = [
        R
        tor-browser-bundle-bin
      ];
    };
    myPackages = pkgs.buildEnv {
      name = "myPackages";
      paths = [
        # programming
        vscode
        ripgrep
        rustup
        neovim
        rustracer
        go_1_13
        gnome3.meld

        # messagin
        discord
        signal-desktop
        tdesktop
        riot-desktop

        # tools
        scrot
        alacritty
        pass
        gitAndTools.gitFull
        gitAndTools.git-annex
        gitAndTools.gitRemoteGcrypt
        lsd
        pavucontrol
        pythonPackages.youtube-dl
        xbindkeys
        jq
        unzip
        ncdu
        ipcalc
        sshuttle
        xclip
        whois

        # UI
        (dwm.override {
          patches =
            [
              /home/sebas/.dotfiles/dwm/dwm-config.patch
            ];
        })
        dwm-status
        dmenu
        feh
        dunst
        tmux
        i3lock-color
        libnotify

        # Browsers and  programs
        firefox
        brave
        chromium
        libreoffice-fresh
        vlc
        taskwarrior

        # desktop ui
        nomacs
        breeze-icons
        kcalc
        ktorrent
        dolphin # file manager
        calibre # ebooks
        zoom-us

        # devops
        ansible
        docker-compose
      ];
    };

  };
}
