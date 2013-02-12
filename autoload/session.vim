" easy-session.vim
"
"   Author: Ellen Gummesson <http://ellengummesson.com/>
"  Version: 0.7
"  License: Vim

" ~ Save
function! session#Save()
  " Check if the session already exists
  if strlen(v:this_session)
    let filename = fnamemodify(v:this_session, ":t")
  else
    " Set current working directory as root
    silent exec 'cd %:p:h'
    " Set the current working directory's name as filename
    let current_dir = fnamemodify(getcwd(), ":t")
    let filename = current_dir.'.vim'
  endif
  " Execute the mksession! command (so that the session can be overwritten)
  silent exec 'mksession! '.g:vim_session_dir.'/'.filename
  " Display a message that the session has been saved
  echo 'The session was saved as '.filename
endfunction

" ~ Open
function! session#Open(filename)
  " Source a session file in the 'sessions' directory
  silent exec 'source '.g:vim_session_dir.'/'.a:filename
endfunction

" ~ New
function! session#New(filename)
  " Save a new session in the 'sessions' directory
  silent exec 'mksession '.g:vim_session_dir.'/'.a:filename
  echo 'The session was saved as '.a:filename
endfunction

" ~ List
function! session#List()
  " Open and resizes the 'Sessions' window
  call s:vim_session_window()
  " Make the 'sessions' the current directory
  silent exec 'lcd '.g:vim_session_dir
  " Set the 'Sessions' buffer settings
  call s:vim_session_buffer()
  " Get a list of all the sessions
  call s:vim_session_list()
  " Name the temporary buffer file '[EASY SESSION]'
  silent exec 'file [EASY SESSION]'
  " Set various local settings
  call s:vim_session_misc()
endfunction

function! s:vim_session_window()
  " Open a new window and resize it to the maximum window size
  silent exec 'wincmd n'
  silent exec 'resize '.g:vim_session_win_max
  " Set minimum window size
  silent exec 'setlocal winminheight='.g:vim_session_win_min
endfunction

function! s:vim_session_buffer()
  " Enable the 'Sessions' buffer to be easily removed
  setlocal noswapfile
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal nobuflisted
endfunction

function! s:vim_session_list()
  " Get all the files in the 'sessions' directory
  silent exec '0r !ls'
  " Remove trailing whitespace in the list
  silent exec 'g/^$/d'
  " Add some color
  syntax match Keyword /^[a-zA-Z0-9].*/
endfunction

function s:vim_session_misc()
  " Check if colorcolumn is set
  if exists("&colorcolumn")
    setlocal colorcolumn=0
  endif
  " Remove the cursorline
  setlocal nocursorline
endfunction
