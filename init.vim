call plug#begin('~/.config/nvim/plugged')
	"{ Theme }
	"Plug 'joshdick/onedark.vim'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	"{ File Browser }
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	"{ File Search }
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	"{ Status Bar }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	"{ Terminal }
	Plug 'voldikss/vim-floaterm'
	"{ Code Intellisense }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" *things needed once installed coc.vim*
		":CocInstall coc-json coc-tsserver
		":CocInstall coc-clangd
			":CocRestart
			":CocCommand clangd.install 
		":CocInstall coc-highlight
		":CocInstall coc-emmet
		":CocInstall coc-pairs 
	"Plug 'jiangmiao/auto-pairs'
	"{ Code Syntax Highlight }
	"{ Debugging }
	Plug 'puremourning/vimspector'
	"{ Git }
	Plug 'tpope/vim-fugitive'
call plug#end()

"-----------Config-------------
" { General }

" { Theme }
"syntax on
"colorscheme onedark
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
" lightline
let g:lightline = { 'colorscheme': 'onehalfdark' }

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

"Other setting
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
