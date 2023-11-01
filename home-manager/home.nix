# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: 
{
# You can import other home-manager modules here
	imports = [
# You can also split up your configuration and import pieces of it here:
# ./nvim.nix
	];

	nixpkgs = {
# You can add overlays here
		overlays = [
# If you want to use overlays exported from other flakes:
# neovim-nightly-overlay.overlays.default

# Or define it inline, for example:
# (final: prev: {
#   hi = final.hello.overrideAttrs (oldAttrs: {
#     patches = [ ./change-hello-to-hi.patch ];
#   });
# })
		];
# Configure your nixpkgs instance
		config = {
# Disable if you don't want unfree packages
			allowUnfree = true;
# Workaround for https://github.com/nix-community/home-manager/issues/2942
			allowUnfreePredicate = _: true;
		};
	};

	home = {
		username = "tejas";
		homeDirectory = "/home/tejas";
		sessionVariables = {
			EDITOR = "nvim";
			BROWSER = "firefox";
			TERMINAL = "kitty";
		};
	};

	programs.kitty = {
		enable = true;
		extraConfig = builtins.readFile ../kitty.conf;
	};

# Add stuff for your user as you see fit:
	programs.neovim = 
		let
		toLua = str: "lua << EOF\n${str}\nEOF\n";
	toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
	in	
	{
		enable = true;

		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		extraPackages = with pkgs; [
			lua-language-server
				rnix-lsp

				xclip
				wl-clipboard
		];

		plugins = with pkgs.vimPlugins; [

		{
			plugin = nvim-lspconfig;
			config = toLuaFile ../nvim/plugins/lsp.lua;
		}

		neodev-nvim

		{
			plugin = nvim-cmp;
			config = toLuaFile ../nvim/plugins/cmp.lua;
		}

		{
			plugin = telescope-nvim;
			config = toLuaFile ../nvim/plugins/telescope.lua;
		}
    plenary-nvim 

		telescope-fzf-native-nvim
			cmp_luasnip
			cmp-nvim-lsp
			luasnip
			friendly-snippets
			lualine-nvim
			nvim-web-devicons

			{
				plugin = (nvim-treesitter.withPlugins (p: [
							p.tree-sitter-nix
							p.tree-sitter-vim
							p.tree-sitter-bash
							p.tree-sitter-lua
							p.tree-sitter-python
							p.tree-sitter-json
				]));
				config = toLuaFile ../nvim/plugins/treesitter.lua;
			}

		vim-nix

		{
			plugin = comment-nvim;
			config = toLua "require(\"Comment\").setup()";
		}

		{
			plugin = tokyonight-nvim;
			config = toLuaFile ../nvim/plugins/tokyonight.lua;
		}

		{
			plugin = lualine-nvim;
			config = toLuaFile ../nvim/plugins/lualine.lua;
		}

		];

		extraLuaConfig = ''
			${builtins.readFile ../nvim/options.lua}
		${builtins.readFile ../nvim/remap.lua}
		'';
	};
# home.packages = with pkgs; [ steam ];

# Enable home-manager and git
	programs.home-manager.enable = true;

	programs.git = {
		enable = true;
		userName = "g-tejas";
		userEmail = "ttejasgarrepally@gmail.com";
	};

# Nicely reload system units when changing configs
	systemd.user.startServices = "sd-switch";

# https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
	home.stateVersion = "23.05";
}
