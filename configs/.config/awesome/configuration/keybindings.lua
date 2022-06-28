local defaultapps = require("configuration.defaultapps")
local hotkeys_popup = require("awful.hotkeys_popup")
local awful = require("awful")
local music_utils = require("utils.music")

local modkey = "Mod4"
local alt = "Mod1"

awful.keyboard.append_global_keybindings({
    awful.key({ modkey, "Shift" },  "s", function() hotkeys_popup.show_help() end,
    {description="show help", group="awesome"}),

    awful.key({ modkey }, "Left", awful.tag.viewprev,
        {description = "view previous", group = "tag"}),

    awful.key({ modkey }, "Right",
        awful.tag.viewnext,
        {description = "view next", group = "tag"}),

    awful.key({ modkey }, "Escape",
        awful.tag.history.restore,
        {description = "go back", group = "tag"}),

    awful.key({ modkey }, "j", function ()
        awful.client.focus.byidx( 1)
    end, {description = "focus next by index",   group = "client"}),

    awful.key({ modkey }, "k", function ()
        awful.client.focus.byidx(-1)
    end, {description = "focus previous by index", group = "client"}),

    awful.key({ modkey }, "w", function ()
        mymainmenu:show()
    end, {description = "show main menu", group = "awesome"}),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function ()
        awful.client.swap.byidx(  1)
     end, {description = "swap with next client by index", group = "client"}),

    awful.key({ modkey, "Shift"   }, "k", function ()
        awful.client.swap.byidx( -1)
    end, {description = "swap with previous client by index", group = "client"}),

    awful.key({ modkey, "Control" }, "j", function ()
        awful.screen.focus_relative( 1)
    end, {description = "focus the next screen", group = "screen"}),

    awful.key({ modkey, "Control" }, "k", function ()
        awful.screen.focus_relative(-1)
    end, {description = "focus the previous screen", group = "screen"}),

    awful.key({ modkey }, "u",
        awful.client.urgent.jumpto,
        {description = "jump to urgent client", group = "client"}),

    awful.key({ modkey }, "Tab", function ()
        awful.client.focus.history.previous()
        if client.focus then
            client.focus:raise()
        end
    end, {description = "go back", group = "client"}),

    -- Standard program
    awful.key({ modkey, "Shift" }, "d", function()
        dashboard:toggle()
    end, {description = "show dashboard", group = "hotkey"}),

    awful.key({ modkey, "Shift" }, "a", function()
        awful.spawn(defaultapps.default.web_browser .. "\"https://open.spotify.com\"")
    end, {description = "open spotify in default browser", group="hotkey"}),

    awful.key({ modkey, "Shift" }, "w", function()
        awful.spawn(defaultapps.default.web_browser)
    end, {description = "open default browser", group="hotkey"}),

    awful.key({ modkey }, "Return", function()
        awful.spawn(defaultapps.default.terminal)
    end, {description = "open a terminal", group = "launcher"}),

    awful.key({}, "XF86AudioRaiseVolume", function()
        awful.spawn(defaultapps.util.volumeup)
    end, { description = "Raise volume", group = "pulseaudio"}),

    awful.key({}, "XF86AudioLowerVolume", function ()
        awful.spawn(defaultapps.util.volumedown)
    end, { description = "Lower volume", group = "pulseaudio"}),

    awful.key({ modkey }, "s", function ()
        awful.spawn(defaultapps.util.screenshot)
    end, {description = "take screenshot", group="script"}),

    awful.key({ modkey, "Control" }, "r",
        awesome.restart,
        {description = "reload awesome", group = "awesome"}),

    awful.key({ modkey, "Shift" }, "q",
        awesome.quit,
        {description = "quit awesome", group = "awesome"}),

    awful.key({ modkey }, "l", function ()
        awful.tag.incmwfact( 0.05)
    end, {description = "increase master width factor", group = "layout"}),

    awful.key({ modkey }, "h", function ()
        awful.tag.incmwfact(-0.05)
    end, {description = "decrease master width factor", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "h", function ()
        awful.tag.incnmaster( 1, nil, true)
    end, {description = "increase the number of master clients", group = "layout"}),

    awful.key({ modkey, "Shift"   }, "l", function ()
        awful.tag.incnmaster(-1, nil, true)
    end, {description = "decrease the number of master clients", group = "layout"}),

    awful.key({ modkey, "Control" }, "h", function ()
        awful.tag.incncol( 1, nil, true)
    end, {description = "increase the number of columns", group = "layout"}),

    awful.key({ modkey, "Control" }, "l", function ()
        awful.tag.incncol(-1, nil, true)
    end, {description = "decrease the number of columns", group = "layout"}),

    awful.key({ modkey, "Shift" }, "space", function ()
        awful.layout.inc(-1)
    end, {description = "select previous", group = "layout"}),

    awful.key({ modkey }, "space", function ()
        awful.layout.inc( 1)
    end, {description = "select next", group = "layout"}),

    awful.key({ modkey, "Shift" }, "n", function ()
        local c = awful.client.restore()
        if c then
          c:emit_signal(
              "request::activate", "key.unminimize", {raise = true}
          )
        end
    end, {description = "restore minimized", group = "client"}),

    awful.key({ modkey }, "r", function ()
        awful.spawn(defaultapps.default.app_launcher) 
    end, {description = "run prompt", group = "launcher"}),

    awful.key({}, "XF86MonBrightnessUp", function()
        awful.spawn("brightnessctl s +3%")
    end),

    awful.key({}, "XF86MonBrightnessDown", function()
        awful.spawn("brightnessctl s 3%-")
    end),

    awful.key({}, "XF86AudioPlay", music_utils.toggle_music),
    awful.key({}, "XF86AudioStop", music_utils.stop_music),
    awful.key({}, "XF86AudioPrev", music_utils.previous_song),
    awful.key({}, "XF86AudioNext", music_utils.next_song)

})

