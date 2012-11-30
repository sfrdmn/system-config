syntax on

set ts=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

map 0 ^
map <C-Right> gt
map <C-Left> gT

command Ni set noautoindent nosmartindent
command Yi set autoindent smartindent
" command Cc s #^#//

au BufRead,BufNewFile *.mustache set filetype=html
" au BufRead,BufNewFile *.py

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
