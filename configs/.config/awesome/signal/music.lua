local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")

local function update_music_info()
    awful.spawn.easy_async_with_shell( [[ playerctl metadata xesam:title ]], function(title_stdout)
        awful.spawn.easy_async_with_shell( [[ playerctl metadata xesam:artist ]], function(artist_stdout)
            awful.spawn.easy_async_with_shell( [[ playerctl metadata xesam:album ]], function(album_stdout)
                awful.spawn.easy_async_with_shell( [[ playerctl metadata mpris:artUrl ]], function(arturl_stdout)
                    awful.spawn.easy_async_with_shell( [[ playerctl status ]], function(out)
                        local song = title_stdout:sub(1, -2)
                        local artist = artist_stdout:sub(1, -2)
                        local album = album_stdout:sub(1, -2)
                        local arturl = arturl_stdout:sub(1, -2)

                        local playerstatus = out:sub(1, -2)
                        local isplaying = playerstatus == "Playing"
                        local ispaused = playerstatus == "Paused"

                        if song == "" then song = nil end
                        if artist == "" then artist = nil end
                        if album == "" then album = nil end

                        awesome.emit_signal(
                            "signal::music",
                            song or "Unknown",
                            artist or "Unknown",
                            album or "Unknown",
                            arturl,
                            isplaying,
                            ispaused)
                    end)
                end)
            end)
        end)
    end)

end

awesome.connect_signal("signal::music_changed", update_music_info)

awesome.connect_signal("startup", function()
    gears.timer {
        timeout = 1,
        call_now = true,
        autostart = true,
        callback = update_music_info
    }
end)

