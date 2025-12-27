return {
  {
    'nvim-telescope/telescope.nvim',
    version = '0.2.0',
    branch = 'master',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        '<leader>sf',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Telescope find files',
      },
      {
        '<leader>sg',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Telescope live grep',
      },
      {
        '<leader>sb',
        function()
          require('telescope.builtin').buffers()
        end,
        desc = 'Telescope buffers',
      },
      {
        '<leader>sh',
        function()
          require('telescope.builtin').help_tags()
        end,
        desc = 'Telescope help tags',
      },
      {
        '<leader>st',
        function()
          require('telescope.builtin').git_files()
        end,
        desc = 'Telescope git files',
      },
      { '<leader>gd', '<cmd>Telescope lsp_definitions<CR>', desc = 'LSP definitions' },
      { '<leader>gr', '<cmd>Telescope lsp_references<CR>', desc = 'LSP references' },
      {
        '<leader>gi',
        function()
          require('telescope.builtin').lsp_implementations()
        end,
        desc = 'LSP implementations',
      },
      {
        '<leader>ps',
        function()
          local term = vim.fn.input('grep > ')
          if term ~= '' then
            require('telescope.builtin').grep_string({ search = term })
          end
        end,
        desc = 'Telescope grep string',
      },
      {
        '<leader>fa',
        function()
          require('telescope.builtin').find_files({ hidden = true, no_ignore = true })
        end,
        desc = 'Telescope find all files',
      },
    },
  },

  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup({
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      })
    end,
  },
}
