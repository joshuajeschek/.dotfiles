local Remap = require("joshuajeschek.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- telescope
nnoremap("<C-p>", function()
  require('telescope.builtin').find_files()
end)
nnoremap("<C-A-p>", ":Telescope<CR>")
nnoremap("<space>fb", ":Telescope file_browser<CR>")


-- undo/ redo
nnoremap("<C-z>", "u")
nnoremap("<C-S-z>", "C-r")
inoremap("<C-z>", "<C-o>u")
inoremap("<C-S-z>", "<C-o><C-r>")

-- Neoformat
nnoremap("<C-S-G>", ":Neoformat<CR>")
inoremap("<C-S-G>", "<C-o>:Neoformat<CR>")

