return {
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    config = function()
      require('lualine').setup({
        options = {
          icons_enabled = true,
          theme = 'nord', -- Set theme based on environment variable
          -- Some useful glyphs:
          -- https://www.nerdfonts.com/cheat-sheet
          --        
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          disabled_filetypes = { 'alpha', 'neo-tree' },
          always_divide_middle = true,
        },
      })
    end,
  },
  {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
  },
  {
    -- Hints keybinds
    'folke/which-key.nvim',
  },
}
