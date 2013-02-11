" easy-session.vim
"
"   Author: Ellen Gummesson <http://ellengummesson.com/>
"  Version: 0.5
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
    " Default to C:\Users\<USERNAME>\vimfiles\sessions
    let g:vim_session_dir = "$HOME/vimfiles/sessions"
  endif
endif

function! SaveSession()
  " Check if the session already exists
  if exists("v:this_session")
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

function! OpenSession(filename)
  " Source a session file in the 'sessions' directory
  silent exec 'source '.g:vim_session_dir.'/'.a:filename
endfunction


function! NewSession(filename)
  " Save a new session in the 'sessions' directory
  silent exec 'mksession '.g:vim_session_dir.'/'.a:filename
  echo 'The session was saved as '.a:filename
endfunction

function! Sessions()
  " Set the 'sessions' directory as root
  silent exec 'cd '.g:vim_session_dir
  " Open the 'sessions' directory in Netrw
  silent exec 'Explore '.g:vim_session_dir
  " Display instructions
  echo 'To open a session, type ":source <session>.vim"'
endfunction

" Map :call SaveSession() to :SaveSession
command! -nargs=0 SaveSession call SaveSession()
" Map :call OpenSession to :OpenSession
command! -nargs=1 OpenSession call OpenSession(<f-args>)
" Map :call OpenSession to :OpenSession
command! -nargs=1 NewSession call NewSession(<f-args>)
" Map :call Sessions() to :Sessions
command! -nargs=0 Sessions call Sessions()
