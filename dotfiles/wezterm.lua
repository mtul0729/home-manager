-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.default_prog = {'fish', '-l'}
config.font = wezterm.font_with_fallback {'Fira Code', 'Source Han Sans SC'}

-- and finally, return the configuration to wezterm
return config
