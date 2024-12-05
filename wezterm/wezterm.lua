-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- Window
config.window_decorations = "RESIZE"
config.window_padding = {
	top = 25,
	left = 25,
	right = 25,
	bottom = 25,
}

-- Tabs
-- config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

-- Styling
config.color_scheme = 'Catppuccin Mocha'

-- Fonts
config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 16.0

-- and finally, return the configuration to wezterm
return config
