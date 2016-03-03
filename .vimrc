set nocompatible "nocp
"
" TODO:
" ack-grep 'sub\s+get_child_props' nms/trunk/
" ctags -f tags --recurse --totals --exclude=*.swp --exclude=.hg
" --exclude='*~' --languages=Perl --langmap=Perl:+.t
"
"http://push.cx/2008/256-color-xterms-in-ubuntu
":%s/<\/\?\zs\(\a\+\)\ze[ >]/\L\1/g HTML2XHTML tag2lower
":%s/\(<[^>]*\)\@<=\<\(\a*\)\ze=['"]/\L\2/g attr2lower
":%s,\s*\(\S\+\)\s*,<td>\1</td>,g space div table 2 <td>
"http://search.cpan.org/~geoffr/Text-VimColor/
"http://www.exaile.org/vim.png
"perldoc perldsc
"perldoc perlreftut
"http://stackoverflow.com/questions/4974539/vim-plugin-to-show-current-perl-subroutine
"
" XXX: don't forget to install vim-nox
"
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
syntax on
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWritePost *.py call Flake8()
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:flake8_ignore='E501'

"colorscheme
if has("gui_running")
    colo wombat
    " colo desert
    " colo inkpot
else
    colo wombat256
    " colo zenburn
    " colo vividchalk
    " colo distinguished
    " colo candy
endif

set background=dark "bg
set guifont=Monaco\ 10
"set guioptions=aegimrLtT
set guioptions=aegirL

" :h backspace?
set backspace=indent,eol,start "bs
"whichwrap+=<,>,[,] " you must forget <- ->

" When I close a tab, remove the buffer || no unload buffer
set nohid "nohidden
"set fs "fsync
"set sws "swapsync


set mouse=
"set mousem=popup

set noautoindent "noai
"set cindent "ci
set smartindent "si

"cpt " ^X + Y line complete !!!yatta!!!
set complete=
"set complete-=i " cur & include file
set complete+=. " the current buffer
set complete+=k " :set dictionary
set complete+=w " other windows
set complete+=b " in loaded buflist
set complete+=u " unloaded buflist
set complete+=t " same as "]" tag complete
set completeopt-=preview " no insert preview in line
set completeopt-=menuone " onmatch, useful e.g., what file it comes from
set completeopt+=longest " ^L to add more characters
"set completeopt-=<   "cpo
"set completefunc     "cfu

"formatoptions
set fo=
set fo+=c " autowrap coments use 'tw' 
set fo+=r " insert comment leader on <Enter>
set fo+=o " insert comment leader on 'o'/'O'
set fo+=q " allow gq
set fo+=l " Long lines not broken in insmod
set fo-=t " autowrap by 'tw' m/b - it and use only gq
set fo-=1 " one-latter word not brake

set ignorecase "ic " Ignoring case is a fun trick
set smartcase "scs " Override ic only for /, ?, n, N

set incsearch "is " Incremental search by typing
set hlsearch "hls " Highlight things that we find with the search
" nohlsearch binding
" map <F5> :noh<CR>

set expandtab "et " Tabs modificated to space
set tabstop=4 "ts
set shiftwidth=4 "sw
set softtabstop=4 "sts
set smarttab "sta " <BS> remove <Tab>

set showcmd       "sc Shows what you are typing as a command.
set showmode      
set showmatch     "sm Shows bracket
set splitbelow
set splitright

set foldcolumn=0 "fdc
set foldmethod=indent "fdm
"set foldifnore=# "fdi
"set foldclose=all "fcl
" Help:
" Create zf
" Delete zd
" zn none
" zN Normal
" zi invert


set nolist
set nonumber        "non :#
set ruler           "ru
"set ruf "rulerformat=%15(%c%V\ %p%%%)
set cursorline      "cul Highlight current line
set visualbell t_vb=    " turn off error beep/flash
set novisualbell    " turn off visual bell

set linebreak       " linebreaks
set wrap            " set wrap for lines "TODO: use bind for wrap!
set sidescroll=1    "ss
set title           " show title in the console title bar
set ttyfast         " smoother changes
set wak=yes         " winaltkeys: menu "TODO: no
set nostartofline   " don't jump to first character when paging
set t_Co=256        " set number of colors
set wildignore=*.o,*~,*.obj,*.bak,*.exe,*.pyc,*.DS_Store,*.db
set wildmenu        "wmnu " In cmdmode press 'wc' + show matches
set wildchar=<Tab>  "wc
set wildmode=list:longest,full "wim " Cool tab completion stuff
"set wildcharm=<C-Z>"wcm

