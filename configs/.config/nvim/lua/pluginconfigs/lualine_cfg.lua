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
    c = {bg = colors.darkgray, fg = colors.white},
    x = {bg = colors.darkgray, fg = colors.white},
    y = {bg = colors.gray, fg = colors.white},
    z = {bg = colors.lightgray, fg = colors.white},
  },
  insert = {
    a = {bg = colors.lightgray, fg = colors.blue},
  }
}

local function get_line_count()
    return vim.api.nvim_buf_line_count(0)
end

require("lualine").setup({
    options = {
        theme = colorscheme,
        component_separators = { left = "", right = "/"},
        section_separators = { left = "", right = ""},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"filename"},
        lualine_c = {"filesize"},
        lualine_x = {},
        lualine_y = {"diff", "branch"},
        lualine_z = {"location", get_line_count},
    },
    tabline = {},
    extensions = {}
})
