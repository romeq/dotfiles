local colors = {
  black        = '#151515',
  white        = '#888888',
  red          = '#fb4934',
  green        = '#b8bb26',
  blue         = '#83a598',
  yellow       = '#fe8019',
  gray         = '#555555',
  darkgray     = '#1a1a1a',
  lightgray    = '#333333',
  inactivegray = '#252525',
}

local colorscheme = {
  normal = {
    a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
    b = {bg = colors.lightgray, fg = colors.white},
    c = {bg = colors.darkgray, fg = colors.gray}
  },
}

local function get_line_count()
    return vim.api.nvim_buf_line_count(0)
end

require('lualine').setup({
    options = {
        theme = colorscheme,
        icons_enabled = false,
        component_separators = { left = '-', right = '-'},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'hostname'},
        lualine_y = {},
        lualine_z = {'location', get_line_count},
    },
    tabline = {},
    extensions = {}
})
