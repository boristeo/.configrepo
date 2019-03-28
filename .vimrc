" _    ___
"| |  / (_)___ ___  __________
"| | / / / __ `__ \/ ___/ ___/
"| |/ / / / / / / / /  / /__
"|___/_/_/ /_/ /_/_/   \___/
"------------------------------------------------------------------------------

" Sections marked with `#@#' tag

"#@#options----------------------

" Some basics:
set nocompatible
set term=xterm-256color
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set autochdir
set hidden
set exrc
set secure
set modifiable
set autoread
set autowrite

set ignorecase
set smartcase
set incsearch

set belloff=all

set backspace=indent,eol,start

set nowrap

filetype plugin indent on
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4

set number
set norelativenumber
set signcolumn=yes

set foldmethod=syntax
set foldlevelstart=10
set foldtext=MyFoldText()

set laststatus=2
set statusline=%{StatuslineGit()}

" Completions
set wildmode=longest,list,full
set wildmenu
set wildignorecase
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.o,*.d
set pumheight=10
set completeopt=longest,menuone,preview
imap <c-space> <c-n>
imap <c-@> <c-space>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

set splitbelow
set splitright
set fillchars+=stl:\ "╨
set fillchars+=stlnc:─"┴
set fillchars+=vert:│
set fillchars+=fold:\ "
set fillchars+=diff:\ "


"#@#highlighting--------------------------
colorscheme default
set background=light


hi MatchParen ctermbg=NONE
hi Search ctermbg=3
hi Comment ctermbg=NONE
hi ColorColumn ctermbg=8
hi Pmenu ctermbg=0
hi VertSplit ctermbg=NONE
hi Folded ctermbg=NONE
hi StatusLine ctermbg=NONE
hi StatusLineNC ctermbg=NONE
hi StatusLineTerm ctermbg=NONE
hi StatusLineTermNC ctermbg=NONE
hi TabLineFill ctermbg=NONE
hi TabLine ctermbg=NONE
hi TabLineSel ctermbg=NONE
hi Title ctermbg=NONE
hi EndOfBuffer ctermbg=NONE
hi LineNr ctermbg=NONE
hi GitGutterAdd ctermbg=NONE
hi GitGutterChange ctermbg=NONE
hi GitGutterDelete ctermbg=NONE
hi GitGutterChangeDelete ctermbg=NONE
hi DiffAdd ctermbg=NONE
hi DiffChange ctermbg=8
hi DiffChange ctermfg=NONE
hi DiffText ctermfg=NONE
hi DiffDelete ctermfg=NONE
hi FoldColumn ctermfg=NONE

hi MatchParen ctermfg=12
hi Search ctermfg=0
hi Comment ctermfg=10
hi ColorColumn ctermfg=NONE
hi Pmenu ctermfg=7
hi VertSplit ctermfg=8
hi Folded ctermfg=7
hi StatusLine ctermfg=8
hi StatusLineNC ctermfg=8
hi StatusLineTerm ctermfg=8
hi StatusLineTermNC ctermfg=8
hi TabLineFill ctermfg=8
hi TabLine ctermfg=7
hi TabLineSel ctermfg=7
hi Title ctermfg=7
hi EndOfBuffer ctermfg=0
hi LineNr ctermfg=8
hi GitGutterAdd ctermfg=8
hi GitGutterChange ctermfg=8
hi GitGutterDelete ctermfg=8
hi GitGutterChangeDelete ctermfg=8
hi DiffAdd ctermfg=8
hi DiffText ctermbg=NONE
hi DiffDelete ctermbg=NONE
hi FoldColumn ctermbg=NONE

