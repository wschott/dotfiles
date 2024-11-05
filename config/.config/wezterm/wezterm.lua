local wezterm = require 'wezterm'
local helpers = require 'helpers'

local config = wezterm.config_builder()

-- Appearance
config.font_size = 13
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.color_scheme = helpers.color_scheme_based_on_os_setting("Tokyo Night", "Tokyo Night Light (Gogh)")
config.native_macos_fullscreen_mode = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- https://wezfurlong.org/wezterm/config/keyboard-concepts.html#macos-left-and-right-option-key
config.send_composed_key_when_left_alt_is_pressed = true
-- fix non working tilde (~) char on macOS with a german keyboard
-- https://github.com/wez/wezterm/issues/5468#issuecomment-2295268118
config.keys = {
  { key='n', mods='OPT', action=wezterm.action{SendString="~"} },
}

return config
