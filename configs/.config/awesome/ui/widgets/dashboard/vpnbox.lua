-- Textboxes
local vpn_title = wibox.widget({
    {
        widget = wibox.widget.textbox,
        text = "VPN",
        font = "Open Sans Semibold 14",
    },
    id = "color",
    widget = wibox.container.background,
    fg = beautiful.fg_red,
})

local vpn_text = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Disconnected",
    font = "Open Sans 11",
})

-- Automatic update
awesome.connect_signal("signal::vpn", function(connected)
    if connected then
        vpn_title.fg = beautiful.fg_green
        vpn_text:set_text("Connected")
    else
        vpn_title.fg = beautiful.fg_red
        vpn_text:set_text("Disconnected from VPN")
    end
end)

local vpnbox = wibox.widget({
    {
        {
            layout = wibox.layout.align.vertical,
            vpn_title,
            vpn_text,
        },
        widget = wibox.container.margin,
        margins = 20,
    },
    widget = wibox.container.background,
    bg = beautiful.bg_normal,
    shape = widget_rect,
})
return vpnbox
