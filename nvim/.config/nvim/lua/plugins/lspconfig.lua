return {

   {
      'neovim/nvim-lspconfig',
      dependencies = {
      },
      config = function()
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
            vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = 0 })
            vim.keymap.set({"n", "v"}, '<leader>ca', vim.lsp.buf.code_action, { buffer = 0 })
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = 0 })
            vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { buffer = 0 })
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = 0 })
            vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, { buffer = 0 })
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
            vim.keymap.set('n', 'gR', vim.lsp.buf.references, { buffer = 0 })
            vim.keymap.set('n', "<leader>li",
            function()
               vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end
            vim.keymap.set("i", "<C-h>", function() 
                vim.lsp.buf.signature_help()
            end, {})
         )

         -- Levels by name: "TRACE" (0), "DEBUG", "INFO", "WARN", "ERROR", "OFF" (5)
         vim.lsp.set_log_level(4)

         -- Add borders to :LspInfo floating window
         -- https://neovim.discourse.group/t/lspinfo-window-border/1566/2
         require('lspconfig.ui.windows').default_options.border = 'rounded'
      end
  end
}

}
