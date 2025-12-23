-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md#intergrate-with-null-ls
-- https://github.com/jay-babu/mason-null-ls.nvim#primary-source-of-truth-is-mason-null-ls
-- https://github.com/bingocaller/dotfiles/blob/main/.config/nvim/after/plugin/lsp.lua

local lsp = require('lsp-zero')
local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end
local null_opts = lsp.build_options('null-ls', {})

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- local on_attach = require("gilbertek.lsp_handlers").on_attach
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    debug = false,
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)

        local format_cmd = function(input)
            vim.lsp.buf.format({
                id = client.id,
                timeout_ms = 5000,
                async = input.bang,
            })
        end

        local bufcmd = vim.api.nvim_buf_create_user_command
        bufcmd(bufnr, 'NullFormat', format_cmd, {
            bang = true,
            range = true,
            desc = 'Format using null-ls'
        })
    end,

    sources = {
        null_ls.builtins.completion.spell,
        null_ls.builtins.code_actions.cspell,
        null_ls.builtins.code_actions.proselint,

        diagnostics.credo,
        diagnostics.eslint_d.with({
            diagnostics_format = "[eslint] #{m}\n(#{c})",
        }),
        -- diagnostics.codespell,
        diagnostics.jsonlint,
        diagnostics.luacheck,
        diagnostics.markdownlint,
        diagnostics.pylint,
        diagnostics.standardrb,
        diagnostics.yamllint,
        diagnostics.write_good,

        formatting.black,
        formatting.clang_format,
        formatting.gofmt,
        formatting.jq,
        formatting.latexindent,
        formatting.markdownlint,
        formatting.prettierd,
        formatting.rustfmt,
        formatting.stylua.with({
            extra_args = {
              "--column-width",
              "100",
              "--indent-type",
              "Spaces",
              "--indent-width",
              "4",
        },
        }),
        formatting.yamlfmt,
    },
})
