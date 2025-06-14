require("crates").setup({
    smart_insert = true,
    autoload = true,
    autoupdate = true,
    loading_indicator = true,
    date_format = "%Y-%m-%d",
    text = {
        loading = "   Loading",
        version = "   %s",
        prerelease = "   %s",
        yanked = "   %s",
        nomatch = "   No match",
        upgrade = "   %s",
        error = "   Error fetching crate",
    },
    highlight = {
        loading = "CratesNvimLoading",
        version = "CratesNvimVersion",
        prerelease = "CratesNvimPreRelease",
        yanked = "CratesNvimYanked",
        nomatch = "CratesNvimNoMatch",
        upgrade = "CratesNvimUpgrade",
        error = "CratesNvimError",
    },
    popup = {
        autofocus = false,
        copy_register = '"',
        style = "minimal",
        border = "none",
        show_version_date = false,
        max_height = 30,
        min_width = 20,
        text = {
            title = "  %s ",
            version = "   %s ",
            prerelease = "  %s ",
            yanked = "  %s ",
            version_date = " %s ",
            feature = "   %s ",
            enabled = "  %s ",
            transitive = "  %s ",
        },
        highlight = {
            title = "CratesNvimPopupTitle",
            version = "CratesNvimPopupVersion",
            prerelease = "CratesNvimPopupPreRelease",
            yanked = "CratesNvimPopupYanked",
            feature = "CratesNvimPopupFeature",
            enabled = "CratesNvimPopupEnabled",
            transitive = "CratesNvimPopupTransitive",
        },
        keys = {
            hide = { "q", "<esc>" },
            select = { "<cr>" },
            select_alt = { "s" },
            copy_value = { "yy" },
            toggle_feature = { "<cr>" },
            goto_item = { "gd", "K" },
            jump_forward = { "<c-i>" },
            jump_back = { "<c-o>" },
        },
    },
})
