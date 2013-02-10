" easy-session.vim
"
"   Author: Ellen Gummesson <http://ellengummesson.com/>   
"  Version: 0.1
"  License: Vim

" Don't reload the plugin if it already exists or if compatible mode is enabled
if exists("g:loaded_easy_session") || &cp
  finish
endif

" If it gets loaded, make sure that it doesn't get reloaded again
let g:loaded_easy_session = 1

" Set the 'sessions' directory
if !exists("g:vim_sessions_dir")
  if has("unix")
    " Default to ~/.vim/sessions
    let g:vim_sessions_dir = "$HOME/.vim/sessions"
  else
    " Default to C:\Users\<USERNAME>\vimfiles\sessions
    let g:vim_sessions_dir = "$HOME/vimfiles/sessions"
  endif
endif

function! SaveSession()
  " Set current working directory as root
  silent exec 'cd %:p:h'
  " Set the current working directory's name as filename
  let filename = fnamemodify(getcwd(), ":t")
  " Execute the mksession! command (so that the session can be overwritten)
  silent exec 'mksession! '.g:vim_sessions_dir.'/'.filename.'.vim'
  " Display a message that the session has been saved
  echo 'The session was saved as '.filename.'.vim'
endfunction

function! SessionsDir()
  " Set the 'sessions' directory as root
  silent exec 'cd '.g:vim_sessions_dir
  " Display instructions
  echo 'To open a session, type ":source <session.vim>"'
endfunction

" Map :call SaveSession() to :SaveSession
command! -nargs=0 SaveSession call SaveSession()
" Map :call SessionsDir() to :SessionsDir
command! -nargs=0 SessionsDir call SessionsDir()
