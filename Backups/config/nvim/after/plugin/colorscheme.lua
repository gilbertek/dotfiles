function SetColorscheme(color)
    color = color or "rose-pine"
    if (color == "gruvbox") then
        vim.g.gruvbox_material_foreground = "original"
        vim.g.gruvbox_material_background = "hard"
        vim.g.gruvbox_material_transparent_background = false

        require("gruvbox").setup()
        vim.cmd.colorscheme(color)

        require('lualine').setup {
            options = { theme = "gruvbox" },
        }
    elseif (color == "tokyonight") then
        vim.g.tokyonight_transparent_sidebar = true
        vim.g.tokyonight_transparent = true
        vim.cmd.colorscheme("tokyonight")

        require('lualine').setup {
            options = { theme = "tokyonight" },
        }
    elseif (color == "poimandres") then
        require('poimandres').setup {}
        vim.cmd.colorscheme('poimandres')

        require('lualine').setup {
            options = { theme = "poimandres" },
        }
    elseif (color == "onedark") then
        -- COLORSCHEME: onedarkpro
        require("onedarkpro").setup({
            styles = {
                comments = "italic",
                keywords = "bold"
            },
            options = {
                undercurl = true,
                transparency = true
            }
        })

        -- require('lualine').setup {
        --     options = { theme = "onedarkpro" },
        -- }

    elseif (color == "kanagawa") then
        require('kanagawa').setup({
            globalStatus = true,
        })

        require('lualine').setup {
            options = { theme = "kanagawa" },
        }

    elseif (color == "rose-pine") then
        vim.api.nvim_set_hl(0, "Nornal", { bg = "None" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "None" })

        require('rose-pine').setup({
            dark_variant = 'main',
            disable_background = true,
        })

    elseif (color == "material") then
        -- darker, lighter, oceanic, palenight, deep ocean

        vim.g.material_style = "deep ocean"
        -- Material Theme Settings
        require('material').setup {
            disable = {
                colored_cursor = true -- Disables the yellow cursor
            },
            contrast = {
                sidebars = true, -- Darker background in NvimTree
                -- popup_menu =	false, -- Lighter background on (first) cmp completion window
                floating_windows = true -- Darker background on (second) cmp completion window, and on Telescope
                -- non_current_windows = false -- Darker background behind ToggleTerm, for exmple
            }
        }
    elseif (color == "catppuccin") then
        require('catppuccin').setup({
            -- mocha, macchiato, frappe, latte
            flavour = "macchiato",
            transparent_background = false,
            no_italic = false,
            show_end_of_buffer = false,
            integrations = {
                treesitter = true,
                native_lsp = {
                    enabled = true,
                    styles = {
                        errors = "italic",
                        hints = "italic",
                        warnings = "italic",
                        information = "italic",
                    },
                },
                cmp = true,
                lsp_trouble = true,
                gitgutter = false,
                gitsigns = true,
                telescope = true,
                nvimtree = true,
                indent_blankline = {
                    enabled = true,
                    colored_indent_levels = true,
                },
            },
        })
    end
    -- require("onedarkpro").setup({
    --   dark_theme = "onedark", -- The default dark theme
    --   light_theme = "onelight", -- The default light theme
    --   styles = { -- Choose from "bold,italic,underline"
    --     comments = "italic",
    --     functions = "NONE",
    --     keywords = "bold,italic",
    --     strings = "NONE",
    --     variables = "NONE",
    --     virtual_text = "NONE"
    --   },
    -- })
    -- require('nightfox').setup({})

    -- -- Lua
    -- require('onedark').setup {
    --     -- style = 'dark', -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
    --     style = 'darker'
    -- }
    -- require('onedark').load()

    -- vim.cmd("colorscheme catppuccin")
    -- vim.cmd.colorscheme("oxocarbon")
    -- vim.cmd.colorscheme('hybrid_reverse')
    -- vim.cmd.colorscheme('onedarkpro')
    -- vim.cmd 'colorscheme material'
    vim.cmd.colorscheme(color)
    -- vim.cmd.colorscheme('nightfox')
    -- vim.cmd.colorscheme('gruvbox-material')
    -- vim.cmd.colorscheme('kanagawa')
end

-- https://github.com/roberte777/.dotfiles/blob/main/nvim/.config/nvim/after/plugin/colors.lua
-- https://github.com/jdhao/nvim-config/blob/master/core/colorschemes.lua


SetColorscheme("onedark")


-- local colorscheme = "tokyonight"
-- vim.g.tokyonight_style = "night"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end

-- https://github.com/tyler-pugmire/nvim/blob/main/plugin/plugins/colorscheme.lua
-- local status_ok, onedark = pcall(require, "onedark")
-- if not status_ok then return end

-- onedark.setup { style = 'darker' }


-- let g:enfocado_style = 'neon' " Available: `nature` or `neon`.


-- Selecting flavours
-- vim.g.material_style = "deep ocean"
-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha




--Lua:
-- vim.cmd 'colorscheme material'

-- vim.cmd("colorscheme nightfox")

-- local colorscheme = "nightfly"

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " not found!")
--   return
-- end

-- vim.cmd [[
-- try
--   colorscheme darkplus
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

-- Inspiration
-- https://github.com/LudoPinelli/dotfiles/blob/main/herbstluftwm/.config/herbstluftwm/autostart
-- https://github.com/jdhao/nvim-config/blob/master/core/colorschemes.lua
-- https://github.com/emPeeGee/NeoVim-Configuration/blob/main/lua/colorscheme.lua
-- https://github.com/iff/dotfiles/blob/master/nvim/lua/theme.lua
-- https://github.com/baleksa/.dotfiles/blob/main/nvim/.config/nvim/lua/ba/colorscheme.lua
