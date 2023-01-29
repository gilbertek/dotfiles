-- Set lualine as statusline
-- See `:help lualine.txt`
local status_ok, custom_onedark = pcall(require, "lualine.themes.onedark")
local theme_color = 'auto'

if status_ok then
  theme_color = custom_onedark
end

require("lualine").setup{
  options = {
    theme = theme_color,
    globalstatus = true,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  }
}
