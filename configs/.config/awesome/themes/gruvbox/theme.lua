local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = "~/.config/awesome/themes/"
local current_theme = "gruvbox"

local theme = {}

theme.font          = "CaskaydiaCove Nerd Font 11"

theme.hex_transparency = "f6"
theme.bg_normal     = "#282828" -- Normal, used in elements in unfocused state
theme.bg_secondary  = theme.bg_normal .. theme.hex_transparency -- Secondary, used in widgets
theme.bg_focus      = "#3c3836" -- Focused, used in focused widgets
theme.bg_focus_alt  = theme.bg_focus .. theme.hex_transparency
theme.bg_bar        = "#151515" -- Bar, used in bar
theme.bg_urgent     = "#282828"
theme.bg_minimize   = "#282828"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#ebdbb2" -- Normal, used in elements in unfocused state
theme.fg_secondary  = "#ebdbb2" -- Secondary, used in bar widgets
theme.fg_focus      = "#fbf1c7" -- Focused, used in focused widgets
theme.fg_urgent     = "#d65d0e"
theme.fg_minimize   = "#ebdbb2"
theme.fg_green      = "#6fba72"
theme.fg_red        = "#db3232"

theme.useless_gap   = dpi(10)
theme.border_width  = dpi(0)
theme.border_normal = theme.bg_normal
theme.border_focus = theme.bg_focus

-- Tasklist
theme.tasklist_bg_normal = theme.bg_secondary
theme.tasklist_fg_normal = theme.fg_secondary
theme.tasklist_bg_focus = theme.bg_focus_alt

-- Taglist
theme.taglist_bg_normal = theme.bg_secondary
theme.taglist_fg_normal = theme.fg_secondary
theme.taglist_fg_focus = theme.fg_focus

-- There are other variable sets
-- overriding the  one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]
theme.notification_font = "JetBrains Mono Nerd Font 9"
theme.notification_bg = theme.bg_normal
theme.notification_fg = theme.fg_normal
theme.notification_width = dpi(500)


-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path..current_theme.."/submenu.png"
theme.menu_height = dpi(18)
theme.menu_width  = dpi(130)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the wallpaper
theme.wallpaper = themes_path..current_theme.."/background.png"

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
