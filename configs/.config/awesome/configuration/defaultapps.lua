defaultapps = {
    default = {
        terminal = "alacritty",
        web_browser = "firefox",
        app_launcher = "dmenu_run -sb \"#3c3836\" -sf \"#ebdbb2\"",
    },
    util = {
        screenshot = "flameshot gui",
        volumeup = "pactl set-sink-volume @DEFAULT_SINK@ +5%",
        volumedown = "pactl set-sink-volume @DEFAULT_SINK@ -5%",
    },
}

return defaultapps
