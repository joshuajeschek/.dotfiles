return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("neoclide/coc.nvim", { branch = "master" })
    use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")
    use("sbdchd/neoformat")
    use("vim-airline/vim-airline")
    use("wakatime/vim-wakatime")
    use("jiangmiao/auto-pairs")
    use("tpope/vim-surround")
    use("tpope/vim-commentary")
    use("tpope/vim-fugitive")
    use("zivyangll/git-blame.vim")
    use("airblade/vim-gitgutter")
    use("lukas-reineke/virt-column.nvim")

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

