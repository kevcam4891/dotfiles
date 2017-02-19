set number       " Show line numbers
set hidden       " Allow hidden buffers
set wildmenu     " Allow tab completion of files
set nowrap       " Do not wrap lines
set ignorecase
set hlsearch     " Highlite search strings
set incsearch    " Search as you type
set nocompatible " We're running Vim, not Vi!
set noswapfile
set noexpandtab
set tabstop=2
set shiftwidth=2
set autoindent
"set indentkeys
"set smartindent
set autoread
set scrolloff=8
set exrc " Allow project-specific .vimrc files
set secure " Secure project-specific .vimrc files

syntax on                    " Enable syntax highlighting
filetype on                  " Enable filetype detection
filetype plugin indent on    " Enable filetype-specific indenting
filetype plugin on           " Enable filetype-specific plugins
compiler ruby                " Enable compiler support for ruby
colorscheme desert           " Best colorscheme ever
map <c-c> :w !pbcopy<CR><CR> " Copy to system clipboard
map <c-g> <S-v><c-c>         " Copy line to system clipboard
"map <c-v> :r !pbpaste<CR>    " Paste from system clipboard
map <c-s> <esc>:w<cr>
let mapleader=","
map <leader>i <esc>gg=G''
map <leader>f <esc>:%!tidy -xml -q -wrap 100<cr>
map <leader>ff <esc>:%!tidy -xml -q -wrap 100<cr>gg=G
map <leader>fh <esc>:%!tidy -q -wrap 100<cr>gg=G
map <leader>w :set wrap!<cr>
map <leader>q <esc>:set ft=html<cr>gg=G'' :set ft=php<cr>gg=G''
map <leader>va :!xmllint --schema app/vendors/xsd/ims/imsqti_v2p1.xsd --noout %<cr>

set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500

set lcs=tab:>-,eol:<,nbsp:%

" Sessions
nnoremap <F3> :set hlsearch!<CR>
map <F4> :SaveSession<cr>
map <leader>so :OpenSession<cr> 
:let g:session_autosave = 'no'
:let g:session_autoload = 'no'

" Faster Scrolling
nmap <c-j> 10j
nmap <c-k> 10k

nmap <leader>r <esc><c-s>:!./%

" Faster Save + Quit
inoremap <c-s> <esc>:w<cr>
map <c-s> <esc>:w<cr>
map <c-q> <esc>:qa!<cr>

nmap <leader>bb :ls<cr>

map <leader>bn :bp
map <leader>bm :bn
noremap <silent> <C-F9> :vertical resize -8<CR>
noremap <silent> <C-F10> :resize +8<CR>
noremap <silent> <C-F11> :resize -8<CR>
noremap <silent> <C-F12> :vertical resize +8<cr>

"nmap <C-tab><<
"nmap <tab><<

" Formatting Options
set formatoptions=tcq

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

nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    Tabs                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . tabpagenr()<CR>


" ================================================================================ 
" Buffer Control
" ================================================================================ 

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Toggle Buffers
map <leader>j :bp
map <leader>k :bn
map <C-O> :CtrlPBuffer<CR>
map <leader>bdd :bufdo :bd

" ================================================================================ 
" CTRL-P Settings
" ================================================================================ 

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
	\ }
let g:ctrlp_by_filename = 0
let g:ctrlp_regexp = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:50'

set wildignore+=mathjax

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Quick Open                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map <F11> :cp<cr>
map <F12> :cn<cr>
map <S-F12> :copen<cr>
map <S-F11> :cclose<cr>

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
let NERDTreeIgnore = ['\.DS_Store']
nmap <F2> :NERDTreeToggle<CR>
map <leader>ntf :NERDTreeFind<CR>
map <leader>nn :NERDTreeFind<CR>
map <leader>ntb :OpenBookmark

let Tlist_WinWidth="30"

" ================================================================================ 
" Git 
" ================================================================================ 

nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
nmap <Leader>hs <Plug>GitGutterStageHunk
nmap <Leader>hr <Plug>GitGutterRevertHunk

" ================================================================================ 
" Ultisnips
" ================================================================================ 

let g:UltiSnipsSnippetDirectories=["UltiSnips", "snippets"]
let g:UltiSnipsEditSplit="horizontal"
map <leader>ue :UltiSnipsEdit<cr>



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

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ignore_files = ['erb$']

" ================================================================================ 
" Misc
" ================================================================================ 

noremap <C-n> :set relativenumber!<cr>
nnoremap <silent> <F8> :TlistToggle<CR>
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let tlist_php_settings = 'php;f:function;c:class'

"au BufNewFile,BufRead *.pp set filetype=ruby
"
"
"
let Tlist_Show_One_File = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let tlist_php_settings = 'php;f:function;c:class'
let tlist_javascript_settings = 'javascript;c:class;m:method'

"au BufNewFile,BufRead *.pp set filetype=ruby

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>']
let g:ycm_key_list_previous_completion = ['<C-p>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Debuger
let g:vdebug_options= {
    \    "port" : 9000,
    \    "server" : 'localhost',
    \    "timeout" : 20,
    \    "on_close" : 'detach',
    \    "break_on_open" : 1,
    \    "ide_key" : '',
    \    "path_maps" : {},
    \    "debug_window_level" : 0,
    \    "debug_file_level" : 0,
    \    "debug_file" : "",
    \    "watch_window_style" : 'expanded',
    \    "marker_default" : '⬦',
    \    "marker_closed_tree" : '▸',
    \    "marker_open_tree" : '▾'
    \}

"Debug: Vagrant Box
let g:vdebug_options['server'] = "192.168.99.1"
let g:vdebug_options['path_maps'] = { 
\	"/docroot": "/Users/kevin/dev/itemlogic/docker/itemlogic-app/src/app",
\}

"let g:vdebug_options['server'] = "10.254.254.254"
"let g:vdebug_options['path_maps'] = { 
"\	"/var/www/html": "/Users/kevin/dev/itemlogic/docker/itemlogic-pub/data/www"
"\ }


let g:vdebug_options["break_on_open"] = 0
let g:vdebug_options['continuous_mode'] = 1
map <S-F10> :BreakpointRemove *<cr>
let g:vdebug_keymap = {"close" : '<S-F5>'}

" Use silver searcher over grep
if executable('ag')
	" Use ag over grep
	set grepprg=ag\ --nogroup\ --nocolor

	" Use ag in CtrlP for listing files. Lightning fast and
	"	respects .gitignore
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

	" ag is fast enough that CtrlP doesn't need to cache
	let g:ctrlp_use_caching = 1
endif "
