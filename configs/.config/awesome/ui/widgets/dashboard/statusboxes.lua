local modules = require("ui.modules")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

local cpuchart = wibox.widget({
    {
        {
            widget = wibox.widget.textbox,
            text = "",
            align = "center",
            font = "Open Sans Semibold 24",
        },
        widget = wibox.container.mirror,
        reflection = {
            horizontal = true,
            vertical = false,
        },
    },
    widget = wibox.container.arcchart,
    value = 20,
    max_value = 100,
    forced_height = 20,
    thickness = 7,
    rounded_edge = true,
    start_angle = 1.5*math.pi,
    colors = {
        beautiful.fg_green,
    },
    bg = beautiful.bg3,
})

local cpuusage = wibox.widget({
    {
        cpuchart,
        widget = wibox.container.mirror,
        reflection = {
            horizontal = true,
            vertical = false,
        },
    },
    widget = wibox.container.margin,
    margins = 35,
})

awesome.connect_signal("signal::cpu", function(usage)
    cpuchart:set_value(usage)
end)


local slidercontainer = wibox.widget({
    {
        cpuusage,
        widget = wibox.container.margin,
        margins = 15,
    },
    widget = wibox.container.background,
    bg = beautiful.bg_normal,
    shape = modules.widget_rect,
})

return slidercontainer
