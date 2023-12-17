# Packages

## How to build
Simply run `sudo nixos-rebuild switch --flake .`
Don't need to specify as the hostname is the same as the configuration in the flake.nix

## How to update flake.lock file
```
nix flake update
// rebuild needed! the previous command only updates the lock file.
```

## Debug tips
Remember to exit shell and re open, if having name issues
Rebooting works also
Remember to either switch home-manager or nixos config after done. 
If in git repo, need to add to commit first.

## Alacritty Configuration
https://sunnnychan.github.io/cheatsheet/linux/config/alacritty.yml.html

When running on a new pc, make sure to change the user and host names since it might be diff.
