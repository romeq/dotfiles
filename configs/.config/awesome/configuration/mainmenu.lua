awful.screen.connect_for_each_screen(function(s)
    awesomemenu = {
        {"Hotkeys", function() hotkeys_popup.show_help(s) end },
        {"Manual", function() 
            awful.spawn(defaultapps.default.terminal .. " -e man awesome") 
        end },
        {"Restart", function() awesome.restart() end },
        {"Quit", function() awesome.quit() end },
    }

    mymainmenu = awful.menu({
        items = {
            {"AwesomeWM", awesomemenu, beautiful.awesome_icon }
        }
    })
end)
