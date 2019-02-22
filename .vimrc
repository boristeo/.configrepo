" _    ___
"| |  / (_)___ ___  __________
"| | / / / __ `__ \/ ___/ ___/
"| |/ / / / / / / / /  / /__
"|___/_/_/ /_/ /_/_/   \___/
"------------------------------------------------------------------------------

" Sections marked with `#@#' tag

""" INCLUDES
so ~/.vim/luke/prose.vim
so ~/.vim/luke/deadkeys.vim
so ~/.vim/luke/ipa.vim

"#@#options----------------------
"            __  _
" ___  ___  / /_(_)__  ___  ___
"/ _ \/ _ \/ __/ / _ \/ _ \(_-<
"\___/ .__/\__/_/\___/_//_/___/
"   /_/

" Some basics:
set nocompatible
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

" Let's try this out
set hidden

set nottyfast
set nolazyredraw

syntax on
set backspace=indent,eol,start
"set modifiable
set autoread
set autowrite
set signcolumn=yes

set mouse=a
set mousehide

" Case insensitive search unless you use capital letters
set ignorecase
set smartcase

set incsearch
set hlsearch
set gdefault

set belloff=all

" Enable override from working dir
set exrc
set secure

" Gutter numbers
set number
set norelativenumber

" Indentation
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set cindent
set shiftwidth=4
set smarttab
filetype plugin indent on

set ruler
" Alignment of switch and case statements
set cinoptions=:0,l1

" Folding
set foldmethod=manual
set foldlevelstart=10

function! MyFoldText()
    let line = getline(v:foldstart)
    let eline = getline(v:foldend)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 6
    let foldedlinecount = v:foldend - v:foldstart

    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')
    let eline = substitute(eline, '\t', '', 'g')
    let eline = substitute(eline, ' ', '', 'g')

    "let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
	let fillcharcount = windowwidth - len(line) - len(eline) - len(foldedlinecount)
    return line . '...' . eline . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction
set foldtext=MyFoldText()

" Wrapping
set nowrap
set formatoptions-=tc
set fo-=a
"set textwidth=80

" Enable autocompletion:
set wildmode=longest,list,full
set wildmenu
set wildignorecase

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright
set fillchars+=stl:━
set fillchars+=stlnc:─
set fillchars+=vert:│
set fillchars+=fold:\ "
set fillchars+=diff:\ "

" Highlighting
hi EndOfBuffer				ctermbg=NONE	ctermfg=0		cterm=NONE
hi MatchParen				ctermbg=NONE	ctermfg=12		cterm=NONE
hi Search					ctermbg=3		ctermfg=0		cterm=NONE
hi ColorColumn				ctermbg=8		ctermfg=NONE    cterm=NONE
hi VertSplit				ctermbg=NONE	ctermfg=0       cterm=NONE
hi statusline				ctermbg=NONE	ctermfg=0       cterm=NONE
hi statuslinenc				ctermbg=NONE	ctermfg=0		cterm=NONE
hi Folded					ctermbg=NONE	ctermfg=8		cterm=NONE
hi StatusLineTerm			ctermbg=NONE	ctermfg=4		cterm=NONE
hi StatusLineTermNC			ctermbg=NONE	ctermfg=4		cterm=NONE
hi Pmenu					ctermbg=0		ctermfg=7		cterm=NONE
hi TabLineFill				ctermbg=8		ctermfg=8		cterm=NONE
hi TabLine					ctermbg=8		ctermfg=7		cterm=NONE
hi TabLineSel				ctermbg=0		ctermfg=7		cterm=NONE
hi LineNr					ctermbg=NONE	ctermfg=8		cterm=NONE
hi GitGutterAdd				ctermbg=NONE	ctermfg=8		cterm=NONE
hi GitGutterChange			ctermbg=NONE    ctermfg=8		cterm=NONE
hi GitGutterDelete			ctermbg=NONE    ctermfg=8		cterm=NONE
hi GitGutterChangeDelete	ctermbg=NONE    ctermfg=8		cterm=NONE


" Completions
set pumheight=10
set completeopt=longest,menuone,preview
imap <c-space> <c-n>
imap <c-@> <c-space>


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['flake8']
let g:tex_flavor = "latex"
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_loc_list_height=4
let g:syntastic_disabled_filetypes=['c','cpp','h']

let g:clang_c_options = '-std=c99'
let g:clang_cpp_options = '-std=gnu++11 -stdlib=libc++ -Wall -Wshadow -Wpedantic -Wno-pragma-once-outside-header'
let g:clang_format_style = 'file'
let g:clang_check_syntax_auto = 1
let g:clang_verbose_pmenu=1

"#@#mappings-----------------------------
"                        _
"  __ _  ___ ____  ___  (_)__  ___ ____
" /  ' \/ _ `/ _ \/ _ \/ / _ \/ _ `(_-<
"/_/_/_/\_,_/ .__/ .__/_/_//_/\_, /___/
"          /_/  /_/          /___/

"let maplddeader =" "

" For moving lines (^] is a special character; use <M-k> and <M-j> if it works)
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Duplicate line with <C-d>
nnoremap <C-d> yyp
inoremap <C-d> <Esc>yypi
vnoremap <C-d> yP

" Shift tab removes indent
inoremap <S-Tab> <C-d>

" Brackets
inoremap {<CR> {<CR>}<C-o>O

" Shortcutting split navigation, saving a keypress:
"map <C-h> <C-w>h
"map <C-j> <C-w>j
"map <C-k> <C-w>k
"map <C-l> <C-w>l

" Plugin toggles
nmap <leader>1 :NERDTreeToggle<CR>
nmap <leader>7 :TagbarToggle<CR>

" Open file as suckless sent presentation
map <leader>s :!sent<space><C-r>% 2>/dev/null &<CR><CR>

" View an image for a suckless sent presentation:
map <leader>v $F@ly$:!feh --scale-down --auto-zoom --image-bg black <c-r>" &<CR><CR>

" Open the selected text in a split (i.e. should be a file).
map <leader>o "oyaW:sp <C-R>o<CR>
xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

"For saving view folds:
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" Interpret .md files, etc. as .markdown
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Toggle DeadKeys set (for accent marks):
nm <leader><leader>d :call ToggleDeadKeys()<CR>
imap <leader><leader>d <C-\><C-O>:call ToggleDeadKeys()<CR>

" Source my IPA shorcuts:
nm <leader><leader>i :call ToggleIPA()<CR>
imap <leader><leader>i <C-\><C-O>:call ToggleIPA()<CR>

" Use urlview to choose and open a url:
:noremap <leader>u :w<Home>silent <End> !urlview<CR>
:noremap ,, :w<Home>silent <End> !urlview<CR>

" Copy selected text to system clipboard (requires gvim installed):
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P

" Goyo plugin makes text more readable when writing prose:
map <leader>f :Goyo \| set linebreak<CR>

nnoremap <F1> <NOP>
nnoremap <F2> <NOP>
nnoremap <F3> :!wc <C-R>%<CR>
nnoremap <F4> <NOP>
nnoremap <F5> <NOP>
autocmd FileType markdown,tex nnoremap <F5> :call Compile()<CR>
nnoremap <F6> <NOP>
autocmd FileType markdown,tex nnoremap <F6> :call OpenOut()<CR>
nnoremap <F7> :setlocal spell! spelllang=en_us<CR>
nnoremap <F8> :call ToggleProse()<CR>
nnoremap <F9> :vsp<space>~/Documents/LaTeX/uni.bib<CR>
" TODO fix numbering after quitting goyo
nnoremap <F10> :Goyo<CR>:set norelativenumber<CR>
nnoremap <F11> <NOP>
nnoremap <F12> <NOP>


inoremap <F1> <NOP>
inoremap <F2> <NOP>
inoremap <F3> <C-\><C-O>:!wc <C-R>%<CR>
inoremap <F4> <NOP>
inoremap <F5> <NOP>
autocmd FileType markdown,tex inoremap <F5> <C-\><C-O>:call Compile()<CR>
inoremap <F6> <NOP>
autocmd FileType markdown,tex inoremap <F6> <C-\><C-O>:call OpenOut()<CR>
inoremap <F7> <C-\><C-O>:setlocal spell! spelllang=en_us<CR>
inoremap <F8> <C-\><C-O>:call ToggleProse()<CR>
inoremap <F9> <NOP>
" TODO fix goyo so it doesn't change numbering type
inoremap <F10> <C-\><C-O>:Goyo<CR><C-\><C-O>set norelativenumber
inoremap <F11> <NOP>
inoremap <F12> <NOP>


" C-T for new tab
nnoremap <c-n><c-t> :w<CR>:tabnew<CR>
nnoremap L gt
nnoremap H gT

" NTree opens in new tabs
let NERDTreeMapOpenInTab='<ENTER>'

" Navigating with guides
inoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
map <leader><Tab> <Esc>/<++><Enter>"_c4l

" For normal mode when in terminals (in X I have caps mapped to esc, this replaces it when I don't have X)
inoremap jw <Esc>
inoremap wj <Esc>

" Open filename under cursor in new tab
nnoremap gf <c-w>gf

"#@#autocmd---------------------------
"            __                    __
" ___ ___ __/ /____  ______ _  ___/ /
"/ _ `/ // / __/ _ \/ __/  ' \/ _  /
"\_,_/\_,_/\__/\___/\__/_/_/_/\_,_/

" Makefiles need real tabs
autocmd FileType make set noexpandtab

" Setup correct compiler
autocmd FileType tex let g:compiler="pdflatex"
autocmd FileType markdown let g:compiler="pandoc"
autocmd FileType tex,markdown let g:compiler_outext="pdf"

" Filetype resolution
autocmd BufRead,BufNewFile *.tex,*.md,*.txt set wrap linebreak

" Make calcurse notes markdown compatible:
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown

" Enable Goyo by default for mutt writting
" Goyo's width will be the line limit in mutt.
autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo

" Automatically deletes all tralling whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" When shortcut files are updated, renew bash and ranger configs with new material:
autocmd BufWritePost ~/.scripts/folders,~/.scripts/configs !bash ~/.scripts/shortcuts.sh

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"#@#snippets-------------------------
"            _               __
"  ___ ___  (_)__  ___  ___ / /____
" (_-</ _ \/ / _ \/ _ \/ -_) __(_-<
"/___/_//_/_/ .__/ .__/\__/\__/___/
"          /_/  /_/

" Force Save
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Compilation
function! ExitHandler(job, stat)
	echo 'Completed '.string(a:job).' with status '.string(a:stat)
endfunction

function! OutHandler(job, message)
endfunction

function! Compile()
	:silent! w
	let src_f = expand('%')
	let out_f = expand('%:r').".".g:compiler_outext
	let job = job_start(g:compiler." ".src_f." -o ".out_f, {"exit_cb": "ExitHandler", "out_cb": "OutHandler"})
endfunction

function! OpenOut()
	:silent! w
	let src_f = expand('%')
	let out_f = expand('%:r').".".g:compiler_outext
	let job = job_start("open ".out_f, {"exit_cb": "ExitHandler", "out_cb": "OutHandler"})
endfunction


"""LATEX
" Word count:
autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
autocmd FileType tex inoremap <F3> <C-\><C-O>:w !detex \| wc -w<CR>


