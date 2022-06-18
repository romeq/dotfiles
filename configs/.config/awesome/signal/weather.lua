local config = require("configuration/config")
local request = require("http.request")
local json = require("lunajson")

local function get_weather()
    local uri = "https://api.weatherapi.com/v1/current.json?q="
        .. config.weatherapi.city
        .. "&key="
        .. config.weatherapi.apikey

    local headers, stream = assert(request.new_from_uri(uri):go())
    local body = assert(stream:get_body_as_string())
    if headers:get ":status" ~= "200" then
        return {
            location = "Unknown",
            description = "Unknown",
            temp = 0,
            feelslike = 0,
        }
    end
    local weather = json.decode(body)

    return {
        location = weather.location.name,
        description = weather.current.condition.text,
        temp = math.floor(weather.current.temp_c),
        feelslike = math.floor(weather.current.feelslike_c),
    }
end

local function update_weather()
    local weather = get_weather()
    awesome.emit_signal("signal::weather", weather)
end

awesome.connect_signal("startup", function()
    gears.timer {
        timeout = 60*10, -- 10 minutes
        call_now = true,
        autostart = true,
        callback = update_weather
    }
end)
