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
    # Update arp table
    for i in {1..254}; do ping -c 1 192.168.178.$i & done
    
    # Find MAC: subsitute vmname with your vm's name
    export MAC=$(vboxmanage showvminfo cpay-dev | grep MAC | awk '{print $4}')
    export MAC=$(echo $MAC | rev | cut -c 2- | rev)
    export MAC=$(echo $MAC | awk '{print tolower($0)}')
    export MAC=$(echo ${MAC:0:2}:${MAC:2:2}:${MAC:4:2}:${MAC:6:2}:${MAC:8:2}:${MAC:10:2})
    # Find IP: substitute vname-mac-addr with your vm's mac address in ':' notation
    arp -a | grep vmname-mac-addr

### Vim

    :lclose # Syntastic hide warning box

#### NerdTree

    o: open in prev window
    go: preview
    t: open in new tab
    T: open in new tab silently
    i: open split
    gi: preview split
    s: open vsplit
    gs: preview vsplit
