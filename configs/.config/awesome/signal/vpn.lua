local config = require("configuration/config")

local function update_vpn_data()
    local vpn_connected = false
    local fhandle = io.open("/sys/class/net/" .. config.vpn.interface .. "/operstate")
    if fhandle ~= nil then
        vpn_connected = true
    end

    awesome.emit_signal("signal::vpn", vpn_connected)
end

awesome.connect_signal("startup", function()
    gears.timer {
        timeout = 1,
        call_now = true,
        autostart = true,
        callback = update_vpn_data
    }
end)
