local dap = require("dap")
dap.defaults.fallback.external_terminal = {
    command = '/usr/bin/alacritty',
    args = { "-e" }
}

-- https://www.youtube.com/watch?v=0moS8UHupGc&ab_channel=TJDeVries
require('dap-go').setup()

-- vim.fn.sign_define('DapBreakpoint', { text={'B'}, texthl='', linehl='', numhl='' })
-- vim.fn.sign_define('DapBreakpointCondition', { text={'C'}, texthl='', linehl='', numhl='' })
-- vim.fn.sign_define('DapLogPoint', { text={'L'}, texthl='', linehl='', numhl='' })
-- vim.fn.sign_define('DapStopped', { text={'→'}, texthl='', linehl='', numhl='' })
-- vim.fn.sign_define('DapBreakpointRejected', { text={'R'}, texthl='', linehl='', numhl='' })
