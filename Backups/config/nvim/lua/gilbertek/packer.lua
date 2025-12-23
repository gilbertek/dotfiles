-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- it is recommended to put impatient.nvim before any other plugins - faster startup
    use { "lewis6991/impatient.nvim", config = [[require('impatient')]] }

    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    -- formatting/syntax
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" }
    })

    -- Auto format tools
    use { "sbdchd/neoformat", cmd = { "Neoformat" } }

    use("tpope/vim-commentary")
    use('theprimeagen/harpoon')
    use('mbbill/undotree')

    -- git integration
    use('tpope/vim-fugitive')
    use 'lewis6991/gitsigns.nvim'

    -- Create gists from buffer, selection.
    use({ 'mattn/gist-vim',
        requires = { 'mattn/webapi-vim' },
    })

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Useful status updates for LSP
            -- {'j-hui/fidget.nvim'},
            {
               "j-hui/fidget.nvim",
                config = require("fidget").setup({}),
            },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            { 'hrsh7th/cmp-emoji' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    -- language support
    use({ "mhanberg/elixir.nvim", requires = { "nvim-lua/plenary.nvim" } })
    use 'simrat39/rust-tools.nvim' -- RUST utilities
    use({
      "saecki/crates.nvim",
      config = function() require("crates").setup() end,
    })
    use("mattn/emmet-vim")
    use 'ray-x/go.nvim'
    use 'ray-x/guihua.lua'

    use("folke/zen-mode.nvim")
    use({ "github/copilot.vim", cmd = "Copilot" })
    use("eandrju/cellular-automaton.nvim")

    -- Database integration
    use 'tpope/vim-dadbod'
    use 'kristijanhusak/vim-dadbod-completion'
    use 'kristijanhusak/vim-dadbod-ui'

    -- code structure
    use('majutsushi/tagbar')
    use('junegunn/vim-easy-align')
    use('akinsho/nvim-toggleterm.lua')

    -- debugging
    use({
        "mfussenegger/nvim-dap",
        requires = {
            { "ravenxrz/DAPInstall.nvim" },
            { "leoluz/nvim-dap-go" },
            { "rcarriga/nvim-dap-ui" },
            { "theHamsta/nvim-dap-virtual-text" },
            { "nvim-telescope/telescope-dap.nvim" },
        },
        -- config = function() require("after.plugins.nvim-dap") end,
        -- config = function()
        --   require(vim.fn.stdpath("config") .. "/after.plugin.nvim-dap")
        -- end
    })

    -- auto close brackets, etc.
    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    -- :h nvim-surround.usage
    use({
        "kylechui/nvim-surround",
        after = "nvim-autopairs",
        config = function() require("nvim-surround").setup() end
    })

    -- Automatic insertion and deletion of a pair of characters
    use { "Raimondi/delimitMate", event = "InsertEnter" }

    -- Markdown preview
    use({
        'iamcco/markdown-preview.nvim',
        run = function() vim.fn['mkdp#util#install']() end,
    })

    -- project management
    use {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-tree").setup({
                actions = {
                    open_file = {
                        quit_on_open = true,
                        resize_window = true,
                    },
                    remove_file = {
                        close_window = true,
                    },
                }
            })
        end,
    })

    -- run tests in vim
    use("vim-test/vim-test")

    -- prettier diagnostics. No keybindings, just
    -- :Trouble<cmd>
    use({
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup({}) end,
    })

    -- Writing
    use { "brymer-meneses/grammar-guard.nvim", requires = "neovim/nvim-lspconfig" }

    -- A list of colorscheme and visual plugins.
    use 'navarasu/onedark.nvim'
    use 'shaunsingh/nord.nvim'
    use 'EdenEast/nightfox.nvim'
    use({ 'catppuccin/nvim', as = "catppuccin" })
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use 'olimorris/onedarkpro.nvim'
    use 'tanvirtin/monokai.nvim'
    use 'marko-cerovac/material.nvim'
    use 'rebelot/kanagawa.nvim'
    use 'sainnhe/gruvbox-material'
    use 'bluz71/vim-moonfly-colors'
    use 'nyoom-engineering/oxocarbon.nvim'
    use 'kristijanhusak/vim-hybrid-material'
    use 'kyazdani42/nvim-web-devicons'
    use 'LunarVim/darkplus.nvim'
    use 'wuelnerdotexe/vim-enfocado'
    use({ "bluz71/vim-nightfly-guicolors" })
    use("sam4llis/nvim-tundra")
    use 'AlexvZyl/nordic.nvim'
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use('lukas-reineke/indent-blankline.nvim')

    -- show and trim trailing whitespaces
    use("jdhao/whitespace.nvim")

    -- notification plugin
    use("rcarriga/nvim-notify")

    -- app integrations
    use("christoomey/vim-tmux-navigator")

    use("vimwiki/vimwiki")
    -- use({
    -- 	"vimwiki/vimwiki",
    -- 	cmd = "VimwikiIndex",
    -- 	setup = function() g.vimwiki_list = { { path = "~/vimwiki/", syntax = "markdown", ext = ".md" } } end
    -- })
end)
