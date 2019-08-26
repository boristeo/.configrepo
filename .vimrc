let USE_MIN=0
syntax on
filetype indent plugin on

set ttimeoutlen=0
set modifiable
set ignorecase
set smartcase
set incsearch
set hlsearch
set mouse=a
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set number
set nowrap
set statusline=%<%f\ %y\ %h%m%r%=%-14.(%l,%c%V%)\ %-10.(%P%)\ %{GitBranch()}

if USE_MIN
  set ruler
  set background=dark
  hi Comment ctermfg=10
else
  set background=light
  set laststatus=2
  hi ColorColumn ctermbg=8
  hi Pmenu ctermfg=7 ctermbg=0
  hi Search ctermfg=0 ctermbg=3
  hi Folded ctermfg=7 ctermbg=NONE
  hi EndOfBuffer ctermfg=0 ctermbg=NONE
  hi FoldColumn ctermbg=NONE
  hi SignColumn ctermbg=NONE
  hi MatchParen ctermfg=12
  hi Comment ctermfg=10
  hi LineNr ctermfg=8
  hi VertSplit ctermfg=8
  hi StatusLine ctermfg=8
  hi StatusLineNC ctermfg=8
  hi StatusLineTerm ctermfg=8
  hi StatusLineTermNC ctermfg=8
endif

autocmd BufRead,BufNewFile *.tex,*.md,*.txt,*.html setlocal wrap linebreak
autocmd BufWritePre * %s/\s\+$//e
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif


function! GitBranch()
  if !exists("b:branch")
    let b:branch=""
    let l:dir=fnamemodify(resolve(expand('%:p')),":h")
    if dir[0:0] == "/"
      let b:branch = system("cd \"".l:dir."\";git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    endif
  endif
  return len(b:branch) > 0 ? b:branch : "local"
endfunction
