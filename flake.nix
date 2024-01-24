{ 
  description = "For parallels vm";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-23.11";
    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

	nixvim-flake.url = "github:g-tejas/nixvim";
  }; 
  outputs = { self, nixpkgs, home-manager, ... } @ inputs: 
    let 
      system = "aarch64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      inherit (self) outputs;
    in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
	modules = [ ./nixos/configuration.nix ];
      };
    };

    homeConfigurations = {
      tejas = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
	modules = [ ./home-manager/home.nix ];
      };
    };
  };
}
