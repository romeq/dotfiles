local wibox = require("wibox")

awful.screen.connect_for_each_screen(function(s)
    -- Set wallpaper
    set_wallpaper(s)

    -- Each screen has its own tag table.
    awful.tag({"1", "2", "3", "4", "5", "6", "7", "8", "9"}, s, awful.layout.layouts[1])

    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style   = {
            shape = gears.shape.circle,
        },
        widget_template = {
            {
                {
                    {
                        widget = wibox.container.margin,
                        margins = 5,
                    },
                    widget = wibox.container.background,
                    id = "background_role",
                },
                margins  = 5,
                left = 6,
                right = 6,
                widget = wibox.container.margin,
            },
            widget = wibox.container.margin,
            top = 4,
            bottom = 4,
        },
        buttons = {
            awful.button({ }, 1, function(t)
                t:view_only()
                awesome.emit_signal("signal::tag_changed", index)
            end),
            awful.button({ modkey }, 1, function(t)
                if client.focus then
                    client.focus:move_to_tag(t)
                end
            end),
            awful.button({ }, 3, awful.tag.viewtoggle),
            awful.button({ modkey }, 3, function(t)
                if client.focus then
                    client.focus:toggle_tag(t)
                end
            end),
            awful.button({ }, 4, function(t) awful.tag.viewprev(t.screen) end),
            awful.button({ }, 5, function(t) awful.tag.viewnext(t.screen) end),
        }
    }

    -- Create the bar
    s.mywibox = awful.wibar({
        position = "top",
        height = 50,
        bg = beautiful.bg_widget .. "00",
        screen = s,
    })

    local clock = wibox.widget{
        widget = box_rounded({
            widget = wibox.widget.textclock,
            format = "%H:%M",
        }, nil, nil),
        buttons = {
            awful.button({}, 1, nil, function()
                dashboard:toggle()
            end)
        },
    }

    -- Add widgets to the wibox
    s.mywibox:setup {
        {
            {
                layout = wibox.layout.align.horizontal,
                expand = "none",
                { -- Left widgets
                    {
                        layout = wibox.layout.fixed.horizontal,
                        {
                            {
                                {
                                    s.mytaglist,
                                    widget = wibox.container.margin,
                                    left = 3,
                                    top = -1,
                                    bottom = -1,
                                    right = 3,
                                },
                                widget = wibox.container.background,
                                bg = beautiful.bg_normal,
                                fg = beautiful.fg_secondary,
                                shape = widget_rect,
                            },
                            widget = wibox.container.margin,
                            top = 5,
                            bottom = 5,
                            left = 2,
                        },
                    },
                    widget = wibox.container.margin,
                    left = 3,
                },
                clock,
                { -- Right widgets
                    {
                        layout = wibox.layout.fixed.horizontal,
                        box_rounded(wibox.widget.systray(), beautiful.bg_secondary, beautiful.fg_secondary),
                    },
                    widget = wibox.container.margin,
                    right = 3
                },
            },
            widget = wibox.container.background,
            shape = widget_rect,
            bg = beautiful.bg_widget,
        },
        widget = wibox.container.margin,
        left = 10,
        right = 10,
        top = 10,
    }
end)
