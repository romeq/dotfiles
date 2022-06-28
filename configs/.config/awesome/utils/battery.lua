local config = require("configuration/config")

local function read_line_from_file(filename)
    local file = io.open(filename)
    if file == nil then
        return nil
    end
    local line = file:read("l")
    file:close()
    return line
end

local function get_battery()
    local battery_capacity = read_line_from_file("/sys/class/power_supply/" .. config.battery .. "/capacity")
    local battery_status = read_line_from_file("/sys/class/power_supply/" .. config.battery .. "/status")

    return tonumber(battery_capacity), battery_status
end

return {
    get_battery = get_battery
}
