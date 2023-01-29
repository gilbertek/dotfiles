-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
require('indent_blankline').setup({
  char = "│",
  context_char = "│",
  show_current_context = true,
  show_trailing_blankline_indent = false,
  use_treesitter = true,
})
