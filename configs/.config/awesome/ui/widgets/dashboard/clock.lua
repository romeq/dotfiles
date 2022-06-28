local wibox = require("wibox")
local beautiful = require("beautiful")

local greet = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Good morning.",
    font = "Open Sans Semibold 14",
    align = "center",
    valign = "top",
})

awesome.connect_signal("startup", function()
    local hour = tonumber(os.date("%H"))
    if hour >= 0 and hour <= 4 then
        greet:set_text("Good night!")
    elseif hour > 4 and hour < 12 then
        greet:set_text("Good morning!")
    elseif hour >= 12 and hour < 17 then
        greet:set_text("Have a great day!")
    else
        greet:set_text("Good afternoon!")
    end
end)


local clock = {
    {
        layout = wibox.layout.align.vertical,
        {
            {
                widget = wibox.widget.textclock,
                font = "Open Sans Bold 55",
                format = "%H %M",
                align = "center",
            },
            widget = wibox.container.background,
            fg = beautiful.fg_green,
        },
        {
            layout = wibox.layout.align.vertical,
            greet,
            {
                {
                    widget = wibox.widget.textclock,
                    format = "%A, %d. %B",
                    font = "Open Sans Semibold 12",
                    align = "center",
                    valign = "top",
                },
                widget = wibox.container.background,
                fg = beautiful.fg_secondary,
            },
        },
    },
    widget = wibox.container.margin,
    top = 45,
    bottom = 45,
}

return clock