hi MatchParen cterm=NONE
hi Search cterm=NONE
hi Comment cterm=NONE
hi ColorColumn cterm=NONE
hi Pmenu cterm=NONE
hi VertSplit cterm=NONE
hi Folded cterm=NONE
hi StatusLine cterm=NONE
hi StatusLineNC cterm=NONE
hi StatusLineTerm cterm=NONE
hi StatusLineTermNC cterm=NONE
hi TabLineFill cterm=NONE
hi TabLine cterm=NONE
hi TabLineSel cterm=NONE
hi Title cterm=NONE
hi EndOfBuffer cterm=NONE
hi LineNr cterm=NONE
hi GitGutterAdd cterm=NONE
hi GitGutterChange cterm=NONE
hi GitGutterDelete cterm=NONE
hi GitGutterChangeDelete cterm=NONE
hi DiffAdd cterm=NONE
hi DiffText cterm=NONE
hi DiffDelete cterm=NONE
hi FoldColumn cterm=NONE

"#@#variables----------------------------

" Dir tree width
let g:netrw_winsize=20

let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:tex_flavor = "latex"

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_loc_list_height=4
let g:syntastic_python_checkers=['flake8']
let g:syntastic_c_checkers=[]
let g:syntastic_cpp_checkers=[]

packadd termdebug
let g:termdebug_wide = 176
let termdebugger = "gdb"

let g:clang_format#detect_style_file = 1
let g:clang_format#style_options = {
			\ "AccessModifierOffset" : -4,
			\ "AllowShortIfStatementsOnASingleLine" : "true",
			\ "AlwaysBreakTemplateDeclarations" : "true",
			\ "Standard" : "C++11"}


"#@#mappings-----------------------------

" Close buffer but not split
command WW bp<bar>bd #

" Cause I apparently can't type
command Q q
command Qa qa
command W w
command Wq wq
command Wqa wqa

" Force Save
command WS execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Plugin toggles
command LEX Lex
command TT TagbarToggle

" B for build; O for open
autocmd FileType markdown,tex command B call Compile()
autocmd FileType markdown,tex command O call OpenOut()

" gh -> go header
autocmd FileType c,cpp nnoremap gh :call CurtineIncSw()<CR>

" gb -> go bib
autocmd FileType tex nnoremap gb :vsp<space>~/Documents/LaTeX/uni.bib<CR>

" And this
inoremap <C-w> <C-\><C-o><C-w>

" Remove all spaces but go into insert mode
nnoremap J Jcl

" For moving lines (^] is a special character; use <M-k> and <M-j> if it works)
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" Scroll n lines at a time
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Open the selected text in a split (i.e. should be a file).
map <leader>o "oyaW:sp <C-R>o<CR>
xnoremap <leader>o "oy<esc>:sp <C-R>o<CR>
vnoremap <leader>o "oy<esc>:sp <C-R>o<CR>

" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>

" Deep toggle folds
nnoremap za zA

" Toggle spelling
nnoremap <silent> <leader>s :setlocal spell! spelllang=en_us<CR>

" Use urlview to choose and open a url:
noremap <C-w><C-w><C-w> :w<Home>silent <End> !urlview<CR>
noremap ,, :w<Home>silent <End> !urlview<CR>

" Copy selected text to system clipboard
vnoremap <C-c> "*Y :let @+=@*<CR>


" Annoying without this
nnoremap <BS> <NOP>

nnoremap <F1> <NOP>
nnoremap <F2> <NOP>
nnoremap <F3> <NOP>
nnoremap <F4> <NOP>
nnoremap <F5> <NOP>
nnoremap <F6> <NOP>
nnoremap <F7> <NOP>
nnoremap <F8> <NOP>
nnoremap <F9> <NOP>
nnoremap <F10> <NOP>
nnoremap <F11> <NOP>
nnoremap <F12> <NOP>

inoremap <F1> <NOP>
inoremap <F2> <NOP>
inoremap <F3> <NOP>
inoremap <F4> <NOP>
inoremap <F5> <NOP>
inoremap <F6> <NOP>
inoremap <F7> <NOP>
inoremap <F8> <NOP>
inoremap <F9> <NOP>
inoremap <F10> <NOP>
inoremap <F11> <NOP>
inoremap <F12> <NOP>


