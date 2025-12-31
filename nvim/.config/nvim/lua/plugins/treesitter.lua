return {
  {
    'nvim-treesitter/nvim-treesitter',
    cmd = { 'TSInstall', 'TSBufEnable', 'TSBufDisable', 'TSModuleInfo' },
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require('nvim-treesitter').setup({
        ensure_installed = {
          'bash',
          'c',
          'cpp',
          'css',
          'c_sharp',
          'elixir',
          'erlang',
          'heex',
          'html',
          'gitcommit',
          'go',
          'gomod',
          'gosum',
          'groovy',
          'javascript',
          'java',
          'json',
          'lua',
          'markdown',
          'markdown_inline',
          'python',
          'rust',
          'typescript',
          'vim',
          'vimdoc',
          'yaml',
          'zig',
        },

        sync_install = false,
        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            scope_incremental = '<S-CR>',
            node_decremental = '<BS>',
          },
        },
      })
    end,
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('treesitter-context').setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          multiline_threshold = 1,
        },
      })
    end,
  },
  {
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
    config = function()
      local rainbow_delimiters = require('rainbow-delimiters')

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
        },
        -- highlight = rainbow_highlight_names,
      }
    end,
  },
}
