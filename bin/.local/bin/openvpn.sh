#!/usr/bin/sh
#sudo ifconfig wlp2s0 down
#sudo macchanger -r wlp2s0
#sudo ifconfig wlp2s0 up
FULL_PATH=~/scripts/vpn_configs
config_file=$(ls $FULL_PATH | shuf -n1)
path=$FULL_PATH/$config_file
echo $path
sudo openvpn --config $path --auth-user-pass login.auth 2> EXIT_CODE
echo $EXIT_CODE