"set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ (%{&ff})\ 0x%B\ \ %l,%c%V\ %P\ [%p%%] "stl
"set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x%B\ \ %l,%c%V\ %P " Highlight current line
set statusline=%<%([%-n]%y[%{&encoding}]\ %f%h%m%r%)\ %=\ %(%b\ 0x%B\%)\ %(%l,%c%V\ %P%)\ %{fugitive#statusline()}
set laststatus=2    "ls Show statusline always

set history=5000
set undolevels=5000

set encoding=utf8
set termencoding=utf8
set fileencoding=utf8
set fileencodings=utf8 ",koi8r,cp1251

"set grepprg=grep\ -n\ $*\ /dev/null
set grepprg=grep\ -nH\ $*

set nohidden " no unload buffer
set notildeop
set nowrapscan "nows " search wrap around end file

set dir=/tmp

set spelllang=en "spl
set nospell
"set spellfile "for zg and zw zW zG zuW zuG
"spellcheck... z=
"set spellgood

"set noguipty
"set tw=78 "textwidth
"set wrapmargin=0 "start wrapping
"set fex "formatexpr
"set fp "formatprg

"set rtp "runtimepath
"set lpl "loadplugins

let g:showmarks_enable=0
let g:python_highlight_all=1
"let python_highlight_indent_errors=0
"let python_highlight_space_errors=0

" shortcut to rapidly toggle `set list`
map <F2> :marks<CR>

let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeShowBookmarks=1
map <F3> :NERDTreeToggle<CR>

" TagList Plugin Configuration
let Tlist_Ctags_Cmd='/usr/bin/ctags'       " point taglist to ctags
let Tlist_GainFocus_On_ToggleOpen = 1      " Focus on the taglist when its toggled
let Tlist_Close_On_Select = 1              " Close when something's selected
let Tlist_Use_Right_Window = 1             " Project uses the left window
let Tlist_File_Fold_Auto_Close = 1         " Close folds for inactive files
map <F4> :TlistToggle<CR>

"set invhlsearch <F5>
let g:toggle_hls_flag=0
function! ToggleNoHl()
if g:toggle_hls_flag == 0
    let g:toggle_hls_flag=1
    nmap \\ <ESC>/<c-r>/<CR><c-o>:call ToggleNoHl()<CR>
else
    let g:toggle_hls_flag=0
    nmap \\ <ESC>:nohl<CR>:call ToggleNoHl()<CR>
endif
perl << EOF
  my ($success, $val) = VIM::Eval('g:toggle_hls_flag');
  VIM::Msg("toggle_hls_flag:$val");
EOF
endfunction

" DOS is for fools.
" nnoremap <silent> <F9> :%s/$//g<CR>:%s// /g<CR>

" Open the Project Plugin <F10>
nnoremap <silent> <F10> :Project<CR>

" F11 - Gnome Fullscreen

" Paste Mode!  Dang! <F12>
" nnoremap <silent> <F12> :call Paste_on_off()<CR>
" set pastetoggle=<F12>

set tags=tags;$HOME/.vim/tags/ "recursively searches directory for 'tags' file


" Plugins maps
" closetag <C-_>
" Project \C (\c no recurse) start wizard (name, path, cd, filter:*)

if has("autocmd")
  au FileType djangohtml,html,xhtml,xml source ~/.vim/macros/closetag.vim

  " code completion
  " au FileType python setlocal omnifunc=pythoncomplete#Complete
  au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  au FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  au FileType css setlocal omnifunc=csscomplete#CompleteCSS

  " code indentation
  au FileType perl setlocal noexpandtab
  au FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
  au FileType fbml setlocal filetype=djangohtml

  " some extra filetypes
  au BufNewFile,BufRead *.mustache setfiletype mustache
  au BufNewFile,BufRead *.mustache setlocal autoindent
  au BufNewFile,BufRead *.go setfiletype go
  au BufNewFile,BufRead *.feature setfiletype ruby
  au BufNewFile,BufRead *.ru setfiletype ruby
  au BufNewFile,BufRead .vimrc setlocal tabstop=2 shiftwidth=2 softtabstop=2
  au BufNewFile,BufRead Gemfile setfiletype ruby
endif

" unbindall "it word to me 4 remaind my tries on map not mapt
"z,
"z/
"zy
"zp
"z[
"z]

" Not work
"syntax match Tab /\t/
"hi Tab gui=underline guifg=blue ctermbg=blue

map <silent> <Left> h
map <silent> <Right> l
map <silent> <Up> k
map <silent> <Down> j

" save session :ss

au VimEnter * set winheight=999

let mapleader = "\\"
" nmap <leader>\ :noh<CR>
" nmap <leader>\ :invhlsearch<CR>

" nnoremap <leader>\ <Esc>:nohl<CR>
nmap <leader>\ <ESC>:nohl<CR>:call ToggleNoHl()<CR>

" Highlight every other line
map <leader><Tab> :set hls<CR>/\n.*\n/<CR>

"{{{ Block across terms
" This is for working across multiple xterms and/or gvims
" Transfer/read and write one block of text between vim sessions (capture whole line):
" Write
nmap <leader>w :. w! ~/.vimxfer<CR>
" Read
nmap <leader>r :r ~/.vimxfer<CR>
" Append 
nmap <leader>a :. w! >>~/.vimxfer<CR>
"}}}

map <leader>h :call HTMLEncode()<CR>
map <leader>H :call HTMLDecode()<CR>

let mapleader = ","
" use the same symbols as TextMate for tabstops and EOLs
"set listchars=tab:▸\ ,eol:¬
set listchars=tab:▸\ ,eol:¬,trail:\ ,precedes:<,extends:> "lcs

" nmap <leader>, :set list!<CR>
nmap <leader>, :call ToggleColumn()<CR>

" make block-indent in visual block
vmap < <gv
vmap > >gv
vmap <S-Tab> <gv
vmap <Tab> >gv

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

" replace mode off
imap <Ins> <Esc>i

imap <C-l> <Esc>la
imap <C-enter> <Esc>i

" TODO Mode
" nnoremap <silent> <Leader>todo :execute TodoListMode()<CR>
" match Todo /\s\+$/

" Next Tab
nnoremap <silent> <S-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <S-Left> :tabprevious<CR>

" New Tab
" dont map C-T, it is for ctags
nnoremap <silent> <S-T> :tabnew<CR>

function! AwesomeHL()
  highlight flicker guibg=black ctermbg=grey
  " au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'
  au CursorMoved <buffer> exe 'match flicker /\V\<'.tr(expand('<cword>'), "^$([])\\/", '........').'\>/'
endfunction

autocmd BufWinEnter * call AwesomeHL()

set tildeop "top " When on: ~ like operator (dd, yy, cc)
nmap ~ :%s/\<<c-r>=expand("<cword>")<cr>\>/


highlight TrailingSpace ctermbg=red guibg=red
autocmd BufWinEnter * match TrailingSpace /\s\+$\| \+\ze\t/
" autocmd InsertLeave * match TrailingSpace /\s\+$/
" autocmd InsertEnter * match TrailingSpace /\s\+\%#\@<!$/

highlight SignColumn guifg=DarkGray guibg=Black
highlight FoldColumn guifg=DarkGray guibg=Black 

function! s:FixTrailingSpace(line1,line2)
    let l:save_cursor = getpos(".")
    silent! execute ':' . a:line1 . ',' . a:line2 . 's/\s\+$//'
    call setpos('.', l:save_cursor)
endfunction

" Run :FixWhitespace to remove end of line white space.
command! -range=% FixTrailingSpace call <SID>FixTrailingSpace(<line1>,<line2>)

" http://vimdoc.sourceforge.net/htmldoc/vimfaq.html
" 5.5. How do I configure Vim to open a file at the last edited location?
" Vim stores the cursor position of the last edited location for each buffer
" in the '"' register. You can use the following autocmd in your .vimrc or
" .gvimrc file to open a file at the last edited location:
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" :cn
" :copen
" :make
" comp! gcc "compiler
au FileType perl call PerlMode()
function! PerlMode()             " Stolen from David Hand
  " set makeprg=perl\ -I/mnt/ncp105/nmsrc/nms/trunk\ -I/mnt/ncp105/nmsrc/nmc/trunk\ -cWT\ %\ $*
  set makeprg=perl\ -I/mnt/ncp105/nmsrc/nms/trunk\ -I/mnt/ncp105/nmsrc/nmc/trunk\ -c\ %\ $*
  " efm
  " set errorformat=%f:%l:%m
  set errorformat=%m\ at\ %f\ line\ %l%.%#,%-G%.%#
  set autowrite               " write buf every time :make
  set textwidth=78            " tw:  wrap at 78 characters
  set autoindent              " ai:  indent to match previous line
  set cindent                 " cin:  Use C-indenting
  set cinkeys=0{,0},!^F,o,O,e " cink:  Perl-friendly reindent keys
  set cinoptions=t0,+4,(0,)60,u0,*100  " cino:  all sorts of options
  set cinwords=if,else,while,do,for,elsif,sub
  set comments=n:#            " com:  Perlish comments
  set formatoptions=crql      " fo:  word wrap, format comments
  set nosmartindent           " nosi:  Smart indent useless when C-indent is on
  set showmatch               " show matches on parens, bracketc, etc.
  set keywordprg=sh\ -c\ 'perldoc\ -f\ \$1\ \|\|\ perldoc\ \$1'\ --
  " noremap K :!perldoc <cword> <bar><bar> perldoc -f <cword><cr>
  let g:perl_extended_vars=1
endfunction

"{{{ Open URL in browser

function! Browser ()
    let line = getline (".")
    let line = matchstr (line, "http[^   ]*")
    exec "!konqueror ".line
endfunction

"}}}

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

"{{{security????

"au BufNewFile,BufReadPre *.gpg :set secure vimi= noswap noback nowriteback
"hist=0 binary
"au BufReadPost *.gpg :%!gpg -d 2>/dev/null
"au BufWritePre *.gpg :%!gpg -e -r 'name@email.com' 2>/dev/null
"au BufWritePost *.gpg u
"}}}

"}}}

"http://qbnz.com/highlighter/
function! HTMLEncode()
perl << EOF
 use HTML::Entities;
 @pos = $curwin->Cursor();
 $line = $curbuf->Get($pos[0]);
 $encvalue = encode_entities($line);
 $curbuf->Set($pos[0],$encvalue)
EOF
endfunction

function! HTMLDecode()
perl << EOF
 use HTML::Entities;
 @pos = $curwin->Cursor();
 $line = $curbuf->Get($pos[0]);
 $encvalue = decode_entities($line);
 $curbuf->Set($pos[0],$encvalue)
EOF
endfunction

function! ToggleColumn()
  ShowMarksToggle
  set number!
  set list!
perl << EOF
  my ($success, $fdc) = VIM::Eval('&fdc');
  if ( $success && $fdc eq '2' ) {
    VIM::SetOption("fdc=0");
  } else {
    VIM::SetOption("fdc=2");
  }
EOF
endfunction

"{{{Auto Commands

" Automatically cd into the directory that the file is in
" autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
" autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Another yet:
" autocmd BufWritePre * :call <SID>StripWhite()
" fun! <SID>StripWhite()
    " %s/[ \t]\+$//ge
    " %s!^\( \+\)\t!\=StrRepeat("\t", 1 + strlen(submatch(1)) / 8)!ge
" endfun

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
" if has("cscope") && filereadable("/usr/bin/cscope")
"    set csprg=/usr/bin/cscope
"    set csto=0
"    set cst
"    set nocsverb
"    " add any database in current directory
"    if filereadable("cscope.out")
"       cs add cscope.out
"    " else add database pointed to by environment
"    elseif $CSCOPE_DB != ""
"       cs add $CSCOPE_DB
"    endif
"    set csverb
" endif
"}}}

"SnippetEmu
"let g:snippetsEmu_key = "<Tab>"
function! UpdatePathogen()
  execute "!curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim"
endfunction

let g:solarized_termcolors=256
:autocmd FileType python :iabbrev <buffer> ipython import IPython;IPython.embed()<esc>
:autocmd FileType python :iabbrev <buffer> pudb import pudb;pudb.set_trace()<esc>
