local modules = require("ui.modules")
local wibox = require("wibox")
local beautiful = require("beautiful")

-- Create textboxes
local weather_title = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Weather",
    font = "Open Sans Semibold 13",
})

local weather_temp = wibox.widget({
    widget = wibox.widget.textbox,
    text = "0°",
    font = "Open Sans Bold 25",
    forced_height = 50,
})

local weather_feelslike = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Highest 0°",
    font = "Open Sans 10",
})

local weather_description = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Sunny",
    font = "Open Sans 11",
})

local weathericon = wibox.widget({
    widget = wibox.widget.imagebox,
    resize = true,
    forced_width = 10,
    forced_height = 10,
    image = beautiful.icon_weather,
})

local testbox = wibox.widget({
    layout = wibox.layout.ratio.horizontal,
    inner_fill_strategy = "inner_spacing",
    {
        layout = wibox.layout.align.vertical,
        weather_temp,
        weather_feelslike,
    },
    weathericon,
})

testbox:ajust_ratio(1, 0, 0.50, 0.15)
awesome.connect_signal("signal::weather", function(weatherdata)
    -- Update textbox values
    weather_title:set_text("Weather in " .. weatherdata.location)
    weather_description:set_text(weatherdata.description)
    weather_temp:set_text(tostring(weatherdata.temp).."°")
    weather_feelslike:set_text(
        "Feels like " .. tostring(weatherdata.feelslike) .. "°"
    )
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
                        weather_title,
                        weather_description,
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
    shape = modules.widget_rect,
}

return rambox
