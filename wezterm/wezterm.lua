local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.default_prog = { "zellij" }

config.enable_tab_bar = false

config.color_scheme = 'catppuccin-frappe'
config.force_reverse_video_cursor = true

config.font = wezterm.font('JetBrainsMono Nerd Font')
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' } -- disable ligatures

return config
