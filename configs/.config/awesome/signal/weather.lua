local config = require("configuration/config")
local request = require("http.request")
local lunajson = require("lunajson")
local gears = require("gears")
local naughty = require("naughty")

local function parse_weather(weatherjson)
    if not weatherjson then
        return nil
    end

    -- parse json
    local weather = nil
    local parsedjson = pcall(function()
        weather = lunajson.decode(weatherjson)
    end)
    if not parsedjson or not weather then
        return nil
    end

    -- try to parse weather from json object
    local parsed_weather = {}
    local parsing_succeeded = pcall(function()
        parsed_weather.location = weather.location.name
        parsed_weather.description = weather.current.condition.text
        parsed_weather.temp = math.floor(weather.current.temp_c)
        parsed_weather.feelslike = math.floor(weather.current.feelslike_c)
        parsed_weather.uv = weather.current.uv
    end)
    if not parsing_succeeded then
        return nil
    end

    -- only return needed stuff
    return parsed_weather
end

local function get_cached_weather()
    local cache_file = io.open(config.cache.weather)
    if not cache_file then
        return nil
    end

    local cached_weather = cache_file:lines(1024)()
    cache_file:close()

    return parse_weather(cached_weather)
end

-- Function to get weather
local function request_weather()
    local uri = "https://api.weatherapi.com/v1/current.json?q="
        .. config.weatherapi.city
        .. "&key="
        .. config.weatherapi.apikey

    -- Make request
    local headers, stream = request.new_from_uri(uri):go(1)
    if not headers or not stream then
        return nil
    end

    local body = stream:get_body_as_string()
    if headers:get(":status") ~= "200" then
        return nil
    end

    local parsed_weather = parse_weather(body)

    local cache_file = io.open(config.cache.weather, "w+")
    if not cache_file then
        naughty.notify({
            title = "Unable to update cache",
            text = "Couldn't open cache file to update new weather"
        })
        return nil
    end

    local write_status = cache_file:write(body)
    if not write_status then
        naughty.notify({
            title = "Unable to update cache",
            text = "Couldn't write to cache file"
        })
        return parsed_weather
    end

    return parsed_weather
    --]]
end

-- Callback to update weather
local function update_weather_callback()
    -- Request weather
    local weather = get_cached_weather()
    if not weather then
        weather = request_weather()
    end

    -- If request failed or timeout was reached
    if not weather then
        naughty.notify({
            title = "Couldn't update weather",
            text = "Updating current weather didn't succeed. "
                .. "Please make sure you got internet access and "
                .. "that you've updated your API key to configuration/config.lua.",
        })
        return
    end

    -- Emit awesome signal and pass weather as argument
    awesome.emit_signal("signal::weather", weather)
end

-- Update weather every 10 minutes and on awesome load
awesome.connect_signal("startup", function()
    gears.timer {
        timeout = 60*10,
        call_now = true,
        autostart = true,
        callback = update_weather_callback
    }
end)
