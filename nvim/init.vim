"#####################################################
"Load external config files
"#####################################################
"Source settings
source $HOME/.config/nvim/settings.vim
"Source completion configuration
source $HOME/.config/nvim/coc.vim
"Source key mappings
source $HOME/.config/nvim/keys/mappings.vim

"#####################################################
"PLUGINS
"#####################################################
call plug#begin('~/.config/nvim/plugged')

"For the airline and lightline bars bars (fully esthetic)
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Can remove lightline because "nord" does not work with airline?
" So we kinda need both.
Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'

"Vim integration with git.
" Plug 'tpope/vim-fugitive'

"For multiline comments and increase of quality of life on commenting
"(Use gcc, gc<numberOfLines><j/k> or gcap to comment an entire paragraph).
Plug 'tpope/vim-commentary' 

"For R development like in R studio
Plug 'jalvesaq/Nvim-R'
Plug 'chrisbra/csv.vim'
Plug 'lyuts/vim-rtags'

" For sending input to terminal buffers like in spyder
Plug 'karoliskoncevicius/vim-sendtowindow'

" Various colorschemes
Plug 'rafi/awesome-vim-colorschemes'
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
Plug 'joshdick/onedark.vim' 
Plug 'sainnhe/everforest'
" Plug 'sainnhe/sonokai' 
" Plug 'morhetz/gruvbox'
" Plug 'srcery-colors/srcery-vim'
" Plug 'arcticicestudio/nord-vim'

" Goyo and distraction free writting
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" For undoing history
Plug 'mbbill/undotree'

" For code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Having a file tree
"Plug 'preservim/nerdtree'

" For coc-settings and json linting
Plug 'kevinoid/vim-jsonc'

" Use RipGrep directly from vim
Plug 'jremmen/vim-ripgrep'

" CtrlP fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'

" Easymotion for vim
Plug 'easymotion/vim-easymotion'

call plug#end()
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

"#####################################################
"Unused Plugins (maybe they are worth your time.)
"#####################################################

""View manpages directly from vim
"Plug 'vim-utils/vim-man'
"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Start with NERDTree opened
"autocmd VimEnter * NERDTree | wincmd p

"Set your favourite colorscheme
colorscheme onedark
