local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Vs Code Dark+ (Gogh)"

config.font = wezterm.font("JetBrains Mono")
config.font_size = 22.0

-- default is true, has more "native" look
config.use_fancy_tab_bar = false

-- I don't like putting anything at the ege if I can help it.
config.enable_scroll_bar = false
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.keys = {
	{
		key = 'r',
		mods = 'CMD|SHIFT',
		action = wezterm.action_callback(function(window, pane)
			window:perform_action(wezterm.action.ReloadConfiguration, pane)
       wezterm.background_child_process {
                'zsh',
                '-c',
                'cd $HOME/Developer/dotfiles && echo "\n[$(date)] Running stow command..." >> /tmp/wezterm_stow.log && /opt/homebrew/bin/stow --verbose=2 --target "$HOME" --no-folding nvim >> /tmp/wezterm_stow.log 2>&1'
            }
            -- wezterm.background_child_process {
            --     'zsh',
            --     '-c',
            --     'cd "$HOME/Developer/dotfiles && /opt/homebrew/bin/stow --verbose=2 --target "$HOME" --no-folding nvim >> /tmp/wezterm_stow.log 2>&1'
            -- }


			window:toast_notification('Wezterm', 'Configuration Reloaded!', nil, 2000)
		end),
	},
}



config.tab_bar_at_bottom = true
config.freetype_load_target = "HorizontalLcd"

return config
