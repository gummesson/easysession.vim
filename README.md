# easy-session.vim

*easy-session.vim* is a plugin for easily managing sessions in [Vim](http://www.vim.org/ "Vim").

## Installation

**Pathogen:**

    cd ~/.vim/bundle
    git clone https://github.com/gummesson/easy-session.vim.git

If you're not using [Pathogen](https://github.com/tpope/vim-pathogen "Pathogen"), place the corresponding files in their respective folders in the `~/.vim/` directory or follow the instructions from the plugin manager you're using.

Once the plugin is installed, created a folder called `sessions` in your `.vim`/`vimfiles` home directory.

## Usage

**Save a session:**

    :SaveSession

This will save the session by using the current working directory for it as a filename. If you want to give your session a different filename, see `:NewSession`.

**Create a new session:**

    :NewSession <session>.vim

*Example:* `:NewSession myproject.vim`

**Open a session:**

    :OpenSession <session>.vim

*Example:* `:OpenSession myproject.vim`

**List all sessions:**

    :ListSessions

You can then use `:source` to open a session.

## Configuration

The `vim_session_dir` variable defaults to `$HOME/.vim/sessions` on Unix and `$HOME/vimfiles/sessions` on Windows. You can change this by adding the following to your `vimrc` file:

    let g:vim_session_dir = path/to/directory

You can also change the size of the `:ListSessions` window by using this global variables:

    let g:vim_session_win_min = 1
    let g:vim_session_win_max = 5

## Limitations

Since the `:SaveSession` function uses the current working directory as it's filename you have to make sure that you're in the project's root directory when you execute it if you haven't already saved the session. The easiest way to do that is to open a file in your current window that's located in the root directory or use `:NewSession` instead.

## License
[Vim License](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license "Vim License")