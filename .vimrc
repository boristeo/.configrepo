" _    ___
"| |  / (_)___ ___  __________
"| | / / / __ `__ \/ ___/ ___/
"| |/ / / / / / / / /  / /__
"|___/_/_/ /_/ /_/_/   \___/
"------------------------------------------------------------------------------

syntax on
filetype indent plugin on

set background=light
set ttimeoutlen=0
set modifiable
set ignorecase
set smartcase
set incsearch
set hlsearch
set belloff=all
set mouse=a
set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set nowrap
set number
set norelativenumber
set path+=**
set wildmode=longest,list,full
set wildmenu
set wildignorecase
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.ico
set wildignore+=*.o,*.d
set pumheight=10
set completeopt=longest,menuone,preview
set laststatus=2
set statusline=%<%f\ %y\ %h%m%r%=%-14.(%l,%c%V%)\ %-10.(%P%)\ %{CachedGitBranch()}

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

hi ColorColumn                ctermbg=8
hi Pmenu                      ctermbg=0
hi Search                     ctermbg=3
hi Folded                     ctermbg=NONE
hi EndOfBuffer                ctermbg=NONE
hi FoldColumn                 ctermbg=NONE
hi SignColumn                 ctermbg=NONE

hi MatchParen                 ctermfg=12
hi Search                     ctermfg=0
hi Comment                    ctermfg=10
hi Pmenu                      ctermfg=7
hi Folded                     ctermfg=7
hi VertSplit                  ctermfg=8
hi StatusLine                 ctermfg=8
hi StatusLineNC               ctermfg=8
hi StatusLineTerm             ctermfg=8
hi StatusLineTermNC           ctermfg=8
hi LineNr                     ctermfg=8
hi EndOfBuffer                ctermfg=0

autocmd BufWritePre * %s/\s\+$//e
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

autocmd BufRead,BufNewFile *.tex,*.md,*.txt,*.html setlocal wrap linebreak

autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif

