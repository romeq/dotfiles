vim.g.startup_bookmarks = {
    ["A"] = '~/.config/alacritty/alacritty.toml',
    ["I"] = '~/.config/i3/config',
    ["Q"] = '~/.config/nvim/init.lua',
    ["Z"] = '~/.zshrc',
    ["X"] = '~/.xinitrc',
}

require "startup".setup()
