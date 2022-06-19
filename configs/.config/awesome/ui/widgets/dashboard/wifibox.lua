-- Textboxes
local wifi_title = wibox.widget({
    {
        widget = wibox.widget.textbox,
        text = "WiFi",
        font = "Open Sans Semibold 14",
    },
    id = "color",
    widget = wibox.container.background,
    fg = beautiful.fg_red,
})

local wifi_text = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Disconnected from WiFi",
    font = "Open Sans 11",
})

-- Automatic update
awesome.connect_signal("signal::wifi", function(connected, wifiname)
    if connected then
        wifi_title.fg = beautiful.fg_green
        wifi_text:set_text("Connected to " .. wifiname)
    else
        wifi_title.fg = beautiful.fg_red
        wifi_text:set_text("Disconnected from WiFi")
    end
end)

local wifibox = wibox.widget({
    {
        {
            layout = wibox.layout.align.vertical,
            wifi_title,
            wifi_text,
        },
        widget = wibox.container.margin,
        margins = 20,
    },
    widget = wibox.container.background,
    bg = beautiful.bg_normal,
    shape = widget_rect,
})
return wifibox
