" easy-session.vim
"
"   Author: Ellen Gummesson <http://ellengummesson.com/>
"  Version: 0.7
"  License: Vim

" Don't reload the plugin if it already exists or if compatible mode is enabled
if exists("g:loaded_easy_session") || &cp
  finish
endif

" If it gets loaded, make sure that it doesn't get reloaded again
let g:loaded_easy_session = 1

" Set the 'sessions' directory
if !exists("g:vim_session_dir")
  if has("unix")
    " Default to ~/.vim/sessions
    let g:vim_session_dir = "$HOME/.vim/sessions"
  else
    " Default to C:/Users/<USERNAME>/vimfiles/sessions
    let g:vim_session_dir = "$HOME/vimfiles/sessions"
  endif
endif

" Set minimum window height for the 'Sessions' list
if !exists("g:vim_session_win_min")
  let g:vim_session_win_min = 1
endif

" Set maximum window height for the 'Sessions' list
if !exists("g:vim_session_win_max")
  let g:vim_session_win_max = 5
endif

" Map :SaveSession
command! -nargs=0 SaveSession call session#Save()
" Map :OpenSession
command! -nargs=1 OpenSession call session#Open(<f-args>)
" Map :NewSession
command! -nargs=1 NewSession call session#New(<f-args>)
" Map :ListSessions
command! -nargs=0 ListSessions call session#List()
