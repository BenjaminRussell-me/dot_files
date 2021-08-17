set number
set tabstop=2
set termwinsize=10x0

call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'w0rp/ale'
Plug 'posva/vim-vue'
Plug 'Valloric/YouCompleteMe'
Plug 'preservim/nerdtree'
Plug 'frazrepo/vim-rainbow'
call plug#end()

colorscheme nord


let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\   'scss': ['prettier', 'stylelint'],
\}

let g:ycm_language_server = [ {
    \ 'name': 'vue',
    \ 'filetypes': [ 'vue' ],
    \ } ]

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Rainbow brackets
let g:rainbow_active = 1
