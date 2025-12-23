require "impatient".enable_profile()
require("gilbertek.packer")
require("gilbertek.vars")
require("gilbertek.keys")
require("gilbertek.opts")
require("gilbertek.autocmd")
require("gilbertek.lsp_handlers")

function R(name)
    require("plenary.reload").reload_module(name)
end
