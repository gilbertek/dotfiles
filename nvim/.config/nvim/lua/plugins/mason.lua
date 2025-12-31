return {
  {
    'mason-org/mason.nvim',
    opts = {
      registries = {
        'github:mason-org/mason-registry',
        'github:Crashdummyy/mason-registry',
      },
    },
  },

  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      { 'neovim/nvim-lspconfig' },
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = {
          'angularls',
          'clangd',
          'basedpyright',
          'bashls',
          'cssls',
          'elixirls',
          -- "emmet_ls", -- seem to automatically start for some reason
          -- 'erlang_ls',
          -- 'gleam',
          'gopls',
          -- "glsl_analyzer",
          -- 'gradle_ls',
          'html',
          -- "tsserver",
          -- "ts_ls",
          -- 'jdtls',
          'jsonls',
          'lua_ls',
          'protols',
          -- 'roslyn_ls',
          'ruff',
          'rust_analyzer',
          'svelte',
          'taplo',
          'yamlls',
          'vtsls',
          -- "intelephense"
          'zls',
        },
        automatic_enable = true,
      })
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          -- linter
          'clang-format',
          -- "golangci-lint",
          -- "protolint",

          -- formatter
          -- "gofumpt",
          -- "goimports-reviser",
          -- "golines",

          -- "sonarlint-language-server",
          'google-java-format',
          'stylua',
          'shellcheck',
          'shfmt',
          'java-test',
          'java-debug-adapter',
          'markdown-toc',
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
}
