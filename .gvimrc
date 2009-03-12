"HOWTO:
"use map K ?

" Vim way
set nocp "nocompatible
set spl=ru spell "spelllang
set nospell
"set spellfile "for zg and zw zW zG zuW zuG
"spellcheck... z=
"set spellgood
comp! gcc "compiler
" set efm= "errorformat
" set pt= "pastetoggle

" Tab modif to space
set et "expandtab
set sw=4 "shiftwidth
set ts=4 "tabstop
" <Tab> remove sw on <BS>
set sta "smarttab
set sts=4 "softtabstop

" Incremental search by typing
set is "incsearch
" Highlight things that we find with the search
" :nohls :noh
set hls "hlsearch
" Ignoring case is a fun trick
set ic "ignorecase
" Override ic only for /, ?, n, N
set scs "smartcase
" search wrap around end file
set nows "nowrapscan

" :h backspace?
set bs=indent,eol,start "backspace
"whichwrap+=<,>,[,] " you must forget <- ->

" When I close a tab, remove the buffer || no unload buffer
set nohid "nohidden
"set fs "fsync
"set sws "swapsync

" When on: ~ like operator (dd, yy, cc)
set top "tildeop

set nowrap
set ss=1 "sidescroll
set lcs+=precedes:<,extends:> "listchars
" au BufRead,BufNewFile *.phps    set filetype=php 
" autocmd FileType text setlocal textwidth=78
" And u use the gqap and 'wrapmargin' + 'formatoptions'
set fo=
set fo-=t " autowrap by 'tw' m/b - it and use only gq
set fo+=c " autowrap coments use 'tw' 
set fo+=r " insert comment leader on <Enter>
set fo+=o " insert comment leader on 'o'/'O'
set fo+=q " allow gq
set fo+=l " Long lines not broken in insmod
set fo-=1 " one-latter word not brake
set tw=78 "textwidth
"set fex "formatexpr
"set fp "formatprg

set ai "autoindent
"set ci "cindent
set si "smartindent

" Folding
set fdc=2 "foldcolumn
"m/b marker? btw 
set fdm=indent "foldmethod
"set fdi=# "foldifnore
"set fcl=all "foldclose
" Create zf
" Delete zd
" zn none
" zN Normal
" zi invert

" Numbering
" :#
set nonu "number
set nuw=1 "numberwidth

" Status
":set ruf "rulerformat=%15(%c%V\ %p%%%)
set ru "ruler
" Shows what you are typing as a command.
set sc "showcmd
" Shows bracket
set sm "showmatch
" Highlight current line
set cul " cursorline
set stl=%<%f%h%m%r\ %b\ %{&encoding}\ (%{&ff})\ 0x%B\ \ %l,%c%V\ %P\ [%p%%] "statusline
" Show statusline always
set ls=2 "laststatus


" Complete
" ^X + Y line complete !!!yatta!!!
set cpt=
set cpt-=i " cur & include file
set cpt+=. " the current buffer
set cpt+=k " :set dictionary
set cpt+=w " other windows
set cpt+=b " in loaded buflist
set cpt+=u " unloaded buflist
set cpt+=t " same as "]" tag complete
"completeopt default "menu,preview"
set cot-=preview " no insert preview in line
set cot-=menuone " onmatch, useful e.g., what file it comes from
set cot+=longest " ^L to add more characters
" ^X + ^U
"set cfu "completefunc
set cpo-=< "cpoptions

" In cmdmode press 'wc' + show matches
set wmnu "wildmenu
" Cool tab completion stuff
set wim=list:longest,full "wildmode
set wcm=<C-Z>

" History
set hi=1000 "history
set ul=1000 "undolevels

set encoding=utf8
set termencoding=utf8
set fileencoding=utf8
"set encoding=cp1251
"set termencoding=cp1251
"set fileencoding=cp1251
set fileencodings=utf8,koi8r,cp1251

"set grepprg=grep\ -n\ $*\ /dev/null
set grepprg=grep\ -nH\ $*

" Moving then?
" Don't forget ^E ^Y - move buf up/down
" zh zl - move buf left/right " ^O ^I - older/newer jump list
" ^] ^T - jump keyword definition / older tag stack
" ^U ^D - half page up/down (scroll page Up/Down)
" ^B ^F - full page up/down (list page Back/Forward)
" zt zz z. zb - Zoom Top/middle ^/Bottom
" H M L - move Cursor to Home / Middle / Lower
" BAD:
" up/down scroll when max lines to cover
"set scrolljump=7
"set scrolloff=7

