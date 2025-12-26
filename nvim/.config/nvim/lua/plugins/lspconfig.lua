return {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function(bufnr)
      local opts = { noremap = true, silent = true, buffer = bufnr }
      -- https://github.com/neovim/nvim-lspconfig#Keybindings-and-completion
      -- rounded borders for floating stuff
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      -- Use an on_attach function to only map the following keys
      -- after the language server attaches to the current buffer
      local on_attach = function()
        vim.lsp.inlay_hint.enable(true)

        -- Format the current buffer on save
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr, id = client.id })
            end,
          })
        end

        -- We create a function that lets us more easily define mappings specific
        -- for LSP related items. It sets the mode, buffer and description for us each time.
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr.buf, desc = "LSP: " .. desc })
        end

        map("n", "gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
        map("n", "gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        map("n", "<leader>lf", vim.lsp.buf.format, "[L]SP [F]ormat")
        map("n", "K", vim.lsp.buf.hover, "Hover Documentation")
        map("n", "gl", vim.diagnostic.open_float, { buffer = 0 })
        map("n", "<leader>rn", vim.lsp.buf.rename, "[R]ename")
        map("n", "gr", vim.lsp.buf.references, "[G]oto [R]eferences")
        map("n", "<leader>li", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, opts)
        map("i", "<C-h>", function()
          vim.lsp.buf.signature_help()
        end, opts)
      end

      -- Levels by name: "TRACE" (0), "DEBUG", "INFO", "WARN", "ERROR", "OFF" (5)
      vim.lsp.set_log_level(4)

      -- Add borders to :LspInfo floating window
      -- https://neovim.discourse.group/t/lspinfo-window-border/1566/2
      require("lspconfig.ui.windows").default_options.border = "rounded"
    end,
  },
}
