local utils = require("utils")

awesome.connect_signal("startup", function()
    gears.timer {
        timeout = 1,
        call_now = true,
        autostart = true,
        callback = function()
            local total, used = utils.mem.memory_usage_gib()
            if total ~= nil and used ~= nil then
                awesome.emit_signal("signal::ram", total, used)
            end
        end,
    }
end)

