" Basic Settings
set number
set hidden
set wildmenu
set nowrap
set ignorecase
set hlsearch              " Highlite search strings
set incsearch             " Search as you type
set nocompatible          " We're running Vim, not Vi!
set noswapfile
set noexpandtab
set tabstop=2
set shiftwidth=2
set autoindent
"set indentkeys
"set smartindent
set autoread

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

syntax on                 " Enable syntax highlighting
filetype on               " Enable filetype detection
filetype plugin indent on " Enable filetype-specific indenting
filetype plugin on        " Enable filetype-specific plugins
compiler ruby             " Enable compiler support for ruby
colorscheme desert        " Best colorscheme ever

let mapleader=","

set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

set lcs=tab:>-,eol:<,nbsp:%

" Sessions
nnoremap <F3> :set hlsearch!<CR>
map <F4> :mks!
map <F5> :mkview! 

" Faster Scrolling
nmap <c-j> 10j
nmap <c-k> 10k

" Faster Save + Quit
inoremap <c-s> <c-o>:w<cr>
inoremap <c-q> <c-o>:q<cr>

nmap <leader>bb :ls<cr>

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

"autocmd FileType puppet setlocal noexpandtab

map <leader>bd <esc>:bp<cr>:bd#<cr>

" ================================================================================ 
" Windows
" ================================================================================ 

" resize horzontal split window
"nmap <> <C-W>-<C-W>-
"nmap <C-Right> <C-W>+<C-W>+
" resize vertical split window
nmap <C-Up> <C-W>><C-W>>
nmap <C-Down> <C-W><<C-W><

nmap <S-F9> 3<C-w><
nmap <F9> 3<C-w>>


" Move to another window
map ,l <c-w>l
map ,h <c-w>h
map ,j <c-w>j
map ,k <c-w>k

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
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ }

set wildignore+=mathjax

"map <C-O> :CtrlPBuffer<CR>

" Set the status line the way i like it
" set stl=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]
set ruler
set statusline=%<%f\ %m%a%=%([%R%H%Y]%)\ %-19(%3l\ of\ %L,%c%)%P
set laststatus=2

" Edit the vimrc file
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap ,sv :so $MYVIMRC<CR>

" ================================================================================ 
" NERD Tree
" ================================================================================ 

let NERDTreeShowHidden=1 " NERDTree Settings
map <F2> :NERDTreeToggle<CR>
map <leader>ntf :NERDTreeFind<CR>
map <leader>ntb :OpenBookmark

" ================================================================================ 
" Ultisnips
" ================================================================================ 

let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]


" Escape special characters in a string for exact matching.
" This is useful to copying strings from the file to the search tool
" Based on this - http://peterodding.com/code/vim/profile/autoload/xolox/escape.vim
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction

" Start the find and replace command across the entire file
vmap <leader>z <Esc>:%s/<c-r>=GetVisual()<cr>/

" ================================================================================ 
" Tabular
" ================================================================================ 

if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
	nmap <Leader>a> :Tabularize /=><CR>
  vmap <Leader>a> :Tabularize /=><CR>
endif


" ================================================================================ 
" Misc
" ================================================================================ 

" Toggle Abs/Rel Line Numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <C-n> :call NumberToggle()<cr>

"au BufNewFile,BufRead *.pp set filetype=ruby
