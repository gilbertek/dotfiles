local system = vim.fn.system

local g = vim.g
g["test#strategy"] = "neovim"
g["test#javascript#jest#executable"] = "CI=true yarn test --colors"

vim.keymap.set("n", "<leader>tt", vim.cmd.TestNearest, { silent = true, desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", vim.cmd.TestFile, { silent = true, desc = "Run test file" })
vim.keymap.set("n", "<leader>ts", vim.cmd.TestSuite, { silent = true, desc = "Run test suite" })
vim.keymap.set("n", "<leader>tl", vim.cmd.TestLast, { silent = true, desc = "Run last test" })

local vim_notify_notfier = function(cmd, exit)
    if exit == 0 then
        vim.notify("Success: " .. cmd, vim.log.levels.INFO)
    else
        vim.notify("Fail: " .. cmd, vim.log.levels.ERROR)
    end
end

local terminal_notifier_notfier = function(cmd, exit)
    if exit == 0 then
        print("Success!")
        system(string.format([[terminal-notifier -title "Neovim" -subtitle "%s" -message "Success!"]], cmd))
    else
        print("Failure!")
        system(string.format([[terminal-notifier -title "Neovim" -subtitle "%s" -message "Fail!"]], cmd))
    end
end
