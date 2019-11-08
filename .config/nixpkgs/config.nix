with import <nixpkgs> {};
{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "myPackages";
      paths = [
        chromium
        vscode
        signal-desktop
        rustracer
        vlc
        alacritty
        scrot
        feh
        tdesktop
        dwm-status
        dunst
        pass
        gitAndTools.gitFull
        gitAndTools.git-annex
        gitAndTools.gitRemoteGcrypt
        vscode
        rustup
        neovim
        lsd
        pavucontrol
        firefox
        tmux
        libreoffice-fresh
        (dwm.override {
          patches =
            [ /home/sebas/.dotfiles/suck/dwm/dwm-config.patch ];
        })
        dmenu
        xbindkeys
      ];
      pathsToLink = [ "/share" "/bin" ];
    };
  };
}
