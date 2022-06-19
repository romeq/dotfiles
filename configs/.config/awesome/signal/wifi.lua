local config = require("configuration/config")

local function update_wifi_data()
    local fhandle = io.open("/sys/class/net/" .. config.wifi.interface .. "/operstate")
    if fhandle == nil then
        return
    end
    local line = fhandle:read("l")
    fhandle:close()

    local file = assert(io.popen(
        "iw " .. config.wifi.interface .. " info | grep ssid | awk '{print $2}'",
        "r"
    ))
    local output = file:read("l")
    file:close()

    awesome.emit_signal("signal::wifi", line == "up", output)
end

awesome.connect_signal("startup", function()
    gears.timer {
        timeout = 1,
        call_now = true,
        autostart = true,
        callback = update_wifi_data
    }
end)
