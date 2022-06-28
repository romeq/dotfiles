local gears = require("gears")
local beautiful = require("beautiful")
local wibox = require("wibox")

local widget_rect = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 10)
end

local widget_bar = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, 5)
end

local box_rounded = function(w,bg,fg)
    bg = bg or beautiful.bg_normal
    fg = fg or beautiful.fg_normal
    return wibox.widget({
        {
            {
                w,
                widget = wibox.container.margin,
                left = 10,
                right = 10,
            },
            widget = wibox.container.background,
            shape = widget_rect, bg = bg, fg = fg,
        },
        widget = wibox.container.margin,
        top = 5,
        bottom = 5,
        left = 3,
        right= 3
    })
end

return {
    box_rounded = box_rounded,
    widget_bar = widget_bar,
    widget_rect = widget_rect
}
