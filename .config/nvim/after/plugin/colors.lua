-- luacheck: globals vim

vim.g.joshuajeschek_colorscheme = "gruvbox"

vim.g.gruvbox_contrast_dark = 'hard'
vim.opt.background = "dark"
vim.g.gruvbox_colors = { bg0 = "#000000" }

vim.cmd("colorscheme " .. vim.g.joshuajeschek_colorscheme)

vim.api.nvim_set_hl(0, "ColorColumn", {
  ctermbg = 0,
  bg = "#000000",
})

