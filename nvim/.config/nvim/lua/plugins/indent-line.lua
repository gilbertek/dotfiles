-- show lines around scope/indents
return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {
    indent = {
      char = '│',
      tab_char = { '>' },
    },
  },
}
