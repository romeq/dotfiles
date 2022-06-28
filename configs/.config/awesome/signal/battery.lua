local battery_utils = require("utils.battery")
local gears = require("gears")

awesome.connect_signal("startup", function()
    gears.timer {
        timeout = 2,
        call_now = true,
        autostart = true,
        callback = function()
            local capacity, status = battery_utils.get_battery()
            if capacity ~= nil and status ~= nil then
                awesome.emit_signal("signal::battery", capacity, status)
            end
        end,
    }
end)

