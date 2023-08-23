-- Configuration guide:       https://wezfurlong.org/wezterm/config/files.html
-- All config options:        https://wezfurlong.org/wezterm/config/lua/config/index.html
-- List of 936 color schemes: https://wezfurlong.org/wezterm/colorschemes/index.html

local wezterm = require 'wezterm'
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices:
config.enable_scroll_bar = true

config.color_scheme = 'Panda (Gogh)'

config.font = wezterm.font_with_fallback { 'FiraCode Nerd Font', 'FiraCode NF' }
font_size = 11.0 -- points, not pixels

config.initial_cols = 110
config.initial_rows = 30
config.window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
}  

config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.default_prog = { 'fish' }

-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.integrated_title_button_style = "Gnome" -- "Windows"
config.tab_bar_at_bottom = true

config.window_close_confirmation = 'NeverPrompt'

return config