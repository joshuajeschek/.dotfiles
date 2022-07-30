local Remap = require("joshuajeschek.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

-- telescope
nnoremap("<C-p>", function()
    require('telescope.builtin').find_files()
end)

-- undo/ redo
nnoremap("<C-z>", "u")
nnoremap("C-S-z", "<C-r>")
inoremap("<C-Z>", "<C-O>u")
inoremap("<C-S-Z>", "<C-O><C-r>")

-- Neoformat
nnoremap("C-S-f", "Neoformat")
inoremap("C-S-f", "Neoformat")

-- Commenting
nnoremap("C-ö", "Commentary")
inoremap("C-ö", "Commentary")

