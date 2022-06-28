local music = require("utils.music")
local modules = require("ui.modules")
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
local naughty = require("naughty")

-- Create textboxes
local statusbox = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Playing",
    font = "Open Sans 11",
})

local songwidget = wibox.widget({
    widget = wibox.widget.textbox,
    text = "Song",
    font = "Open Sans Bold 17",
    valign = "top",
})

local albumwidget = wibox.widget({
    widget = wibox.widget.textbox,
    text = "From album name",
    font = "Open Sans 12",
    forced_height = 80,
    valign = "bottom",
})

local artistwidget = wibox.widget({
    widget = wibox.widget.textbox,
    text = "By Unknown Artist",
    font = "Open Sans Semibold 13",
    forced_height = 115,
    valign = "bottom",
})

local previcon = wibox.widget({
    {
        widget = wibox.widget.imagebox,
        resize = true,
        opacity = .75,
        forced_height = 10,
        valign = "bottom",
        image = beautiful.icon_previous,
    },
    widget = wibox.container.margin,
    left = 10,
    right = 10,
    bottom = 25,
})
local playicon = wibox.widget({
    widget = wibox.widget.imagebox,
    resize = true,
    opacity = .85,
    forced_height = 10,
    valign = "center",
    image = beautiful.icon_play,
})
local skipicon = wibox.widget({
    {
        widget = wibox.widget.imagebox,
        resize = true,
        opacity = .75,
        forced_height = 10,
        valign = "top",
        image = beautiful.icon_skip,
    },
    widget = wibox.container.margin,
    left = 10,
    right = 10,
    top = 25,
})

local icons = wibox.widget({
    {
        widget = skipicon,
        halign = "center",
        buttons = {
            awful.button({}, 1, nil, music.next_song)
        },
    },
    {
        {
            widget = playicon,
            halign = "center",
            buttons = {
                awful.button({}, 1, nil, music.toggle_music)
            },
        },
        widget = wibox.container.margin,
        margins = 2,
    },
    {
        widget = previcon,
        halign = "center",
        buttons = {
            awful.button({}, 1, nil, music.previous_song)
        },
    },
    layout = wibox.layout.flex.vertical,
})

local testbox = wibox.widget({
    layout = wibox.layout.ratio.horizontal,
    {
        { -- upper widgets
            statusbox,
            songwidget,
            layout = wibox.layout.align.vertical,
        },
        { --lower widgets
            albumwidget,
            artistwidget,

            layout = wibox.layout.fixed.vertical,
        },
        forced_height = 200,
        layout = wibox.layout.flex.vertical,
    },
    icons,
})
testbox:ajust_ratio(2, 0.80, 0.20, 0)

local albumcover = wibox.widget({
    widget = wibox.widget.imagebox,
    image = nil,
    opacity = 0.15,
    halign = "center",
    forced_height = 200,
    forced_width = 200,
    resize = false,
})

local box_content = wibox.widget({
    albumcover,
    {
        testbox,
        widget = wibox.container.margin,
        margins = 20,
    },
    layout = wibox.layout.stack,
})

awesome.connect_signal("signal::music", function(song, artist, album, arturl, playing, paused)
    if playing then
        statusbox:set_text("Playing")
        playicon:set_image(beautiful.icon_pause)
    elseif paused then
        statusbox:set_text("Paused")
        playicon:set_image(beautiful.icon_play)
    else
        statusbox:set_text("Stopped")
        songwidget:set_text("Music player")
        artistwidget:set_text("No music currently playing.")
        albumwidget:set_visible(false)
        icons:set_visible(false)
        albumcover:set_image(nil)
        return
    end
    songwidget:set_text(song)
    artistwidget:set_text("By " .. artist)
    albumwidget:set_text("Album - " .. album)
    albumwidget:set_visible(true)
    icons:set_visible(true)
    if arturl:sub(0, 7) == "file://" then
        albumcover:set_image(arturl:sub(8, -1))
    else
        albumcover:set_image(arturl)
    end
end)

local rambox = {
    box_content,
    widget = wibox.container.background,
    bg = beautiful.bg_normal,
    shape = modules.widget_rect,
}

return rambox
