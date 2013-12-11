" Basic Settings
set number
set hidden
set wildmenu
set nowrap
set ignorecase
set hlsearch       " Highlite search strings
set incsearch      " Search as you type
set nocompatible   " We're running Vim, not Vi!
syntax on          " Enable syntax highlighting
filetype on        " Enable filetype detection
filetype indent on " Enable filetype-specific indenting
filetype plugin on " Enable filetype-specific plugins
compiler ruby      " Enable compiler support for ruby
colorscheme desert " Best colorscheme ever

set noexpandtab
set tabstop=2
set shiftwidth=2

let mapleader=","

" Fast Saving
nmap <leader>w :w!<cr>


set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

set lcs=tab:>-,eol:<,nbsp:%

" Basic Bindings
map <c-s> :w<cr>
map <c-q> :q<cr>

" Sessions
nnoremap <F3> :set hlsearch!<CR>
map <F4> :mks!
map <F5> :mkview! 

" Faster Scrolling
nmap <c-j> 10j
nmap <c-k> 10k

" Window Management
map ,l <c-w>l
map ,h <c-w>h
map ,j <c-w>j
map ,k <c-w>k

map <leader>bn :bp
map <leader>bm :bn
noremap <silent> <C-F9> :vertical resize -8<CR>
noremap <silent> <C-F10> :resize +8<CR>
noremap <silent> <C-F11> :resize -8<CR>
noremap <silent> <C-F12> :vertical resize +8<cr>

" Formatting Options
set formatoptions=tcq

" PHP Debugging
"let g:dbgPavimPort = 9000
"let g:dbgPavimBreakAtEntry = 0

" Pathogen
execute pathogen#infect()

" Turn off that stupid highlight search
nmap <silent> ,n :nohls<CR>

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

vmap <Leader>px !xmllint --format -<CR>
nmap <Leader>px !!xmllint --format -<CR>
nmap <Leader>pxa :%!xmllint --format -<CR>

autocmd FileType puppet setlocal noexpandtab


" ================================================================================ 
" Buffer Control
" ================================================================================ 

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Toggle Buffers
map <leader>j :bp
map <leader>k :bn

" ================================================================================ 
" CTRL-P Settings
" ================================================================================ 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''

map <C-O> :CtrlPBuffer<CR>

" Set the status line the way i like it
" set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set ruler
set statusline=%<%f\ %m%a%=%([%R%H%Y]%)\ %-19(%3l\ of\ %L,%c%)%P
set laststatus=2

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap ,sv :so $MYVIMRC<CR>


" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

map <F2> :NERDTreeToggle<CR>

" Toggle Abs/Rel Line Numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

au BufNewFile,BufRead *.pp set filetype=ruby
