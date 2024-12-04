local wezterm = require 'wezterm'
local helpers = require 'helpers'

local config = wezterm.config_builder()

-- Appearance
config.font_size = 13
config.font = wezterm.font('JetBrainsMono Nerd Font')
-- https://wezfurlong.org/wezterm/colorschemes/index.html
if helpers.is_dark() then
  config.color_scheme = "Tokyo Night"
else
  config.color_scheme = "Tokyo Night Day"
end
config.native_macos_fullscreen_mode = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

-- https://wezfurlong.org/wezterm/config/keyboard-concepts.html#macos-left-and-right-option-key
config.send_composed_key_when_left_alt_is_pressed = true
-- fix non working tilde (~) char on macOS with a german keyboard
-- https://github.com/wez/wezterm/issues/5468#issuecomment-2295268118
config.keys = {
  -- navigate one word backward
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bb',
  },
  -- navigate one word forward
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
  },
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },
  -- fix non working tilde (~) char on macOS with a german keyboard
  -- https://github.com/wez/wezterm/issues/5468#issuecomment-2295268118
  {
    key = 'n',
    mods = 'OPT',
    action = wezterm.action.SendString '~',
  },
}

return config
