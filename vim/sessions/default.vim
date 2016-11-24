" ~/dotfiles/vim/sessions/default.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 23 April 2016 at 10:54:30.
" Open this file in Vim and run :source % to restore your session.

if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'desert' | colorscheme desert | endif
call setqflist([{'lnum': 5, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/webroot/js/_src/banks/stats/standards.js', 'text': 'ItemLogic.install(''Bank.ViewStatsStandards'', {'}, {'lnum': 7, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/webroot/js/_src/banks/view/standards.js', 'text': '	var vs = new ItemLogic.Bank.ViewStatsStandards(''BankCurriculums'');'}, {'lnum': 20, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'app/webroot/js/_src/banks/view/stats.js', 'text': '			this.stds = new ItemLogic.Bank.ViewStatsStandards(this, this.els.stds);'}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/itemlogic/docroot/app.itemlogic.dev/httpdocs
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +37 app/View/Elements/banks/stats/count_table.ctp
badd +0 app/Controller/BanksController.php
badd +2 app/View/Banks/view/standards.ctp
badd +20 app/webroot/js/_src/banks/view/stats.js
badd +47 app/View/Elements/banks/stats/standards.ctp
badd +11 app/webroot/js/_src/banks/view.js
badd +8 app/webroot/js/_src/banks/view/standards.js
badd +36 app/webroot/js/_src/banks/stats/standards.js
badd +33 app/webroot-src/scss/banks/view/stats.scss
badd +13 app/webroot-src/scss/banks/view/standards.scss
badd +13 app/webroot-src/scss/banks/view/stats/curriculums.scss
badd +115 ~/dotfiles/vim/snippets/php.snippets
badd +2 app/View/Banks/view/discussions.ctp
badd +8 app/View/Banks/view.ctp
badd +36 app/webroot-src/scss/banks/view/discussions.scss
argglobal
silent! argdel *
edit app/webroot-src/scss/banks/view/stats.scss
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
4wincmd h
wincmd w
wincmd w
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 30 + 181) / 363)
exe 'vert 2resize ' . ((&columns * 82 + 181) / 363)
exe 'vert 3resize ' . ((&columns * 82 + 181) / 363)
exe 'vert 4resize ' . ((&columns * 82 + 181) / 363)
exe 'vert 5resize ' . ((&columns * 83 + 181) / 363)
argglobal
enew
" file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 46 - ((45 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
46
normal! 05|
wincmd w
argglobal
edit app/View/Elements/banks/stats/standards.ctp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 24 - ((23 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 04|
wincmd w
argglobal
edit app/View/Banks/view/discussions.ctp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 12 - ((11 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
12
normal! 0
wincmd w
argglobal
edit app/Controller/BanksController.php
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 517 - ((53 * winheight(0) + 44) / 89)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
517
normal! 06|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 30 + 181) / 363)
exe 'vert 2resize ' . ((&columns * 82 + 181) / 363)
exe 'vert 3resize ' . ((&columns * 82 + 181) / 363)
exe 'vert 4resize ' . ((&columns * 82 + 181) / 363)
exe 'vert 5resize ' . ((&columns * 83 + 181) / 363)
tabnext 1
if exists('s:wipebuf')
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

1wincmd w
tabnext 1
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree ~/dev/itemlogic/docroot/app.itemlogic.dev/httpdocs
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 89|vert 1resize 30|2resize 89|vert 2resize 82|3resize 89|vert 3resize 82|4resize 89|vert 4resize 82|5resize 89|vert 5resize 83|
2wincmd w
tabnext 1
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
