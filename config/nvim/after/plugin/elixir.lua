local elixir = require("elixir")
local on_attach = require("gilbertek.lsp_handlers").on_attach
local capabilities = require("gilbertek.lsp_handlers").capabilities

local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

require('lspconfig').elixirls.setup {
    cmd = { "elixir-ls" },

    settings = elixir.settings({
        dialyzerEnabled = true,
        fetchDeps = false,
        enableTestLenses = false,
        suggestSpecs = false
    }),

    on_attach = on_attach,
    capabilities = capabilities
}

-- https://github.com/bowmanmike/dotfiles/blob/main/nvim/after/plugin/elixir.lua
-- elixir.setup({
--   cmd = "/Users/sewovg5/.vscode/extensions/jakebecker.elixir-ls-0.13.0",

--   settings = elixir.settings({
--     dialyzerEnabled = true,
--     fetchDeps = false,
--     enableTestLenses = false,
--     suggestSpecs = false
--   }),

--   on_attach = function(client, bufnr)
--     local map_opts = { buffer = true, noremap = true }
--     -- remove the pipe operator
--     vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", map_opts)
--     -- add the pipe operator
--     vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", map_opts)
--     vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", map_opts)

--     on_attach(client, bufnr)
--   end,
--   capabilities = capabilities
-- })

vim.keymap.set("n", "<leader>pr", "orequire IEx; IEx.pry()<esc>", {})
vim.keymap.set("n", "<leader>in", "oIO.inspect()<esc>i", {})

local fn = function(args)
    return args[1][1]
end

ls.add_snippets("elixir", {
    s({ trig = "k" }, {
        i(1),
        t(": "),
        f(function(args)
            return args[1][1]
        end, { 1 }),
        t(",")
    })
})
