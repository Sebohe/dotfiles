#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if [ -e /home/sebas/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sebas/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
