local gears = require("gears")
local naughty = require("naughty")
local awful = require("awful")

local function callback()
    local command = [[ awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' \
<(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat) ]]
    awful.spawn.easy_async_with_shell(command, function(out)
        awesome.emit_signal("signal::cpu", out)
    end)
end

awesome.connect_signal("startup", function()
    gears.timer {
        timeout = 1.5,
        call_now = true,
        autostart = true,
        callback = callback,
    }
end)