" GUI
"set gfn=Lucida_Console:h9:cRUSSIAN
"set guifont=Bitstream_Vera_Sans_MONO:h09:cANSI
set gfn=Terminus\ 10 "guifont
"set go=egmrLtT " win32
"set go=agimrLtT " GTK
set go=agimrLtT "guioptions
set go-=T " hide buttons

" New way?
set ttyfast

" Mouse
"set mouse=-a in console vim/.vimrc
set mouse=a
set mousem=popup "mousemodel
set nomousef "nomousefocus
set nomh "nomousehide

" Always show tab bar
set stal=2 "showtabline

" Set ink Mappings
" Russian map, if save in utf-8 encoding - not work
" òåñò êîäèðîâêè äîëæíà áûòü cp1251
"set langmap=Æ:,éq,öw,óe,êr,åt,íy,ãu,øi,ùo,çp,õ[,ú],ôa,ûs,âd,àf,ïg,ðh,îj,ëk,äl,ý',ÿz,÷x,ñc,ìv,èb,òn,üm,á\,,þ.,¸`

" Say no for yes/menu use :simalt
set wak=no "winaltkeys

"-u || --noplugin
"set rtp "runtimepath
"set lpl "loadplugins

if has("gui_running")
    colo desert "colorscheme
    "inkpot
else
    colo metacosm
endif

syn on "syntax

filetype plugin indent on

" save session :ss

au VimEnter * set winheight=999

" USEFUL little maps
let g:mapleader=\
" Block ident like u think it
vmap < <gv
vmap > >gv
" Next/prev search centered
map N Nzz
map n nzz

" Up and down are more logical with g..
nnoremap <silent> k gk
nnoremap <silent> j gj
vnoremap <silent> k gk
vnoremap <silent> j gj

" Awesome remap jj to escape in insert mode.
inoremap jj <Esc>
"XXX: must testit
nnoremap JJJJ <Nop>

"tab indexes
noremap <M-1> 1gt
noremap <M-2> 2gt
noremap <M-3> 3gt
noremap <M-4> 4gt
noremap <M-5> 5gt
noremap <M-6> 6gt
noremap <M-7> 7gt
noremap <M-8> 8gt
noremap <M-9> 9gt
noremap <M-0> 10gt

"TODO find useful bind 4 this cool replace word under cursor
"nmap ~ :%s/\<<c-r>=expand("<cword>")<cr>\>/

" unbindall "it word to me 4 remaind my tries on map not mapt
"z,
"z/
"zy
"zp
"z[
"z]
imap <C-l> <Esc>la
imap <C-enter> <Esc>i

" replace mode off 
imap <Ins> <Esc>i

map <Leader>\ <Esc>:nohls<CR>

" Highlight every other line
map <Leader><Tab> :set hls<CR>/\n.*\n/<CR>

" This is for working across multiple xterms and/or gvims
" Transfer/read and write one block of text between vim sessions (capture whole line):
" Write
nmap <Leader>w :. w! ~/.vimxfer<CR>
" Read
nmap <Leader>r :r ~/.vimxfer<CR>
" Append 
nmap <Leader>a :. w! >>~/.vimxfer<CR>
"}}}

"m/b u n3d a caps HJKL for ^W_ ^W|
"or meta-* not present
map <silent> <Left> h
map <silent> <Right> l
map <silent> <Up> k
map <silent> <Down> j

" Good call Benjie (r for i)
" XXX:
"nnoremap <silent> <Home> i <Esc>r
"nnoremap <silent> <End> a <Esc>r

" Plugins maps
"
" closetag <C-_>

" Open the Project Plugin <F2>
nnoremap <silent> <F2> :Project<CR>
" Project
" \C (\c no recurse) start wizard (name, path, cd, filter:*)

" SnippetEmu
let g:snippetsEmu_key = "<Tab>"
"Snippet who test it <{var}><CR>

" [n],c[comment]
" [n],c[nested]
" [n],c<space> Toggle
" [n],c[multipart]
" [n],c[invert] Toggle individualy
" [n],c[sexy]
" [n],c[yanked] like cc
" ,c$ cc to eol
" ,cA cc start from eol + IMode
" ,cI cc start from begin + IMode
" ,c[alternative] delimiter switch
" [n],c[l/r/b] left/right/both sides
" let g:loaded_nerd_comments=1
let g:NERDSpaceDelims=1
let g:NERDCompactSexyComs=1
let g:NERDComInInsertMap="<C-j>"

