let g:tex_flavor = "latex"

autocmd FileType tex let b:compiler="pdflatex"
autocmd FileType markdown let b:compiler="pandoc"
autocmd FileType tex,markdown let b:compiler_outext="pdf"

autocmd FileType markdown,tex command -buffer C call Compile()
autocmd FileType markdown,tex command -buffer O call OpenOut()
autocmd FileType markdown,tex command -buffer CO call Compile("OpenOut")

autocmd FileType tex nnoremap gb :sp<space>~/Documents/LaTeX/uni.bib<CR>
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

autocmd VimLeave *.tex !texclear %

function! Compile(...)
  :silent! w
  let src_f = expand('%')
  let out_f = expand('%:r').".".b:compiler_outext
  let job = job_start(b:compiler." ".src_f." -o ".out_f, {"exit_cb": get(a:, 1, "ExitHandler"), "out_cb": "OutHandler"})
endfunction

function! OpenOut(...)
  let out_f = expand('%:r').".".b:compiler_outext
  let job = job_start("open ".out_f, {"exit_cb": "ExitHandler", "out_cb": "OutHandler"})
endfunction

function! OutHandler(job, message)
endfunction

function! ExitHandler(job, stat)
  echo 'Completed '.string(a:job).' with status '.string(a:stat)
endfunction


