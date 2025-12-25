-- https://github.com/stevearc/conform.nvim
-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
  },
  opts = {
    log_level = vim.log.levels.DEBUG,
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 1500,
          lsp_format = "fallback",
        }
      end
    end,
    -- NOTE: Some LSPs may provide formatting capability out of the box
    -- yamlls, for example, has yaml.format.enable config
    formatters_by_ft = {
      lua = { "stylua" },
      go = { "gofumpt", "goimports" },
      sh = { "shellcheck", "shfmt" },
      -- Conform can also run multiple formatters sequentially
      -- python = { "autoflake", "isort", "black" },

      -- note: JDTLS also comes with format option enabled by default
      -- See LSP settings.java.format
      java = {},

      -- yaml = { "yamlfmt" },
      -- Install https://github.com/fsouza/prettierd
      svelte = { "prettierd" },
      css = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      gdscript = { "gdformat" },
      html = { "prettierd" },
      sql = { "sleek", "sqlfmt" },
      --
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      -- javascript = { { "prettierd", "prettier" } },
      terraform = { "terraform_fmt" },
      -- https://github.com/DavidAnson/markdownlint/blob/v0.32.1/README.md#configuration
      -- https://github.com/DavidAnson/markdownlint/blob/v0.32.1/schema/.markdownlint.yaml
      markdown = { "markdownlint-cli2" },
    },
  },
}
