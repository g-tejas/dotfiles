# gnu stow; dotfiles
function check_prog() {
    if ! hash "$1" > /dev/null 2>&1; then
        echo "Command not found: $1. Aborting..."
        exit 1
    fi
}

check_prog stow
check_prog curl

mkdir -p "$HOME/.config"

stow --target "$HOME"              wezterm
stow --target "$HOME" --no-folding git
stow --target "$HOME" --no-folding i3
stow --target "$HOME" --no-folding nvim
stow --target "$HOME" --no-folding zsh

# install apt packages
sudo apt install fzf

# wezterm (copied from https://wezfurlong.org/wezterm/install/linux.html)
# curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
# echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list

# sudo apt update
# sudo apt install wezterm
#

# install atuin.sh
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh

# oh-my-zsh setup
# insert code here to install omz
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

