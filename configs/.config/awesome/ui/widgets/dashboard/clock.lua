local usernamegreet = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Good afternoon.",
    font = "Open Sans Semibold 14",
    align = "center",
    valign = "top",
})

awesome.connect_signal("startup", function()
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
            shape = widget_rect,
        },
        {
            layout = wibox.layout.align.vertical,
            usernamegreet,
            {
                {
                    widget = wibox.widget.textclock,
                    format = "It's %A, %d. %B",
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
    top = 25,
    bottom = 35,
}

return clock
