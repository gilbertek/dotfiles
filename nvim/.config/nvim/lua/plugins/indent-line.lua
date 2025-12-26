-- show lines around scope/indents
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = {
      -- Issue: Nearest ident (i.e scope) and the rest are highlighted differently
      --
      -- Cursorline 21283b
      -- IblIndent also 21283b
      -- IblWhitespace 455574
      --
      --
      -- Issue: These two conflicts and make it unable to see comment parens
      -- MatchParen 455574
      -- Comment 455574
      --
      char = "│",
      tab_char = { ">" },
      -- highlight = { 'WarningMsg' },
    },
  },
}
