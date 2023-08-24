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

config.font = wezterm.font_with_fallback { 'FiraCode Nerd Font', 'FiraCode NF' }
font_size = 11.0 -- points, not pixels

config.initial_cols = 110
config.initial_rows = 30
config.window_padding = {
  left = "10px",
  right = "10px",
  top = "2px",
  bottom = "8px",
}  

local base_color_scheme_name = 'Panda (Gogh)'
local custom_color_scheme = wezterm.color.get_builtin_schemes()[base_color_scheme_name]
-- https://github.com/wez/wezterm/issues/3627
custom_color_scheme.cursor_bg = custom_color_scheme.foreground
custom_color_scheme.cursor_fg = custom_color_scheme.background
-- config.force_reverse_video_cursor = true
config.color_schemes = {
  ['Custom'] = custom_color_scheme,
}
config.color_scheme = 'Custom'

config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.default_prog = { '/usr/bin/fish' }
-- config.default_prog = { '/bin/bash' }
-- config.default_prog = { '/bin/zsh' }

-- config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
-- config.integrated_title_button_style = "Gnome" -- "Windows"
config.tab_bar_at_bottom = true
-- config.use_fancy_tab_bar = false
-- config.tab_max_width = 200
config.hide_tab_bar_if_only_one_tab = true

config.window_close_confirmation = 'NeverPrompt'


-- Alt+<tab index>: Switch to tab
config.keys = {
  {
    key = '1',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(0),
  },
  {
    key = '2',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(1),
  },
  {
    key = '3',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(2),
  },
  {
    key = '4',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(3),
  },
  {
    key = '5',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(4),
  },
  {
    key = '6',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(5),
  },
  {
    key = '7',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(6),
  },
  {
    key = '8',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(7),
  },
  {
    key = '9',
    mods = 'ALT',
    action = wezterm.action.ActivateTab(-1),
  },
}


-- config.window_frame = {
--   active_titlebar_bg = custom_color_scheme.background,
--   inactive_titlebar_bg = custom_color_scheme.background
-- }
config.window_frame = {
  active_titlebar_bg = custom_color_scheme.background,
  inactive_titlebar_bg = custom_color_scheme.background,
  --font = config.font,
}
config.colors = {
  tab_bar = {
    background = custom_color_scheme.background,
    inactive_tab_edge = custom_color_scheme.background,
    active_tab = {
      bg_color = "#000000",
      fg_color = '#c0c0c0',
    },
    inactive_tab = {
      bg_color = custom_color_scheme.background,
      fg_color = '#808080',
    },
    inactive_tab_hover = {
      bg_color = '#111111',
      fg_color = '#808080',
      italic = false,
    },
    new_tab = {
      bg_color = custom_color_scheme.background,
      fg_color = '#808080',
    },
    new_tab_hover = {
      bg_color = "#111111",
      fg_color = '#c0c0c0',
      italic = false,
    },
  },
}


-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

function shorten(s, w)
  local ellipsis = "…"
  local n_ellipsis = utf8.len(ellipsis)
  if utf8.len(s) > w then
      return s:sub(1, w-n_ellipsis) .. ellipsis
  end
  return s
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)
    -- tab.is_active
    local string_min_length = 30
    local string_max_length = 30
    local formatted_title = "Tab " .. (tab.tab_index + 1) .. ": "
    formatted_title = formatted_title .. string.format("%-" .. (string_min_length - utf8.len(formatted_title)) .. "s", title)
    formatted_title = shorten(formatted_title, string_max_length)
    return formatted_title
  end
)


return config