" close if final buffer is netrw or the quickfix
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif


" Navigating with guides
vnoremap <leader><Tab> <Esc>/<++><Enter>"_c4l
map <leader><Tab> <Esc>/<++><Enter>"_c4l

" Open filename under cursor in new tab
nnoremap gf :vertical wincmd f<CR>


"#@#autocmd---------------------------

""" All files
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

""" Select files
autocmd FileType tex let g:compiler="pdflatex"
autocmd FileType markdown let g:compiler="pandoc"
autocmd FileType tex,markdown let g:compiler_outext="pdf"

autocmd FileType make set noexpandtab
autocmd BufRead,BufNewFile *.tex,*.md,*.txt setlocal wrap linebreak
autocmd VimLeave *.tex !texclear %
autocmd FileType c,cpp ClangFormatAutoEnable


"#@#snippets-------------------------

""" LATEX
autocmd FileType tex inoremap ,doc \documentclass{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ,up \usepackage{}<Esc>i

autocmd FileType tex inoremap ,art \documentclass{article}<Enter><Enter>\usepackage[margin=1in]{geometry}<CR>\usepackage{nth}<CR><CR>\begin{document}<CR><CR>\end{document}<UP>

autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i

autocmd FileType tex vnoremap { <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a

autocmd FileType tex inoremap ,en \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>

autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i


""" C/C++
autocmd FileType c inoremap // /*<space><space>*/<esc>2hi
"autocmd FileType c nnoremap // <esc>I/*<esc>A*/<esc>0
autocmd FileType c,cpp inoremap ***<CR> ******************************************************************************************<CR>
autocmd FileType c,cpp inoremap ***/ <C-\><C-o>dT*****************************************************************************************/<CR>



"#@#functions

" Compilation
function! ExitHandler(job, stat)
	echo 'Completed '.string(a:job).' with status '.string(a:stat)
endfunction

function! ExitHandlerReload(job, stat)
	echo 'Completed '.string(a:job).' with status '.string(a:stat)
	edit!
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

" Statusline
function GitBranch()
	let dir = fnamemodify(resolve(expand('%:p')),":h")
	if dir[0:0] != "/"
		return ""
	endif
	return system("cd ".dir.";git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
	if !exists("b:branch")
		let b:branch = GitBranch()
		if len(b:branch) == 0
			let b:branch = 'local'
		endif
	endif
	let fillcharedges = 3
	let fillcharcount = winwidth(0) - len(b:branch) - len(expand('%f')) - 8 - 2 * fillcharedges
	let fillchar = '─'
	return repeat(fillchar, fillcharedges) . '< ' . b:branch . ' >' . repeat(fillchar,fillcharcount) . '< ' . expand('%f') . ' >' . repeat(fillchar, fillcharedges)
endfunction


" Folding
function! MyFoldText()
	let line = getline(v:foldstart)
	let eline = getline(v:foldend)

	let nucolwidth = &fdc + &number * &numberwidth

	let linenrwidth = 0
	let linect = line('$')
	while linect > 0
		let linect = linect / 10
		let linenrwidth += 1
	endwhile

	let windowwidth = winwidth(0) - nucolwidth - linenrwidth - 3
	let foldedlinecount = v:foldend - v:foldstart

	let onetab = strpart('          ', 0, &tabstop)
	let line = substitute(line, '\t', onetab, 'g')
	let eline = substitute(eline, '\t', '', 'g')
	let eline = substitute(eline, '^\s\{}', '', 'g')

	"let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
	let fillcharcount = windowwidth - len(line) - len(eline) - len(foldedlinecount)
	return line . '...' . eline . repeat(" ",fillcharcount) . foldedlinecount . ' '
endfunction

" Automatically deletes all tralling whitespace on save.
function! <SID>StripTrailingWhitespaces()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun
