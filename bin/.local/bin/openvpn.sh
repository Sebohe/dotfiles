#!/usr/bin/sh
FULL_PATH=$HOME/.local/bin/vpn_configs
config_file=$(ls $FULL_PATH | shuf -n1)
path=$FULL_PATH/$config_file
echo $path
screen -L -S night sudo openvpn --config $path --auth-user-pass ~/.local/bin/login.auth
#sudo openvpn --config $path --auth-user-pass ~/.local/bin/login.auth

echo $path
#sudo openvpn --config $path --auth-user-pass ~/.local/bin/login.auth 2> ~/.local/bin/EXIT_CODE
