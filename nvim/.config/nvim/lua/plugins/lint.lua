return {
  {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        cpp = { 'cpplint' },
        c = { 'cpplint' },
      }
      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function() require('lint').try_lint() end,
      })
    end,
  },
-- does not work... kept as a record
{
  url = "https://gitlab.com/schrieveslaach/sonarlint.nvim",
  enable = false,
  ft = { "java" },
  dependencies = {
    "mfussenegger/nvim-jdtls",
  },
  config = function()
    local mason_path = os.getenv("MASON")
    local mason_bin_path = mason_path .. "/bin"
    require("sonarlint").setup({
      server = {
        cmd = {
          mason_bin_path .. "/sonarlint-language-server",
          "-stdio",
          "-analyzers",
          -- vim.fn.expand(mason_path .. "/share/sonarlint-analyzers/sonarpython.jar"),
          -- vim.fn.expand(mason_path .. "/share/sonarlint-analyzers/sonarcfamily.jar"),
          vim.fn.expand(mason_path .. "/share/sonarlint-analyzers/sonarjava.jar"),
        },
      },
      filetypes = {
        -- "python",
        -- "cpp",
        "java",
      },
    })
  end,
}
}
