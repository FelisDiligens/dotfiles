-- "C:\Program Files\WezTerm\wezterm-gui.exe" --config-file "C:\Users\UserName\.config\wezterm\ubuntu_wsl.lua"

local wezterm = require 'wezterm'
local defaults = require 'defaults'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

defaults.apply_defaults(config)
defaults.apply_color_scheme(config, 'Ubuntu')
config.default_prog = { 'C:\\Windows\\system32\\wsl.exe' }
-- config.color_scheme = 'Ubuntu'

return config