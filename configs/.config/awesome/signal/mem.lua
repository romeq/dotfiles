local utils = require("utils.mem")
local gears = require("gears")

awesome.connect_signal("startup", function()
    gears.timer {
        timeout = 1,
        call_now = true,
        autostart = true,
        callback = function()
            local total, used = utils.memory_usage_gib()
            if total and used then
                awesome.emit_signal("signal::ram", total, used)
            end
        end,
    }
end)

