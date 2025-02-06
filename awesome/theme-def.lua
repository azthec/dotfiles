local beautiful    = require('beautiful')
local theme_assets = require('beautiful.theme_assets')
local xresources   = require('beautiful.xresources')
local dpi          = xresources.apply_dpi

local theme        = {}

theme.font         = 'JetBrains Mono'

theme.bg_normal    = '#292c3c'
theme.bg_focus     = '#303446'
theme.bg_urgent    = '#ea999c'
theme.bg_minimize  = '#414559'
theme.bg_systray   = theme.bg_normal

theme.fg_normal    = '#c6d0f5'
theme.fg_focus     = '#737994'
theme.fg_urgent    = '#ea999c'
theme.fg_minimize  = '#99d1db'

theme.useless_gap           = dpi(5)
theme.border_normal         = '#303446'
theme.border_focus          = '#303446'
theme.border_marked         = '#303446'
theme.border_radius         = dpi(8)
theme.border_width          = dpi(0)

theme.menu_height           = 90
theme.menu_width            = 400

-- Generate taglist squares:
local taglist_square_size   = dpi(4)
theme.taglist_squares_sel   = theme_assets.taglist_squares_sel(
  taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
  taglist_square_size, theme.fg_normal
)

--Signals
client.connect_signal('focus', function(c)
  c.border_color = theme.border_focus
end)
client.connect_signal('unfocus', function(c)
  c.border_color = theme.border_normal
end)

theme.icon_theme = nil

return theme
