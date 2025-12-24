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
}
