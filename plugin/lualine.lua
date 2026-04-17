local gruv = require('lualine.themes.gruvbox-material')
gruv.normal.c.bg = 'none'

require("lualine").setup({
  options = {
    theme = gruv,
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
      }
    },
  },
})
