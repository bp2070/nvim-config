require("lualine").setup({
  options = {
    section_separators = { left = "", right = "", },
    component_separators = { left = "", right = "", },
  },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1,
        shorting_target = 10,
      }
    },
  },
})
