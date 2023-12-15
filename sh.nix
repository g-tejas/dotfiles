{ config, pkgs, ... }: 
let 
  myAliases = {
      update =  "sudo nixos-rebuild switch --flake /home/tejas/git/dotfiles";
      updatehome = "home-manager switch --flake /home/tejas/git/dotfiles";
      lg = "lazygit";
  };
in
{
  # this just creates the dotfiles, e.g .bashrc symlinks, you
  # still need to make ur terminal use this shell. 
  programs.zsh = {
    enable = true;
    shellAliases = myAliases;
    enableAutosuggestions = true;
    enableCompletion = true;

    initExtra = ''
      eval "$(zoxide init zsh)"
    '';

    oh-my-zsh = {
      enable = true;
      plugins = [ "thefuck" "git" ];
      theme = "robbyrussell";
    };
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
}
