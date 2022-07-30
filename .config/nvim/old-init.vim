:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

call plug#begin()
Plug 'https://github.com/tyru/open-browser.vim' " open in browser, needed for plantuml
Plug 'https://github.com/weirongxu/plantuml-previewer.vim' " plantuml previewer
Plug 'https://github.com/wakatime/vim-wakatime' " time tracking
Plug 'https://github.com/jiangmiao/auto-pairs' " auto paren pairs
Plug 'https://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'https://github.com/petobens/poet-v' " poetry virtualenv for jedi and coc
Plug 'https://github.com/davidhalter/jedi-vim' "jedi autocompletion
Plug 'fladson/vim-kitty' "kitty config syntax hightlighting
call plug#end()

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:airline#extensions#coc#enabled = 1

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

autocmd FileType python let b:coc_root_patterns = ['.git', '.env']

