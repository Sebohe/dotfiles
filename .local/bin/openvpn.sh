#!/usr/bin/sh
FULL_PATH=$HOME/.local/bin/vpn_configs
config_file=$(ls $FULL_PATH | shuf -n1)
path=$FULL_PATH/$config_file
echo "**************"
echo $path
echo "**************"
screen -S night sudo openvpn --config $path --auth-user-pass ~/.local/bin/login.auth
