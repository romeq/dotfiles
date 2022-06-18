pcall(require, "luarocks.loader")

gears = require("gears")
awful = require("awful")
beautiful = require("beautiful")

-- basic configuration
require("configuration")

-- signals
require("signal")

-- ui related stuff
require("ui")

