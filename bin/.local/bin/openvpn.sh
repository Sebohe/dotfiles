#!/usr/bin/sh
FULL_PATH=~/.local/bin/vpn_configs
config_file=$(ls $FULL_PATH | shuf -n1)
path=$FULL_PATH/$config_file
echo $path
screen -L -S night sudo openvpn --config $path --auth-user-pass ~/.local/bin/login.auth
#screen -L -S sssssh sudo openvpn --config $path --auth-user-pass ~/.local/bin/login.auth 2> ~/.local/bin/EXIT_CODE

echo $path
#sudo openvpn --config $path --auth-user-pass ~/.local/bin/login.auth 2> ~/.local/bin/EXIT_CODE