client.connect_signal("manage", function()
    awful.keyboard.append_client_keybindings({
        -- client keybindings
        awful.key({ modkey }, "f", function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end, {description = "toggle fullscreen", group = "client"}),

        awful.key({ modkey }, "q", function (c)
            c:kill()
        end, {description = "close", group = "client"}),

        awful.key({ modkey }, "n", function(c)
            c.minimized = true
        end, {description = "minimize", group = "client"}),

        awful.key({ modkey }, "m", function (c)
            c.maximized = not c.maximized
            c:raise()
        end, {description = "(un)maximize", group = "client"}),

        awful.key({ modkey, "Control" }, "m", function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
        end, {description = "(un)maximize vertically", group = "client"}),

        awful.key({ modkey, "Shift" }, "m", function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
        end, {description = "(un)maximize horizontally", group = "client"}),

        awful.key({ modkey, "Shift" }, "Return", function (c)
            c:swap(awful.client.getmaster())
        end, {description = "move to master", group = "client"}),

        awful.key({ modkey }, "o", function (c)
            c:move_to_screen()
        end, {description = "move to screen", group = "client"}),

        awful.key({ modkey }, "t", function (c)
            c.ontop = not c.ontop
        end, {description = "toggle keep on top", group = "client"}),

        awful.key({ modkey, "Shift" }, "f",
            awful.client.floating.toggle,
            {description = "toggle floating", group = "client"}),

    })
end)

awful.keyboard.append_global_keybindings({
	awful.key({ modkey, alt }, "Left",
        awful.tag.viewprev, { description = "view previous", group = "tags" }),

	awful.key({ modkey, alt }, "Right",
        awful.tag.viewnext, { description = "view next", group = "tags" }),

	awful.key({
		modifiers = { modkey },
		keygroup = "numrow",
		description = "only view tag",
		group = "tags",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				tag:view_only()
                awesome.emit_signal("signal::tag_changed", index)
			end
		end,
	}),

	awful.key({
		modifiers = { modkey, "Control" },
		keygroup = "numrow",
		description = "toggle tag",
		group = "tags",
		on_press = function(index)
			local screen = awful.screen.focused()
			local tag = screen.tags[index]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end,
	}),

	awful.key({
		modifiers = { modkey, "Shift" },
		keygroup = "numrow",
		description = "move focused client to tag",
		group = "tags",
		on_press = function(index)
			if client.focus then
				local tag = client.focus.screen.tags[index]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end,
	}),
})
client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)
