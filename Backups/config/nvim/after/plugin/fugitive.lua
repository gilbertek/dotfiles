local autocmd = vim.api.nvim_create_autocmd
local keymap = vim.keymap.set
local cmd = vim.api.nvim_create_user_command

local TheFugitiveGroup = vim.api.nvim_create_augroup("TheFugitive", {})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

autocmd("BufWinEnter", {
    group = TheFugitiveGroup,
    pattern = "*",
    callback = function()
        if vim.bo.ft ~= "fugitive" then
            return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }
        keymap("n", "<leader>ps", function()
            vim.cmd.Git('push')
        end, opts)

        -- rebase always
        keymap("n", "<leader>P", function()
            vim.cmd.Git({ 'pull', '--rebase' })
        end, opts)

        keymap("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff" })
        keymap("n", "<leader>gpl", "<cmd>Git pull<cr>", { desc = "Git pull" })

        keymap("n", "<leader>gc", "<cmd>Git commit -m\"", { desc = "Git commit" })

        keymap("n", "<leader>ga", ":Git add %<cr>", { desc = "Git add current file" })
        keymap("n", "<leader>gr", ":Gread<cr>", { desc = "" })
        keymap("n", "<leader>gA", ":Git add -A<cr>", { desc = "" })
        keymap("n", "<leader>gl", ":Git log --name-only<cr>", { desc = "" })

        -- git diff (:Gdiffsplit! for merge conflicts)
        keymap("n", "<leader>gd", ":Gdiffsplit<cr>", { desc = "" })

        -- git merge left-right
        keymap("n", "<leader>mh", ":diffget //2<cr>", { desc = "" })
        keymap("n", "<leader>ml", ":diffget //3<cr>", { desc = "" })

        -- All commits
        cmd("Ghistory", ":Gclog", { bang = true })

        -- Commits for current file
        cmd("Ghistoryfile", ":0Gclog!", { bang = true })

        -- NOTE: It allows me to easily set the branch i am pushing and any tracking
        -- needed if i did not set the branch up correctly
        keymap("n", "<leader>t", ":Git push -u origin ", opts);
        keymap("n", "<leader>gps", ":Git push -u origin HEAD<CR>", { desc = "Git push" })
    end,
})

