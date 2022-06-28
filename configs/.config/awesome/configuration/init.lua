local awful = require("awful")
local beautiful = require("beautiful")
local gears = require("gears")
local wibox = require("wibox")

require("awful.autofocus")
require("configuration.errorhandling")
require("configuration.defaultapps")
require("configuration.mainmenu")
require("configuration.keybindings")

current_theme = "gruvbox"
beautiful.init("~/.config/awesome/themes/"..current_theme.."/theme.lua")

-- Layouts
awful.layout.layouts = {
    awful.layout.suit.tile,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
}

root.buttons(awful.button({ }, 3, function() mymainmenu:toggle() end ))

awful.rules.rules = {
    { rule = { },
      properties = { border_wgdth = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
     }
    },

    { rule_any = {type = { "normal", "dialog" }
      }, properties = { titlebars_enabled = true }
    },

}

function set_wallpaper(s)
    awful.wallpaper {
        screen = s,
        bg = beautiful.bg_wallpaper,
        widget = {
            {
                image = beautiful.wallpaper,
                resize = true,
                widget = wibox.widget.imagebox,
            },
            valign = "center",
            halign = "center",
            tiled = false,
            widget = wibox.container.tile,
        },
    }
end

screen.connect_signal("request::wallpaper", set_wallpaper)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)
client.connect_signal("manage", function (c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)
