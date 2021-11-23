syntax on

set ttimeoutlen=0
set modifiable
set ignorecase
set smartcase
set incsearch
set hlsearch
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set number
set nowrap
set statusline=%<%f\ %y\ %h%m%r%=%-14.(%l,%c%V%)\ %-10.(%P%)\ %{GitBranch()}
set ruler
set background=dark
set laststatus=2
set linebreak

set foldmethod=manual

hi Comment ctermfg=10

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

function FormatFile()
  let fts = ['c', 'cpp']
  if index(fts, &filetype) != -1
    let l:lines="all"
    silent py3f ~/.scripts/clang-format.py
  else
    echo "No formatting method found"
  endif
endfunction

function FormatLines() range
  let fts = ['c', 'cpp']
  if index(fts, &filetype) != -1
    let l:lines=a:firstline.":".a:lastline
    silent py3f ~/.scripts/clang-format.py
  else
    echo "No formatting method found"
  endif
endfunction

let g:clang_format_fallback_style='llvm'
nmap <silent> <C-K> :call FormatFile()<cr>
vmap <silent> <C-K> :call FormatLines()<cr>

