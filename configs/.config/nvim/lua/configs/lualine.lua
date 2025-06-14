local colors = {
    white     = "#727272",
    green     = "#88ad5f",
    blue      = "#4587BA",
    darkgray  = "#1a1a1a",
    lightgray = "#333333",
    gray      = "#222222",
}

local colorscheme = {
    normal = {
        a = { bg = colors.gray, fg = colors.green },
        b = { bg = colors.gray, fg = colors.white },
        c = { bg = colors.darkgray, fg = colors.white },
        x = { bg = colors.darkgray, fg = colors.white },
        y = { bg = colors.gray, fg = colors.white },
        z = { bg = colors.lightgray, fg = colors.white },
    },
    insert = {
        a = { bg = colors.lightgray, fg = colors.blue },
    }
}

local function get_line_count()
    return vim.api.nvim_buf_line_count(0) .. " lines"
end

require("lualine").setup({
    options = {
        theme = colorscheme,
        component_separators = { left = "", right = "|" },

        section_separators = { left = '', right = '' },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { "filename" },
        lualine_c = { "lsp_status", "diagnostics" },
        lualine_x = { "diff", "branch" },
        lualine_y = { "location" },
        lualine_z = { { get_line_count, separator = { right = '' }, left_padding = 2 } },
    },
    tabline = {},
    extensions = {}
})
