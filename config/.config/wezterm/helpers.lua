local wezterm = require 'wezterm'

local module = {}

function module.color_scheme_based_on_os_setting(dark_theme, light_theme)
  if wezterm.gui.get_appearance():find "Dark" then
    return dark_theme
  else
    return light_theme
  end
end

return module
