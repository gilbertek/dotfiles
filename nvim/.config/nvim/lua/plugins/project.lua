return {
  'DrKJeff16/project.nvim',
  -- Use "dir" for testing local plugin. Use :Lazy to check where plugin was loaded
  -- dir = "<local directory>",
  -- dev = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'ibhagwan/fzf-lua',
  },
  config = function()
    -- https://github.com/DrKJeff16/project.nvim/issues/24
    vim.g.project_lsp_nowarn = 1
    require('project').setup({
      -- NOTE:
      -- CWD switches back to the previous project if the selected project root cannot be found.
      -- LSP is loaded asynchrously so it's always going to fail to find the root on the
      -- initial load.
      --
      -- Operation steps:
      --    buffer 1: initial buffer
      --    telescope project list popup
      --    project selection -> changes currently working directory
      --    telescope project *file* list
      --    select a file
      --    buffer open buffer 1 -> AutoCommand on_buf_enter (iterates detection methods)
      --    buffer open buffer 2 -> AutoCommand on_buf_enter (iterates detection methods)
      -- NOTE: detection_methods is deprecated
      -- detection_methods = { "pattern", "lsp" },
      use_lsp = false,
      -- silent_chdir = false, -- for debugging
      patterns = {
        '.git',
        '.obsidian',
        'go.mod',
      },
    })
    require('telescope').load_extension('projects')

    local exts = require('telescope').extensions
    vim.keymap.set('n', '<leader>sp', exts.projects.projects, { desc = '[S]earch [P]rojects' })
  end,
  -- opts = {},
}
