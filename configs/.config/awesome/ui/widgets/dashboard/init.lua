local wibox = require("wibox")

-- boxed widgets
local rambox = require("ui.widgets.dashboard.rambox")
local weatherbox = require("ui.widgets.dashboard.weatherbox")
local wifibox = require("ui.widgets.dashboard.wifibox")
local vpnbox = require("ui.widgets.dashboard.vpnbox")
local music = require("ui.widgets.dashboard.music")
local statusboxes = require("ui.widgets.dashboard.statusboxes")

local widget_container = wibox.widget({
    layout = wibox.layout.grid,
    spacing = 10,
    forced_num_cols = 2,
    vertical_homogeneous = false,
    expand = true,
})

widget_container:add_widget_at(rambox, 1, 1)
widget_container:add_widget_at(weatherbox, 1, 2)
widget_container:add_widget_at(wifibox, 2, 1, 1, 1)
widget_container:add_widget_at(vpnbox, 5, 2, 1, 1)
widget_container:add_widget_at(music, 3, 1, 3, 1)
widget_container:add_widget_at(statusboxes, 2, 2, 3, 1)

local dashboard_items = {
    {
        widget_container,

        -- TODO add some widgets maybe
        layout = wibox.layout.align.vertical,
    },

    -- Margin
    widget = wibox.container.margin,
    margins = 15,
}

return {
    widget_container = dashboard_items,
    clock = require("ui.widgets.dashboard.clock"),
}
