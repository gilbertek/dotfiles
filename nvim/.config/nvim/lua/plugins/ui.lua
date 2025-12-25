return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "kyazdani42/nvim-web-devicons",
    lazy = true,
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  --   config = function()
  --     require("nvim-tree").setup()
  --   end,
  -- },
}
