-- [[ lua/vars.lua ]]
-- Global vim configuration 

local g = vim.g

g.t_co = 256
g.background = "dark"

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
g.mapleader = ","
g.localleader = "\\"

g.cursorhold_updatetime = 100
