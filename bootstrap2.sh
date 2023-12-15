# copy main background image to ~/.background-image
cp -f ./wallpapers/main.png ~/.background-image

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
sudo nix-channel --update
reboot
