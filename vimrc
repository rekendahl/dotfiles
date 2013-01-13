set nocompatible
call pathogen#infect()
syntax enable
filetype on

set hidden
set nowrap
set number
set expandtab
set tabstop=3
set shiftwidth=3
set history=1000
set wildmode=list:longest
set ignorecase 
set smartcase
set title
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set visualbell
set tags=tags;~/
set mouse=a

"VIM POWERLINE
set t_Co=256
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'

runtime syntax/verilog_systemverilog.vim
nnoremap ' `
nnoremap ` '
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

let mapleader = ","

let g:solarized_termtrans = 1
colorscheme solarized
if has('gui_running')
   set background=dark
else
   set background=light
endif
call togglebg#map("<F5>") 

" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>


" I've decided that C-[ works better. It's standard VIM so works in almost all
" apps that mimic VIM (including zsh). And with C remapped to CAPS LOCK it's
" an easier combination then hitting ESC
":imap jk <Esc>

" Open files in current directory with ,e
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

" Intuitive backspacing in insert mode
set backspace=indent,eol,start
 
" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on
 
" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.
set wildmenu
set wildmode=list:longest,full
nmap <silent> <leader>n :silent :nohlsearch<CR>

function! SuperCleverTab()
   if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
      return "\<Tab>"
   else
      if &omnifunc != ''
         return "\<C-X>\<C-O>"
      elseif &dictionary != ''
         return "\<C-K>"
      else
         return "\<C-N>"
      endif
   endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

