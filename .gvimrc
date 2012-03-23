" And u use the gqap and 'wrapmargin' + 'formatoptions'

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
" тест кодировки должна быть cp1251
"set langmap=Ж:,йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,э',яz,чx,сc,мv,иb,тn,ьm,б\,,ю.,ё`

" Good call Benjie (r for i)
" XXX:
"nnoremap <silent> <Home> i <Esc>r
"nnoremap <silent> <End> a <Esc>r


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

"{{{ Functions

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


"{{{ Mappings

" Rotate Color Scheme <F8>
" nnoremap <silent> <F8> :execute RotateColorTheme()<CR>

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

" map <F9> :emenu <C-Z>
" vmap <F9> :emenu <C-Z>
" imap <F9> :emenu <C-Z>

" map <F10> :MarksBrowser<CR>
" vmap <F10> <Esc>:MarksBrowser<CR> 
" imap <F10> <Esc>:MarksBrowser<CR>

" nmap <F12> <Esc>:BufExplorer<CR>
" vmap <F12> <Esc>:BufExplorer<CR>
" imap <F12> <Esc><esc>:BufExplorer<CR>

" ~/.vim/plugin/gitignore.vim
" let filename = '.gitignore'
" if filereadable(filename)
    " let igstring = ''
    " for oline in readfile(filename)
        " let line = substitute(oline, '\s|\n|\r', '', "g")
        " if line =~ '^#' | con | endif
        " if line == '' | con  | endif
        " if line =~ '^!' | con  | endif
        " if line =~ '/$' | let igstring .= "," . line . "*" | con | endif
        " let igstring .= "," . line
    " endfor
    " let execstring = "set wildignore=".substitute(igstring, '^,', '', "g")
    " execute execstring
" endif	
