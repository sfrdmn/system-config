syntax on

set ts=2
set shiftwidth=2
set autoindent
set smartindent
set expandtab
set ruler

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

command Ni set noautoindent nosmartindent
command Yi set autoindent smartindent

au BufRead,BufNewFile *.mustache set filetype=html
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile [Mm]akefile set noexpandtab
au BufRead,BufNewFile (*.coffee|*.cson) set noexpandtab
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile *.php set ts=4
au BufRead,BufNewFile *.php set shiftwidth=4

function! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

function! Comment()
  let ext = tolower(expand('%:e'))
  if ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^/\#/
  elseif ext == 'js' || ext == 'php' || ext == 'c'
    silent s:^:\/\/:g
  elseif ext == 'vim'
    silent s:^:\":g
  endif
endfunction

function! Uncomment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^\#//
  elseif ext == 'js'
    silent s:^\/\/::g
  elseif ext == 'vim'
    silent s:^\"::g
  endif
endfunction

map 0 ^
map <C-a> :call Comment()<CR>
map <C-b> :call Uncomment()<CR>
map <C-k> :call DeleteTrailingWS()<CR>
