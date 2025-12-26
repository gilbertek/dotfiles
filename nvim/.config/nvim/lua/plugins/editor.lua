return {
  {
    "folke/ts-comments.nvim",
    config = true,
    event = "BufReadPost",
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "html",
      "xml",
      "javascript",
      "typescript",
      "vue",
      "astro",
      "glimmer",
      "handlebars",
      "javascriptreact",
      "typescriptreact",
      "markdown",
      "php",
      "blade",
      "rescript",
      "svelte",
      "twig",
    },
    config = true,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = true,
    keys = {
      { "ys" },
      { "cs" },
      { "ds" },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      highlight = {
        -- custom pattern that accepts "KEYWORD(name):" as well
        pattern = [[.*<(KEYWORDS)\s*\(?.*\)?:]],
      },
      search = {
        -- custom pattern that accepts "KEYWORD(name):" as well
        pattern = [[\b(KEYWORDS)\s*\(?.*\)?:]],
      },
      keywords = {
        SAFETY = { icon = " ", color = "warning", alt = { "SAFE" } },
      },
    },
  },
  {
    "rgroli/other.nvim",
    config = function()
      require("other-nvim").setup({
        mappings = {
          "c",
          {
            -- context = "C header",
            pattern = "(.*).cpp$",
            target = "%1.h",
          },
          {
            -- context = "C header",
            pattern = "(.*).h$",
            target = "%1.cpp",
          },
        },
      })
    end,
  },
}
