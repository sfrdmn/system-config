syntax on

set ts=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab
set ruler

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

map 0 ^

command Ni set noautoindent nosmartindent
command Yi set autoindent smartindent
" command Cc s #^#//

au BufRead,BufNewFile *.mustache set filetype=html
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile [Mm]akefile set noexpandtab
au BufRead,BufNewFile (*.coffee|*.cson) set noexpandtab
au BufRead,BufNewFile *.json set filetype=javascript
" au BufRead,BufNewFile *.py

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
