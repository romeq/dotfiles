local widgets = require("ui.widgets.dashboard")
local modules = require("ui.modules")
local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

awful.screen.connect_for_each_screen(function(s)
    local dashboard_width = dpi(550)

    local dashboard_item = {
        layout = wibox.layout.align.vertical,
        widgets.clock,
        widgets.widget_container,
    }

    dashboard = awful.popup {
		type = "normal",
        screen = s,
        minimum_width = dashboard_width,
        maximum_width = dashboard_width,
        x = s.geometry.x + s.geometry.width / 2 - dashboard_width / 2,
        y = dpi(50),
        bg = beautiful.bg_widget,
        visible = false,
		ontop = true,
        shape = modules.widget_rect,
        widget = dashboard_item
    }

    function dashboard.toggle()
        if dashboard.visible then
            dashboard.hide()
        else
            dashboard.show()
        end
    end

    function dashboard.show()
        dashboard.visible = true
        awesome.emit_signal("dashboard::shown")
    end

    function dashboard.hide()
        dashboard.visible = false
        awesome.emit_signal("dashboard::hidden")
    end

end)

awesome.connect_signal("signal::tag_changed", function()
    dashboard:hide()
end)

