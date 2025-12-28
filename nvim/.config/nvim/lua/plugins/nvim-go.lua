return {
  -- Doc is go-nvim
  -- https://github.com/ray-x/go.nvim/issues/595
  'ray-x/go.nvim',
  dependencies = { -- optional packages
    'ray-x/guihua.lua',
    'neovim/nvim-lspconfig',
    'nvim-treesitter/nvim-treesitter',
  },
  enabled = false,
  keys = {},
  config = function()
    require('go').setup({
      -- Verbose writes log to $HOME/tmp/gonvim.log. Ideally it should write to
      -- $HOME/.cache/* like the other logs
      -- verbose = true,

      -- Write to floatterm. Setting it false writes to quickfix list which causes
      -- weired issue where :GoRun<cr> opens a command window and then another in quickfix list
      -- FIXME: floaterm and quickfix both are looking odd
      -- run_in_floaterm = true,
    })
  end,
  event = { 'CmdlineEnter' },
  ft = { 'go', 'gomod' },
  build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}
