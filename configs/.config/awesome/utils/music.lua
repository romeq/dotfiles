local awful = require("awful")

local function toggle_music()
    awful.spawn([[ playerctl play-pause ]])
    awesome.emit_signal("signal::music_changed")
end

local function stop_music()
    awful.spawn([[ playerctl stop ]])
    awesome.emit_signal("signal::music_changed")
end

local function previous_song()
    awful.spawn([[ playerctl previous ]])
    awesome.emit_signal("signal::music_changed")
end

local function next_song()
    awful.spawn([[ playerctl next ]])
    awesome.emit_signal("signal::music_changed")
end

return {
    toggle_music = toggle_music,
    stop_music = stop_music,
    previous_song = previous_song,
    next_song = next_song,
}
