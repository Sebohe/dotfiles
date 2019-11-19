with import <nixpkgs> {};
{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "myPackages";
      paths = [
        # programming
        vscode
        ripgrep
        rustup
        neovim
        rustracer

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

        # UI
        (dwm.override {
          patches =
            [
              /home/sebas/.dotfiles/suck/dwm/dwm-config.patch
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
        google-chrome
        chromium
        tor-browser-bundle-bin
        libreoffice-fresh
        vlc

        # desktop ui
        nomacs
        breeze-icons
        kompare
        gnome3.meld
        kcalc
        ktorrent
        dolphin # file manager
        calibre # ebooks

        # devops
        ansible
        docker-compose
      ];
    };
  };
}
