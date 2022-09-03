call plug#begin('~/.config/nvim/plugged')
   "{ Theme }
    Plug 'joshdick/onedark.vim'
    "Plug 'sonph/onehalf', { 'rtp': 'vim' }
    "{ File Browser }
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo'
        \ .'/vim-nerdtree-syntax-highlight'
    Plug 'unkiwii/vim-nerdtree-sync'              " Sync current file
    "{ File Search }
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    "{ Status Bar }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    "{ Terminal }
    Plug 'voldikss/vim-floaterm'
    "{ Code Intellisense }
    Plug 'github/copilot.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " *things needed once installed copilot.vim*
	    ":Copilot setup
    " *things needed once installed coc.vim*
	    ":CocInstall coc-json coc-tsserver coc-clangd
		    ":CocCommand clangd.install 
	    ":CocInstall coc-highlight coc-emmet 
    "Plug 'jiangmiao/auto-pairs'
    "{ Code Syntax Highlight }
    "{ Debugging }
    Plug 'puremourning/vimspector'
    Plug 'mattn/emmet-vim'
    Plug 'liuchengxu/vista.vim'
    "{ Git }
    Plug 'tpope/vim-fugitive'
    "{ Markdown }
    "Require: Need install yarn
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'godlygeek/tabular'
    Plug 'preservim/vim-markdown'
    "{ Editor Tools }
    Plug 'neoclide/rename.nvim'
    "{ Formatter }
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()

"-----------Config-------------
" ===========================
" { General }
" ===========================
set mouse=a                 " Enable mouse
set tabstop=4               " 
set shiftwidth=4            " 
set expandtab
set listchars=tab:\¦\       " Tab charactor 
set list
"set foldmethod=syntax       " 
"set foldnestmax=1
"set foldlevelstart=0        "  
set number                  " Show line number
set ignorecase              " Enable case-sensitive 

" Disable backup
set nobackup
set nowb
set noswapfile

" Optimize 
"set synmaxcol=200
"set lazyredraw
"au! BufNewFile,BufRead *.json set foldmethod=indent " Change foldmethod for specific filetype" { Theme }
syntax on
set t_Co=256
set cursorline
"let g:airline_theme='onehalfdark'
let g:airline_theme='onedark'
" lightline
let g:lightline = { 'colorscheme': 'onehalfdark' }
"let g:lightline = { 'colorscheme': 'onedark' }

" Auto reload content changed outside
au CursorHold,CursorHoldI * checktime
au FocusGained,BufEnter * :checktime
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == ''
      \ | checktime 
    \ | endif
autocmd FileChangedShellPost *
    \ echohl WarningMsg 
    \ | echo "File changed on disk. Buffer reloaded."
    \ | echohl None


" ===========================
" { Plugins }
" ===========================
" { File Browser }
set encoding=UTF-8
" { Status Bar }
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" { Terminal }
let g:floaterm_position = 'topright'
let g:floaterm_height = 0.6
let g:floaterm_width = 0.4
" { Markdown }
let g:vim_markdown_folding_disabled = 1
" { Formatter }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
" Set Theme
"colorscheme onehalfdark
colorscheme onedark
" Overwrite some color highlight 
"if (has("autocmd"))
"  augroup colorextend
"    autocmd ColorScheme 
"      \ * call onedark#extend_highlight("Comment",{"fg": {"gui": "#728083"}})
"    autocmd ColorScheme 
"      \ * call onehark#extend_highlight("LineNr", {"fg": {"gui": "#728083"}})
"  augroup END
"endif

" Disable automatic comment in newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Other setting
for setting_file in split(glob(stdpath('config').'/settings/*.vim'))
  execute 'source' setting_file
endfor
"-----------Mapping------------
" { General }
" { File Browser }
noremap <silent> <f5> :NERDTreeToggle<CR>
" { Terminal }
noremap <silent> <f6> <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <f6> <C-\><C-n>:FloatermToggle<CR>
nmap <C-Z> u
imap <C-BS> <C-w>

