{ config, pkgs, ... }: 
let 
  myAliases = {
      update =  "sudo nixos-rebuild switch --flake /home/tejas/dotfiles";
      updatehome = "home-manager switch --flake /home/tejas/dotfiles";
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
	plugins = [
	{
		name = "zsh-nix-shell";
		file = "nix-shell.plugin.zsh";
		src = pkgs.fetchFromGitHub {
			owner = "chisui";
			repo = "zsh-nix-shell";
			rev = "v0.7.0";
			sha256 = "149zh2rm59blr2q458a5irkfh82y3dwdich60s9670kl3cl5h2m1";
		};
	}	
	];
  };

  programs.bash = {
    enable = true;
    shellAliases = myAliases;
  };
}
