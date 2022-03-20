local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gfs = require("gears.filesystem")
local themes_path = "~/.config/awesome/themes/"
local current_theme = "romeq"

local theme = {}

theme.font          = "CaskaydiaCove Nerd Font 11"

theme.bg_normal     = "#282828" -- Normal, used in elements in unfocused state
theme.bg_secondary  = "#282828" -- Secondary, used in widgets
theme.bg_focus      = "#3c3836" -- Focused, used in focused widgets
theme.bg_bar        = "#1d2021" -- Bar, used in bar
theme.bg_urgent     = "#282828"
theme.bg_minimize   = "#282828"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#ebdbb2" -- Normal, used in elements in unfocused state
theme.fg_secondary  = "#ebdbb2" -- Secondary, used in bar widgets 
theme.fg_focus      = "#fbf1c7" -- Focused, used in focused widgets 
theme.fg_urgent     = "#d65d0e"
theme.fg_minimize   = "#ebdbb2"

theme.useless_gap   = dpi(5)
theme.border_width  = dpi(0)
theme.border_normal = "#1d2021"
theme.border_focus  = "#689d6a"
theme.border_marked = "#639d6a"

-- Tasklist
theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_fg_normal = theme.fg_normal

-- Taglist
theme.taglist_bg_normal = theme.bg_normal
theme.taglist_fg_normal = theme.fg_normal

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
theme.notification_bg = "#ebdbb2"
theme.notification_fg = "#1d2021"
theme.notification_width = dpi(500)
theme.notification_border_color = "#1d2021"
theme.notification_border_width = dpi(10)

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

-- Define the image to load
theme.titlebar_close_button_normal = themes_path..current_theme.."/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = themes_path..current_theme.."/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path..current_theme.."/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path..current_theme.."/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path..current_theme.."/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path..current_theme.."/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path..current_theme.."/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path..current_theme.."/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path..current_theme.."/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path..current_theme.."/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path..current_theme.."/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path..current_theme.."/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path..current_theme.."/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path..current_theme.."/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path..current_theme.."/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path..current_theme.."/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path..current_theme.."/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path..current_theme.."/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path..current_theme.."/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path..current_theme.."/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path..current_theme.."/background.png"

-- You can use your own layout icons like this:
theme.layout_fairh = themes_path..current_theme.."/layouts/fairhw.png"
theme.layout_fairv = themes_path..current_theme.."/layouts/fairvw.png"
theme.layout_floating  = themes_path..current_theme.."/layouts/floatingw.png"
theme.layout_magnifier = themes_path..current_theme.."/layouts/magnifierw.png"
theme.layout_max = themes_path..current_theme.."/layouts/maxw.png"
theme.layout_fullscreen = themes_path..current_theme.."/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path..current_theme.."/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path..current_theme.."/layouts/tileleftw.png"
theme.layout_tile = themes_path..current_theme.."/layouts/tilew.png"
theme.layout_tiletop = themes_path..current_theme.."/layouts/tiletopw.png"
theme.layout_spiral  = themes_path..current_theme.."/layouts/spiralw.png"
theme.layout_dwindle = themes_path..current_theme.."/layouts/dwindlew.png"
theme.layout_cornernw = themes_path..current_theme.."/layouts/cornernww.png"
theme.layout_cornerne = themes_path..current_theme.."/layouts/cornernew.png"
theme.layout_cornersw = themes_path..current_theme.."/layouts/cornersww.png"
theme.layout_cornerse = themes_path..current_theme.."/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
