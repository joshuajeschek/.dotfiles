return require("packer").startup(function()
    use("wbthomason/packer.nvim")
    use("neoclide/coc.nvim", { branch = "master", run = "yarn install" })
    use("WhoIsSethDaniel/toggle-lsp-diagnostics.nvim")
    use("sbdchd/neoformat")
    use("vim-airline/vim-airline")
    use("wakatime/vim-wakatime")
    use("jiangmiao/auto-pairs")
    use("tpope/vim-fugitive")
    use("zivyangll/git-blame.vim")
    use("airblade/vim-gitgutter")
    use("lukas-reineke/virt-column.nvim")
    use("echasnovski/mini.nvim", { config = function()
        require('mini.trailspace').setup()
        require('mini.comment').setup()
        require('mini.surround').setup()
    end })

    -- telescope
    use("nvim-telescope/telescope.nvim")
    use("nvim-lua/plenary.nvim")
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-telescope/telescope-fzf-native.nvim", {
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    })
    use("kyazdani42/nvim-web-devicons")
    use("nvim-telescope/telescope-file-browser.nvim")

    -- colorschemes
    use("gruvbox-community/gruvbox")
end)

