syntax on

set ts=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab

:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

au BufRead,BufNewFile *.mustache set filetype=html

:map <C-Right> gt
:map <C-Left> gT

command Ni set noautoindent nosmartindent
command Yi set autoindent smartindent
