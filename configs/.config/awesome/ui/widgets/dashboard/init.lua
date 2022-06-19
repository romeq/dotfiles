local rambox = require("ui.widgets.dashboard.rambox")
local weatherbox = require("ui.widgets.dashboard.weatherbox")
local wifibox = require("ui.widgets.dashboard.wifibox")
local vpnbox = require("ui.widgets.dashboard.vpnbox")

local widget_container = {
    {
        -- Items
        rambox,
        weatherbox,
        wifibox,
        vpnbox,

        -- Layout properties
        layout = wibox.layout.grid,
        spacing = 10,
        forced_num_cols = 2,
        vertical_homogeneous = false,
        expand = true,
    },

    -- Margin
    widget = wibox.container.margin,
    margins = 10,
}

return {
    widget_container = widget_container,
    sliders = sliders,
    clock = require("ui.widgets.dashboard.clock"),
}
