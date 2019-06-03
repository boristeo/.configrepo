" _    ___
"| |  / (_)___ ___  __________
"| | / / / __ `__ \/ ___/ ___/
"| |/ / / / / / / / /  / /__
"|___/_/_/ /_/ /_/_/   \___/
"------------------------------------------------------------------------------

" Sections marked with `@@' tag

"@@options----------------------
syntax on
filetype indent plugin on
colorscheme btcolor

set ttimeoutlen=0
set modifiable

set ignorecase
set smartcase

set incsearch
set hlsearch

set belloff=all
set mouse=a

set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent

set nowrap

set number
set norelativenumber

set foldmethod=syntax
set nofoldenable
set foldlevel=1
let javaScript_fold=1
let perl_fold=1
let php_folding=1
let r_syntax_folding=1
let ruby_fold=1
let sh_fold_enabled=1
let vimsyn_folding='af'
let xml_syntax_folding=1

set laststatus=2
set statusline=%<%f\ %h%m%r%=%{SyntasticStatuslineFlag()}\ \ \ \ %-14.(%l,%c%V%)\ %-10.(%P%)\ %{CachedGitBranch()}

set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignorecase
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.o,*.d
set pumheight=10
set completeopt=longest,menuone,preview


"@@variables----------------------------
let g:netrw_winsize=20

let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:tex_flavor = "latex"

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 0
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_loc_list_height=4
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_exec = 'python3'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
let g:syntastic_c_checkers=[]
let g:syntastic_cpp_checkers=[]


let g:clang_format#detect_style_file = 1
let g:clang_format#style_options = {
      \ "AccessModifierOffset" : -4,
      \ "AllowShortIfStatementsOnASingleLine" : "true",
      \ "AlwaysBreakTemplateDeclarations" : "true",
      \ "Standard" : "C++11"}


"@@commands-----------------------------
" Close buffer but not split
command WW bp<bar>bd #

" 'Cause I apparently can't type
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

"@@mappings----------------------------
autocmd FileType markdown,tex command -buffer C call Compile()
autocmd FileType markdown,tex command -buffer O call OpenOut()
autocmd FileType markdown,tex command -buffer CO call Compile("OpenOut")

autocmd FileType c,cpp nnoremap gh :call CurtineIncSw()<CR>
autocmd FileType tex nnoremap gb :sp<space>~/Documents/LaTeX/uni.bib<CR>

nnoremap <silent> <leader>s :setlocal spell! spelllang=en_us<CR>

nnoremap gf "oyaW:sp <C-R>o<CR>
xnoremap gf "oy<esc>:sp <C-R>o<CR>
vnoremap gf "oy<esc>:sp <C-R>o<CR>

vnoremap { <ESC>`<i\{<ESC>`>a}<ESC>
vnoremap ( <ESC>`<i(<ESC>`>a)<ESC>
vnoremap ' <ESC>`<i'<ESC>`>a'<ESC>
vnoremap " <ESC>`<i"<ESC>`>a"<ESC>

imap <c-space> <c-n>
imap <c-@> <c-space>
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"@@autocmd-----------------------
autocmd BufWritePre * %s/\s\+$//e
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd FileType tex let b:compiler="pdflatex"
autocmd FileType markdown let b:compiler="pandoc"
autocmd FileType tex,markdown let b:compiler_outext="pdf"

autocmd FileType make set noexpandtab
autocmd BufRead,BufNewFile *.tex,*.md,*.txt setlocal wrap linebreak
autocmd VimLeave *.tex !texclear %

autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

"@@latex-------------------------
autocmd FileType tex inoremap ,art \documentclass{article}<CR><CR>\usepackage[margin=1in]{geometry}<CR>\usepackage{amsmath}<CR>\usepackage{amssymb}<CR>\usepackage{nth}<CR><CR>\begin{document}<CR><CR>\end{document}<UP>
autocmd FileType tex inoremap ,doc \documentclass{
autocmd FileType tex inoremap ,up \usepackage{

autocmd FileType tex inoremap ,chap \chapter{
autocmd FileType tex inoremap ,sec \section{
autocmd FileType tex inoremap ,ssec \subsection{
autocmd FileType tex inoremap ,sssec \subsubsection{

autocmd FileType tex inoremap ,beg \begin{DELRN}<CR>\end{DELRN}<Esc>2k0fR:MultipleCursorsFind<Space>DELRN<CR>c

autocmd FileType tex inoremap ,fig \begin{figure}[h]<CR>\end{figure}<Esc>kA<CR>
autocmd FileType tex inoremap ,en \begin{enumerate}<CR>\end{enumerate}<Esc>kA<CR>\item%<CR>
autocmd FileType tex inoremap ,ul \begin{itemize}<CR>\end{itemize}<Esc>kA<CR>\item%<CR>

autocmd FileType tex inoremap ,it \item%<CR>
autocmd FileType tex inoremap ,sit \subitem%<CR>
autocmd FileType tex inoremap ,ssit \subsubitem%<CR>

autocmd FileType tex inoremap ,bf \textbf{
autocmd FileType tex inoremap ,sc \textsc{
autocmd FileType tex inoremap ,tt \texttt{
autocmd FileType tex inoremap ,ct \textcite{
autocmd FileType tex inoremap ,em \emph{

"@@functions--------------------------
function! Compile(...)
  :silent! w
  let src_f = expand('%')
  let out_f = expand('%:r').".".b:compiler_outext
  let job = job_start(b:compiler." ".src_f." -o ".out_f, {"exit_cb": get(a:, 1, "ExitHandler"), "out_cb": "OutHandler"})
endfunction

function! OpenOut(...)
  let out_f = expand('%:r').".".g:compiler_outext
  let job = job_start("open ".out_f, {"exit_cb": "ExitHandler", "out_cb": "OutHandler"})
endfunction

function! OutHandler(job, message)
endfunction

function! ExitHandler(job, stat)
  echo 'Completed '.string(a:job).' with status '.string(a:stat)
endfunction

function! CachedGitBranch()
  if !exists("b:branch")
    let b:branch = len(QueryGitBranch()) == 0 ? 'local' : QueryGitBranch()
  endif
  return b:branch
endfunction

function! QueryGitBranch()
  let dir = fnamemodify(resolve(expand('%:p')),":h")
  if dir[0:0] != "/"
    return ""
  endif
  return system("cd \"".dir."\";git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
