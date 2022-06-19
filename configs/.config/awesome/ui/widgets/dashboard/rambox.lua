-- Create textboxes
local ram_textbox = wibox.widget({
    widget = wibox.widget.textbox,
    text = "0 GB",
    font = "Open Sans Bold 25",
    forced_height = 35,
})

local totalram = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Out of 8 GB",
    font = "Open Sans 10",
})

local pct_textbox = wibox.widget({
    widget = wibox.widget.textbox,
    text = "20% of memory used",
    font = "Open Sans 11",
})

-- Create circle graph
local circlegraph = wibox.widget({
    widget = wibox.container.arcchart,
    value = 0,
    max_value = 8,
    bg = beautiful.bg_graph,
    forced_height = 10,
    forced_width = 10,
    thickness = 5,
    rounded_edge = true,
    start_angle = 1.5*math.pi,
    colors = {
        beautiful.fg_orange,
    }
})

local testbox = wibox.widget({
    layout = wibox.layout.ratio.horizontal,
    inner_fill_strategy = "inner_spacing",
    {
        layout = wibox.layout.align.vertical,
        ram_textbox,
        totalram,
    },
    {
        circlegraph,
        widget = wibox.container.mirror,
        reflection = {
            horizontal = true,
            vertical = false,
        }
    }
})

testbox:ajust_ratio(1, 0, 0.50, 0.15)

awesome.connect_signal("signal::ram", function(total, used)
    -- Calculate percent
    local pct = math.floor((used / total) * 100)
    pct_textbox:set_text(tostring(pct) .. "% of memory used")

    -- Update textboxes
    ram_textbox:set_text(used .. " GB")
    totalram:set_text("Out of " .. math.floor(total) .. " GB")

    -- Update graph
    circlegraph:set_max_value(total)
    circlegraph:set_value(used)
end)


local rambox = {
    {
        {
            layout = wibox.layout.align.vertical,
            {
                {
                    layout = wibox.layout.align.vertical,
                    {
                        layout = wibox.layout.align.vertical,
                        {
                            widget = wibox.widget.textbox,
                            text = "Memory usage",
                            font = "Open Sans Semibold 13",
                        },
                        pct_textbox,
                    },
                },
                widget = wibox.container.margin,
                bottom = 25,
            },
            testbox
        },
        widget = wibox.container.margin,
        margins = 20,
    },
    widget = wibox.container.background,
    bg = beautiful.bg_normal,
    shape = widget_rect,
}

return rambox
