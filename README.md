# dotfiles

##  Stow

    stow <MODULE>

# Cheat codes
### NIX

    nix-channel --update
    nix-env -iA dapphub.{dapp,seth,hevm}

### Commands I always forget

    ncdu # harddrive usage (alternative to df -ha and du -hs)
    pacman -Qo <file> #See which package owns the file
    
### Virtual Box find headless ip
    # Find MAC: subsitute vmname with your vm's name
    VBoxManage showvminfo vmname
    # Find IP: substitute vname-mac-addr with your vm's mac address in ':' notation
    arp -a | grep vmname-mac-addr
