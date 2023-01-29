local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local command = vim.api.nvim_create_user_command
local g = vim.g
local home = vim.fn.stdpath("config")

-- User defined command to format buffers
command("Format", function()
    vim.lsp.buf.format({ async = true, timeout = 5000 })
end, {})

command("PU", function()
    -- keymap('n', '<leader>ps', ":PackerCompile<cr>:PackerSync<cr>:TSUpdate<cr>", default_opts) -- Update plugins
    vim.cmd([[autocmd PackerCompile<cr>:PackerSync<cr>:TSUpdate<cr>]])
end, { desc = 'Update all plugins' })

-- [[ Highlight on yank ]]
-- highlight yanked region, see `:h lua-highlight` and `vim.highlight.on_yank()`
local highlight_group = augroup('YankHighlight', { clear = true })
autocmd({ "TextYankPost" }, {
    pattern = "*",
    -- group = augroup("HighlightYank", { clear = true }),
    group = highlight_group,
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500, on_visual = true })

        -- This is a workaround for clipboard not working in WSL
        -- see https://github.com/neovim/neovim/issues/19204#issuecomment-1173722375
        -- if vim.fn.has('wsl') == 1 then
        --     vim.fn.system('clip.exe', vim.fn.getreg('"'))
        -- end
    end,
})


-- autocmd("FileType", {
--     pattern = { "lua", "rust", "go", "gitconfig" },
--     callback = function()
--         set_indent_size(4)
--     end,
-- })

-- autocmd("FileType", {
--     pattern = "make",
--     callback = function()
--         set_indent_size(4)
--         vim.api.nvim_buf_set_option(0, "expandtab", false)
--     end,
-- })

-- Automatically format buffers
autocmd({ "BufWritePre" }, {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format({
            async = false
        })
    end
})

-- RemoveWhitespaceOnSave
autocmd({ "BufWritePre" }, {
    group = augroup("pre", { clear = true }),
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

-- Auto-create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
    pattern = "*",
    group = augroup("auto_create_dir", { clear = true }),

    callback = function(ctx)
        local dir = vim.fn.fnamemodify(ctx.file, ":p:h")
        vim.fn.mkdir(dir, 'p')
    end,
})

-- Automatically reload the file if it is changed outside of Nvim, see https://unix.stackexchange.com/a/383044/221410.
-- It seems that `checktime` does not work in command line. We need to check if we are in command
-- line before executing this command, see also https://vi.stackexchange.com/a/20397/15292 .
local auto_read = augroup("auto_read", { clear = true })

autocmd({ "FileChangedShellPost" }, {
    pattern = "*",
    group = auto_read,
    callback = function()
        vim.notify("File changed on disk. Buffer reloaded!", vim.log.levels.WARN, { title = "nvim-config" })
    end,
})

autocmd({ "FocusGained", "CursorHold" }, {
    pattern = "*",
    group = auto_read,
    callback = function()
        if vim.fn.getcmdwintype() == "" then
            vim.cmd("checktime")
        end
    end,
})

-- enable spellcheck when opening specific file types
autocmd("FileType", {
    pattern = "markdown,tex,latex",
    callback = function()
        vim.o.spell = true
    end,
})

-- save buffer when changing focus
autocmd("FocusLost,BufLeave", {
    pattern = "*",
    callback = function()
        if vim.bo.modified then
            vim.cmd("silent! update")
        end
    end,
})

autocmd({ "TermOpen" }, {
    pattern = "*",
    callback = function()
        -- TODO is there a lua native way to do this?
        vim.cmd("setlocal nonumber norelativenumber scrolloff=0")
    end,
})

autocmd({ "InsertEnter" }, { command = "set norelativenumber", pattern = "*" })
autocmd({ "InsertLeave" }, { command = "set relativenumber", pattern = "*" })

-- Copy filename path
command("CopyPath", function()
    vim.fn.setreg("*", vim.fn.expand("%"))
end, { desc = "Copy filename path" })

-- json
command("JsonDecodeFormat", "%!jq -r | jq", { desc = "Format json file" })

-- inspect tables easily
-- https://vonheikemen.github.io/devlog/es/tools/configuring-neovim-using-lua/
-- vim.keymap.set("n", "<F1>", 'yW:lua require"utils".wat(x18")<CR>') -- explore settings with F1
function Wat(key)
    print(vim.inspect(key))
end

-- Generate a UUID and insert it into the buffer
function InsertUUID()
    local uuid = vim.fn.system('uuidgen'):gsub('\n', ''):lower()
    local line = vim.fn.getline('.')
    vim.schedule(function()
        vim.fn.setline('.', vim.fn.strpart(line, 0, vim.fn.col('.')) .. uuid .. vim.fn.strpart(line, vim.fn.col('.')))
    end)
end

-- [[ Plugins settings ]]
-- Nvim-notify
function Dismiss()
    require("notify").dismiss({ pending = true, silent = true })
end

-- Emmet
g.user_emmet_mode       = 'a' -- Enable all function in all mode.
g.user_emmet_leader_key = ',' -- Using ,, to expand

-- markdown stuff
g.markdown_syntax_conceal = 0
g.markdown_minlines = 100

-- [[ vimwiki ]]
g.vimwiki_list = { { path = "~/wiki/", syntax = "markdown", ext = ".md" } }
-- automatically update links on read diary
vim.cmd([[augroup vimwikigroup
    autocmd!
    autocmd BufRead,BufNewFile diary.wiki VimwikiDiaryGenerateLinks
augroup end ]])

-- [[ Gist ]]
g.gist_open_browser_after_post = 1
g.gist_detect_filetype         = 1
g.gist_post_private            = 1
