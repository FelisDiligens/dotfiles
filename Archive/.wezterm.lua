local wezterm = require 'wezterm'
local defaults = require 'defaults'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

defaults.apply_defaults(config)

return config