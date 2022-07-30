return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("neoclide/coc.nvim", { branch = "master" })
    use("sbdchd/neoformat")
    use("vim-airline/vim-airline")
    use("wakatime/vim-wakatime")
    use("jiangmiao/auto-pairs")
    use("tpope/vim-commentary")

    -- telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-telescope/telescope-fzf-native.nvim", {
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    })
    use("kyazdani42/nvim-web-devicons")

    -- colorschemes
    use("gruvbox-community/gruvbox")
end)

