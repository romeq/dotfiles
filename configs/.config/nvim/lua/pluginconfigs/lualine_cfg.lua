local colors = {
  white        = "#9f9f9f",
  green        = "#88ad5f",
  blue         = "#ba7744",
  darkgray     = "#1a1a1a",
  lightgray    = "#333333",
  gray         = "#222222",
}

local colorscheme = {
  normal = {
    a = {bg = colors.lightgray, fg = colors.green},
    b = {bg = colors.gray, fg = colors.white},
    c = {fg = colors.white},
    x = {fg = colors.white},
    y = {bg = colors.gray, fg = colors.white},
    z = {bg = colors.lightgray, fg = colors.white},
  },
  insert = {
    a = {bg = colors.lightgray, fg = colors.blue},
  }
}

local function get_line_count()
    return "total: "..vim.api.nvim_buf_line_count(0)
end

require("lualine").setup({
    options = {
        theme = colorscheme,
        icons_enabled = false,
        component_separators = { left = "-", right = "-"},
        section_separators = { left = "", right = ""},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"hostname"},
        lualine_y = {},
        lualine_z = {"location", get_line_count},
    },
    tabline = {},
    extensions = {}
})