" Open the TagList Plugin <F3>
nnoremap <silent> <F3> :Tlist<CR>
" Tlist
let g:Tlist_GainFocus_On_ToggleOpen = 1
let g:Tlist_Show_One_File = 1
"{{{Taglist configuration
let g:Tlist_Use_Right_Window = 1
let g:Tlist_Enable_Fold_Column = 0
let g:Tlist_Exit_OnlyWindow = 1
let g:Tlist_Use_SingleClick = 1
let g:Tlist_Inc_Winwidth = 0
"}}}

" VCScommand
nmap <Leader>va <Plug>VCSAdd
nmap <Leader>vn <Plug>VCSAnnotate
nmap <Leader>vc <Plug>VCSCommit
nmap <Leader>vd <Plug>VCSDiff
nmap <Leader>vg <Plug>VCSGotoOrig
nmap <Leader>vG <Plug>VCSGotoOrig
nmap <Leader>vl <Plug>VCSLog
nmap <Leader>vL <Plug>VCSLock
nmap <Leader>vr <Plug>VCSReview
nmap <Leader>vs <Plug>VCSStatus
nmap <Leader>vu <Plug>VCSUpdate
nmap <Leader>vU <Plug>VCSUnlock
nmap <Leader>vv <Plug>VCSVimDiff

" Since I use linux, I want this
"XXX:let g:clipbrdDefaultReg = '+'

" VIMcoding
"XXX: this is mega test u need to check workflow it
"TODO: not work in split tab mode
"{{{search & highlight match word under cursor
"highlight flicker gui=bold guifg=white cterm=bold ctermfg=white
highlight flicker guibg=black ctermbg=grey
au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'
"}}}

"{{{ Functions

"{{{ Open URL in browser

function! Browser ()
    let line = getline (".")
    let line = matchstr (line, "http[^   ]*")
    exec "!konqueror ".line
endfunction

"}}}

"{{{Theme Rotating
let themeindex=0
function! RotateColorTheme()
    let y = -1
    while y == -1
        let colorstring = "inkpot#ron#blue#elflord#evening#koehler#murphy#pablo#desert#torte#"
        let x = match( colorstring, "#", g:themeindex )
        let y = match( colorstring, "#", x + 1 )
        let g:themeindex = x + 1
        if y == -1
            let g:themeindex = 0
        else
            let themestring = strpart(colorstring, x + 1, y - x - 1)
            return ":colorscheme ".themestring
        endif
    endwhile
endfunction
" }}}

"{{{ Paste Toggle
let paste_mode = 0 " 0 = normal, 1 = paste

func! Paste_on_off()
    if g:paste_mode == 0
        set paste
        let g:paste_mode = 1
    else
        set nopaste
        let g:paste_mode = 0
    endif
    return
endfunc
"}}}

"{{{ Todo List Mode

function! TodoListMode()
    e ~/.todo.otl
    Calendar
    wincmd l
    set foldlevel=1
    tabnew ~/.notes.txt
    tabfirst
    " or 'norm! zMzr'
endfunction

"}}}

"}}}

"FIXME: not tested
"{{{New Scons, Old make, autoconf
" autocmd BufReadPre SConstruct set filetype=python
" autocmd BufReadPre SConscript set filetype=python
"}}}

"{{{if any say it, u need it
" set tags=tags;/
"}}}

"{{{security????
"au BufNewFile,BufReadPre *.gpg :set secure vimi= noswap noback nowriteback
"hist=0 binary
"au BufReadPost *.gpg :%!gpg -d 2>/dev/null
"au BufWritePre *.gpg :%!gpg -e -r 'name@email.com' 2>/dev/null
"au BufWritePost *.gpg u
"}}}

"{{{Auto Commands

" Automatically cd into the directory that the file is in
" autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before
" augroup JumpCursorOnEdit
   " au!
   " autocmd BufReadPost *
            " \ if expand("<afile>:p:h") !=? $TEMP |
            " \   if line("'\"") > 1 && line("'\"") <= line("$") |
            " \     let JumpCursorOnEdit_foo = line("'\"") |
            " \     let b:doopenfold = 1 |
            " \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            " \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            " \        let b:doopenfold = 2 |
            " \     endif |
            " \     exe JumpCursorOnEdit_foo |
            " \   endif |
            " \ endif
   " " Need to postpone using "zv" until after reading the modelines.
   " autocmd BufWinEnter *
            " \ if exists("b:doopenfold") |
            " \   exe "normal zv" |
            " \   if(b:doopenfold > 1) |
            " \       exe  "+".1 |
            " \   endif |
            " \   unlet b:doopenfold |
            " \ endif
" augroup END

"{{{ Mappings

" Open Url on this line with the browser \w
" map <Leader>w :call Browser ()<CR>

