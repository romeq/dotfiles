local lushwright = require("shipwright.transform.lush")
run(require("dark.lua.lush_theme.dark"),
    lushwright.to_vimscript,
    {overwrite, "colors/dark.vim"})
