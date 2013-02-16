" easysession.vim
"
"   Author: Ellen Gummesson <http://ellengummesson.com/>
"  Version: 0.5
"  License: Vim

if exists("g:loaded_easy_session") || &cp
  finish
endif

let g:loaded_easy_session = 1

" Set the 'Sessions' directory
if !exists("g:vim_sessions_dir")
  if has("unix")
    let g:vim_sessions_dir = "$HOME/.vim/sessions"
  else
    let g:vim_sessions_dir = "$HOME/vimfiles/sessions"
  endif
endif

" Set minimum window height for the 'Sessions' list
if !exists("g:vim_sessions_win_min")
  let g:vim_sessions_win_min = 1
endif

" Set maximum window height for the 'Sessions' list
if !exists("g:vim_sessions_win_max")
  let g:vim_sessions_win_max = 5
endif

" Command-line mappings
command! -nargs=0 SaveSession call easysession#Save()
command! -nargs=1 OpenSession call easysession#Open(<f-args>)
command! -nargs=1 NewSession call easysession#New(<f-args>)
command! -nargs=0 ListSessions call easysession#List()