" Open the Project Plugin
" nnoremap <silent> <Leader>pal  :Project .vimproject<CR>

" TODO Mode
" nnoremap <silent> <Leader>todo :execute TodoListMode()<CR>

" Next Tab
" nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
" nnoremap <silent> <C-Left> :tabprevious<CR>

" New Tab
" nnoremap <silent> <C-t> :tabnew<CR>

" Rotate Color Scheme <F8>
" nnoremap <silent> <F8> :execute RotateColorTheme()<CR>

" DOS is for fools.
" nnoremap <silent> <F9> :%s/$//g<CR>:%s// /g<CR>
" Paste Mode!  Dang! <F10>
" nnoremap <silent> <F10> :call Paste_on_off()<CR>
" set pastetoggle=<F10>
"
" Edit vimrc \ev
" nnoremap <silent> <Leader>ev :tabnew<CR>:e ~/.vimrc<CR>
"
" Edit gvimrc \gv
" nnoremap <silent> <Leader>gv :tabnew<CR>:e ~/.gvimrc<CR>
"
" Create Blank Newlines and stay in Normal mode
" nnoremap <silent> zj o<Esc>
" nnoremap <silent> zk O<Esc>
"
" Space will Toggle folds!
" nnoremap <space> za
" nnoremap <Enter> zA
"
" inoremap <expr> <cr> pumvisible() ? "\<c-y>" : "\<c-g>u\<cr>"
" inoremap <expr> <c-n> pumvisible() ? "\<lt>c-n>" : "\<lt>c-n>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
" inoremap <expr> <m-;> pumvisible() ? "\<lt>c-n>" : "\<lt>c-x>\<lt>c-o>\<lt>c-n>\<lt>c-p>\<lt>c-r>=pumvisible() ? \"\\<lt>down>\" : \"\"\<lt>cr>"
"
" Fix email paragraphs
" nnoremap <leader>par :%s/^>$//<CR>
"
" let g:rct_completion_use_fri = 1
" let g:Tex_DefaultTargetFormat = "pdf"
" let g:Tex_ViewRule_pdf = "kpdf"


" OLDIES
" imap <F1> <Esc>:set<Space>nu!<CR>a
" nmap <F1> :set<Space>nu!<CR>

" imap <S-F1> <Esc>:set<Space>hls!<CR>a
" nmap <S-F1> :set<Space>hls!<CR>

" imap <C-F1> <Esc>:set<Space>wrap!<CR>a
" nmap <C-F1> :set<Space>wrap!<CR>

" map <M-F5> :e ++enc=cp866<CR>
" vmap <M-F5> <Esc>:e ++enc=cp866<CR> 
" imap <M-F5> <Esc>:e ++enc=cp866<CR>

" map <M-F6> :e ++enc=cp1251<CR>
" vmap <M-F6> <Esc>:e ++enc=cp1251<CR> 
" imap <M-F6> <Esc>:e ++enc=cp1251<CR>

" map <M-F7> :e ++enc=koi8<CR>
" vmap <M-F7> <Esc>:e ++enc=koi8<CR> 
" imap <M-F7> <Esc>:e ++enc=koi8<CR>

" map <M-F8> :e ++enc=utf8<CR>
" vmap <M-F8> <Esc>:e ++enc=utf8<CR> 
" imap <M-F8> <Esc>:e ++enc=utf8<CR>

" map <F8> :wa<CR>:make<CR>
" vmap <F8> <Esc>:wa<CR>:make<CR> 
" imap <F8> <Esc>:wa<CR>:make<CR>

" map <S-F8> :copen<CR>
" vmap <S-F8> <Esc>:copen<CR> 
" imap <S-F8> <Esc>:copen<CR>

" map <C-F8> :cn<CR>
" vmap <C-F8> <Esc>:cn<CR> 
" imap <C-F8> <Esc>:cn<CR>

" map <F9> :emenu <C-Z>
" vmap <F9> :emenu <C-Z>
" imap <F9> :emenu <C-Z>

" map <C-F9> :Project<CR>
" vmap <C-F9> :Project<CR>
" imap <C-F9> :Project<CR>

" map <F10> :MarksBrowser<CR>
" vmap <F10> <Esc>:MarksBrowser<CR> 
" imap <F10> <Esc>:MarksBrowser<CR>

" map <F11> :TlistToggle<CR>
" vmap <F11> <Esc>:TlistToggle<CR>
" imap <F11> <Esc>:TlistToggle<CR>

" nmap <F12> <Esc>:BufExplorer<CR>
" vmap <F12> <Esc>:BufExplorer<CR>
" imap <F12> <Esc><esc>:BufExplorer<CR>