" Document Setup
autocmd FileType tex inoremap ,doc \documentclass{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ,up \usepackage{}<Esc>i

" Structure
autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i

" Wrap selection in \{}
autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a

" Lists
autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,li <Enter>\item<Space>

" References
autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,la \label{}<Space><++><Esc>T{i

" Font
autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i

autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,bt {\blindtext}
autocmd FileType tex inoremap ,nu $\varnothing$
autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"""PHP/HTML
autocmd FileType php,html inoremap ,b <b></b><Space><++><Esc>FbT>i
autocmd FileType php,html inoremap ,it <em></em><Space><++><Esc>FeT>i
autocmd FileType php,html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
autocmd FileType php,html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
autocmd FileType php,html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
autocmd FileType php,html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
autocmd FileType php,html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType php,html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
autocmd FileType php,html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
autocmd FileType php,html inoremap ,li <Esc>o<li></li><Esc>F>a
autocmd FileType php,html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
autocmd FileType php,html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
autocmd FileType php,html inoremap ,td <td></td><++><Esc>Fdcit
autocmd FileType php,html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
autocmd FileType php,html inoremap ,th <th></th><++><Esc>Fhcit
autocmd FileType php,html inoremap ,tab <table><Enter></table><Esc>O
autocmd FileType php,html inoremap ,gr <font color="green"></font><Esc>F>a
autocmd FileType php,html inoremap ,rd <font color="red"></font><Esc>F>a
autocmd FileType php,html inoremap ,yl <font color="yellow"></font><Esc>F>a
autocmd FileType php,html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
autocmd FileType php,html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
autocmd FileType php,html inoremap &<space> &amp;<space>


""".bib
autocmd FileType bib inoremap ,a @article{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>journal<Space>=<Space>"<++>",<Enter><tab>volume<Space>=<Space>"<++>",<Enter><tab>pages<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i
autocmd FileType bib inoremap ,b @book{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>6kA,<Esc>i
autocmd FileType bib inoremap ,c @incollection{<Enter><tab>author<Space>=<Space>"<++>",<Enter><tab>title<Space>=<Space>"<++>",<Enter><tab>booktitle<Space>=<Space>"<++>",<Enter><tab>editor<Space>=<Space>"<++>",<Enter><tab>year<Space>=<Space>"<++>",<Enter><tab>publisher<Space>=<Space>"<++>",<Enter><tab>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
autocmd Filetype rmd inoremap ,c ```<CR>```<CR><CR><esc>2kO

""".xml
autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

""".c
autocmd FileType c inoremap // /*<space><space>*/<esc>2hi
autocmd FileType c,cpp inoremap /sep /----------------------------------------------------------------------<CR>//<Space>
"autocmd FileType c nnoremap // <esc>I/*<esc>A*/<esc>0
autocmd FileType c,cpp noremap <F5> :w<CR>:call CurtineIncSw()<CR>
autocmd FileType c noremap <F6> :vertical wincmd f<CR>

autocmd FileType c,cpp nnoremap <c-f><c-f> :ClangFormat
autocmd FileType c,cpp nnoremap <c-f><c-f> <c-\><c-o>:ClangFormat<CR>

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

vnoremap K xkP`[V`]
vnoremap J xp`[V`]
vnoremap L >gv
vnoremap H <gv

map <enter><enter> yi[:e <c-r>"<CR>

