syntax enable

" set leader key
let g:mapleader = "\<Space>"
"Leader key for Nvim-R
let maplocalleader = ','

set background=dark
set termguicolors
set hidden
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
"set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set statusline=%t 
set number                              " Line numbers
set relativenumber 											" Relative line numbers for jumps between lines.
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=0                       " Always show tabs
" set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set foldmethod=marker
"set autochdir                           " Your working directory will always



" Set the entire colorscheme to be nord
" let g:airline_theme = 'nord'
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ }


" ~~~~~~~~~~~~~~~~~~~~
" GOYO
" ~~~~~~~~~~~~~~~~~~~~
" Enable limelight automatically
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" ~~~~~~~~~~~~~~~~~~~~
" TMUX
" ~~~~~~~~~~~~~~~~~~~~
"set tmux cursor to work properly
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

" set term=screen-256color
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

""""""""""""""""""""""""""""""""""""""""""""
" let g:lightline#bufferline#auto_hide = 2000
""""""""""""""""""""""""""""""""""""""""""""
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

"you can't stop me!! Yoinked line of code
cmap w!! w !sudo tee %
