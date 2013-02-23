" easysession.vim
"
"   Author: Ellen Gummesson
"  Version: 0.5
"  License: Vim

" ~ Save
function! easysession#Save()
  if strlen(v:this_session)
    let filename = fnamemodify(v:this_session, ":t")
  else
    silent exec 'cd %:p:h'
    let current_dir = fnamemodify(getcwd(), ":t")
    let filename = current_dir.'.vim'
  endif
  silent exec 'mksession! '.g:vim_sessions_dir.'/'.filename
  echo 'The session was saved as '.filename
endfunction

" ~ Open
function! easysession#Open(filename)
  silent exec 'source '.g:vim_sessions_dir.'/'.a:filename
endfunction

" ~ New
function! easysession#New(filename)
  silent exec 'mksession '.g:vim_sessions_dir.'/'.a:filename
  echo 'The session was saved as '.a:filename
endfunction

" ~ List
function! easysession#List()
  call s:vim_sessions_window()
    silent exec 'lcd '.g:vim_sessions_dir
  call s:vim_sessions_buffer()
  call s:vim_sessions_list()
    silent exec 'file [Easy Session]'
  call s:vim_sessions_misc()
    nnoremap <buffer> <silent> <Esc> :q<cr>
    nnoremap <buffer> <silent> <Return> :call <SID>vim_sessions_open(getline("."))<cr>
endfunction

" ~ List functions
function! s:vim_sessions_window()
  silent exec 'wincmd n | resize '.g:vim_sessions_win_max
  silent exec 'setlocal winminheight='.g:vim_sessions_win_min
endfunction

function! s:vim_sessions_buffer()
  setlocal noswapfile
  setlocal buftype=nofile bufhidden=delete nobuflisted
endfunction

function! s:vim_sessions_list()
  if has("unix")
    silent exec '0read !ls'
  else
    silent exec '0read !dir /B'
  endif
  silent exec 'g/^$/d'
endfunction

function s:vim_sessions_misc()
  syntax match Keyword /\v^.*(\.vim)$/
  if exists("&colorcolumn")
    setlocal colorcolumn=0
  endif
  setlocal nocursorline
endfunction

function! s:vim_sessions_open(filename)
  silent! exec 'source '.a:filename
endfunction
