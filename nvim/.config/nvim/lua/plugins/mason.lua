return {
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },

  { "mason-org/mason-lspconfig.nvim" },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({

        ensure_installed = {
          -- LSP servers
          "lua_ls",
          -- "gopls",
          -- "glsl_analyzer",
          "svelte",
          "cssls",
          "html",
          -- "tsserver",
          -- "ts_ls",
          -- "bashls",
          "jsonls",
          -- "pyright",
          -- "rust_analyzer",
          -- "emmet_ls", -- seem to automatically start for some reason
          "yamlls",
          "angularls",
          -- "intelephense"
          -- linter
          "clang-format",
          -- "golangci-lint",
          -- "protolint",

          -- formatter
          -- "gofumpt",
          -- "goimports-reviser",
          -- "golines",

          "bash-language-server",
          "google-java-format",
          "stylua",
          "shellcheck",
          "shfmt",
          "java-test",
          "java-debug-adapter",
          "markdown-toc",
          "sonarlint-language-server",
        },
        -- if set to true this will check each tool for updates. If updates
        -- are available the tool will be updated. This setting does not
        -- affect :MasonToolsUpdate or :MasonToolsInstall.
        -- Default: false
        auto_update = false,
        -- set a delay (in ms) before the installation starts. This is only
        -- effective if run_on_start is set to true.
        -- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
        -- Default: 0
        start_delay = 3000, -- 3 second delay
      })
    end,
  },

  -- { 'j-hui/fidget.nvim', opts = {} },
}
