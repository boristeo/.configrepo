" _    ___
"| |  / (_)___ ___  __________
"| | / / / __ `__ \/ ___/ ___/
"| |/ / / / / / / / /  / /__
"|___/_/_/ /_/ /_/_/   \___/
"------------------------------------------------------------------------------

" OPTIONS    20
" MAPPINGS  100
" AUTOCMD   200
" SNIPPETS  240


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
set ttyfast
set lazyredraw
syntax on
set autoread

" Enable override from working dir
set exrc
set secure

" Gutter numbers
set number
set norelativenumber

" Status line
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Indentation
set tabstop=4
set softtabstop=4
set autoindent
set shiftwidth=4
set smarttab
filetype indent on

" Alignment of switch and case statements
set cinoptions=:0,l1

" Folding
set foldmethod=syntax
set foldlevelstart=10

function! MyFoldText() " {{{
    let line = getline(v:foldstart)
    let eline = getline(v:foldend)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')
    let eline = substitute(eline, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
	let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '...' . eline . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" Wrapping
set nowrap
set formatoptions-=tc
set fo-=a
"set textwidth=80

" Enable autocompletion:
set wildmode=longest,list,full
set wildmenu

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
set splitbelow
set splitright
set fillchars+=vert:│

" Highlighting
hi EndOfBuffer cterm=NONE ctermbg=NONE ctermfg=black
hi MatchParen cterm=NONE ctermbg=NONE ctermfg=lightblue
hi ColorColumn ctermbg=darkgrey guibg=darkgrey
hi LineNr ctermfg=darkgrey
hi VertSplit cterm=NONE ctermbg=NONE ctermfg=white guibg=NONE
hi Folded ctermbg=darkgrey
hi Folded ctermfg=white

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_check_header = 1
let g:syntastic_c_compiler = "clang"
let g:syntastic_c_compiler_options = "-std=c99 -pedantic"
let g:syntastic_python_checkers=['flake8']
let g:tex_flavor = "latex"
let g:syntastic_cpp_compiler = "clang++"
let g:syntastic_cpp_compiler_options = "-std=c++11 -Wall -Wextra -Wpedantic"
let g:syntastic_html_tidy_exec = 'tidy'
let g:clang_library_path = "/usr/lib/llvm-6.0/lib"
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

" Open my bibliography file in split
map <F9> :vsp<space>~/Documents/LaTeX/uni.bib<CR>

" Open the selected text in a split (i.e. should be a file).
map <leader>o "oyaW:sp <C-R>o<CR>
xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Open corresponding.pdf
map <leader>p :!opout <c-r>%<CR><CR>

" Compile document
map <leader>b :!compiler <c-r>%<CR>

"For saving view folds:
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" Interpret .md files, etc. as .markdown
let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}

" Get line, word and character counts with F3:
map <F3> :!wc <C-R>%<CR>

" Spell-check set to F6:
map <F6> :setlocal spell! spelllang=en_us<CR>

" Toggle DeadKeys set (for accent marks):
so ~/.vim/luke/deadkeys.vim
nm <leader><leader>d :call ToggleDeadKeys()<CR>
imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a

" Source my IPA shorcuts:
so ~/.vim/luke/ipa.vim
nm <leader><leader>i :call ToggleIPA()<CR>
imap <leader><leader>i <esc>:call ToggleIPA()<CR>a

" Use urlview to choose and open a url:
:noremap <leader>u :w<Home>silent <End> !urlview<CR>
:noremap ,, :w<Home>silent <End> !urlview<CR>

" Copy selected text to system clipboard (requires gvim installed):
vnoremap <C-c> "*Y :let @+=@*<CR>
map <C-p> "+P

" Goyo plugin makes text more readable when writing prose:
map <F10> :Goyo<CR>
map <leader>f :Goyo \| set linebreak<CR>
inoremap <F10> <esc>:Goyo<CR>a

" Toggle Prose Mode with F8:
so ~/.vim/luke/prose.vim
nm <F8> :call ToggleProse()<CR>

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

nnoremap gf <c-w>gf

"            __                    __
" ___ ___ __/ /____  ______ _  ___/ /
"/ _ `/ // / __/ _ \/ __/  ' \/ _  /
"\_,_/\_,_/\__/\___/\__/_/_/_/\_,_/

" Makefiles need real tabs
autocmd FileType make set noexpandtab

" Filetype resolution
autocmd BufRead,BufNewFile *.tex,*.md,*.txt set wrap linebreak
autocmd BufRead,BufNewFile *.c set filetype=c
autocmd BufRead,BufNewFile *.h set filetype=cpp

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

"            _               __
"  ___ ___  (_)__  ___  ___ / /____
" (_-</ _ \/ / _ \/ _ \/ -_) __(_-<
"/___/_//_/_/ .__/ .__/\__/\__/___/
"          /_/  /_/

"""LATEX
" Word count:
autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>

" Compile document:
autocmd FileType tex inoremap <F5> <Esc>:w <Enter>:silent exec "!pdflatex<space><c-r>%<space>>/dev/null"<Enter><c-l>a
autocmd FileType tex nnoremap <F5> :w <Enter>:silent exec "!pdflatex<space><c-r>%<space>>/dev/null"<Enter><c-l>

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
"autocmd FileType c nnoremap // <esc>I/*<esc>A*/<esc>0
autocmd FileType c,cpp noremap <F5> :w<CR>:call CurtineIncSw()<CR>
autocmd FileType c noremap <F6> :vertical wincmd f<CR>

autocmd FileType c,cpp nnoremap <c-k><c-d> :w<CR>:!clang-format<space>-style=file<space>-i<space><c-r>%<CR>l<CR>l
autocmd FileType c,cpp imap <c-space> <c-x><c-u>
autocmd FileType c,cpp imap <c-@> <c-space>

vmap <expr> ++ VMATH_YankAndAnalyse()
nmap ++ vip++

vnoremap K xkP`[V`]
vnoremap J xp`[V`]
vnoremap L >gv
vnoremap H <gv

map <enter><enter> yi[:e <c-r>"<CR>

