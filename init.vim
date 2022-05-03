call plug#begin('~/.config/nvim/plugged')

	"{ Theme }
	"Plug 'joshdick/onedark.vim'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
	"{ File Browser }
	Plug 'preservim/nerdtree'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
call plug#end()

"-----------Config-------------

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
"-----------Mapping------------

noremap <silent> <f5> :NERDTreeToggle<CR>
