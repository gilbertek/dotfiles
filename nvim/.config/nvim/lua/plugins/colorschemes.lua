return {
  -- add colorscheme
  {
    'folke/tokyonight.nvim',
    lazy = true,
    priority = 1000,
    opts = {
      transparent = false,
      -- styles = {
      --   sidebars = "transparent",
      --   floats = "transparent",
      -- },
      terminal_colors = false,
    },
  },
  {
    'oxfist/night-owl.nvim',
    lazy = true,
    priority = 1000,
    opts = {
      transparent_background = false,
      bold = true,
      italics = true,
      underline = true,
      undercurl = true,
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    lazy = true,
    priority = 1000,
    opts = {
      flavour = 'mocha',
      transparent_background = false,
    },
  },
  {
    'marko-cerovac/material.nvim',
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.material_style = 'deep ocean'
      require('material').setup({
        disable = {
          background = false,
        },
        lualine_style = 'stealth',
      })
    end,
  },
  {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,
  },
  {
    'rebelot/kanagawa.nvim',
    lazy = true,
    priority = 1000,
    opts = {
      -- transparent = true,
      terminalColors = false,
      theme = 'lotus', -- Load "wave" theme when 'background' option is not set
    },
  },
  {
    'shaunsingh/moonlight.nvim',
    lazy = true,
    priority = 1000,
  },
  {
    'loctvl842/monokai-pro.nvim',
    lazy = true,
    config = function()
      require('monokai-pro').setup({
        transparent_background = false,
        terminal_colors = false,
        filter = 'spectrum', -- classic | octagon | pro | machine | ristretto | spectrum
        -- Enable this will disable filter option
        day_night = {
          enable = true, -- turn off by default
          day_filter = 'machine', -- classic | octagon | pro | machine | ristretto | spectrum
          night_filter = 'spectrum', -- classic | octagon | pro | machine | ristretto | spectrum
        },
        overridePalette = function(filter)
          return {
            dimmed3 = '#b3b3b3', -- change color of comments
          }
        end,
      })
    end,
  },
  {
    'polirritmico/monokai-nightasty.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      dark_style_background = 'dark', -- default, dark, transparent, #color
      light_style_background = 'default', -- default, dark, transparent, #color
      -- Style to be applied to different syntax groups. See `:help nvim_set_hl`
      hl_styles = {
        keywords = { italic = true },
        comments = { italic = true },
      },
    },
    config = function(_, opts)
      require('monokai-nightasty').setup(opts)
      -- require("which-key").add({
      --   -- momokai-nightasty
      --   {
      --     "<leader>tt",
      --     "<Cmd>MonokaiToggleLight<CR>",
      --     desc = "Monokai-Nightasty: Toggle dark/light theme.",
      --     hidden = true,
      --   },
      -- })
    end,
  },
  {
    'tiagovla/tokyodark.nvim',
    lazy = true,
    priority = 1000,
    opts = {
      -- custom options here
      -- transparent_background = true,
      terminal_colors = false,
    },
    config = function(_, opts)
      require('tokyodark').setup(opts) -- calling setup is optional
      vim.cmd([[colorscheme tokyodark]])
    end,
  },
  {
    'diegoulloao/neofusion.nvim',
    lazy = true,
    priority = 1000,
    config = true,
    opts = { transparent_mode = true },
  },
  {
    'cvigilv/patana.nvim',
    lazy = true,
    priority = 1000,
    config = function() end,
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      enable = {
        terminal = true,
      },
      styles = {
        transparency = false,
      },
    },
  },
  {
    '0xstepit/flow.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      fluo_color = 'pink',
      mode = 'desaturate',
      aggressive_spell = false,
    },
  },
  {
    'EdenEast/nightfox.nvim',
  },
  {
    'aliqyan-21/darkvoid.nvim',
  },
  {
    'ray-x/starry.nvim',
    opts = {
      style = {
        name = 'emerald',
      },
    },
  },
  {
    'comfysage/evergarden',
    priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
    opts = {
      transparent_background = false,
      variant = 'hard', -- 'hard'|'medium'|'soft'
      overrides = {}, -- add custom overrides
    },
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'sam4llis/nvim-tundra',
  },
  {
    'zaldih/themery.nvim',
    lazy = false,
    config = function()
      require('themery').setup({
        themes = {
          'kanagawa',
          'night-owl',
          'tokyonight',
          'catppuccin',
          'material',
          'moonfly',
          'moonlight',
          'monokai-pro',
          'tokyodark',
          'neofusion',
          'patana',
          'monokai-nightasty',
          'rose-pine',
          'flow',
          'nightfox',
          'darkvoid',
          'nordic',
          'starry',
          'evergarden',
          'tundra',
        },
      })
    end,
  },
}
