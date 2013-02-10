# easy-session.vim

*easy-session.vim* is a plugin for easily managing sessions in [Vim](http://www.vim.org/ "Vim").

## Installation

**Pathogen:**

    git clone https://github.com/gummesson/easy-session.vim.git bundle/easy-session.vim

If you're not using [Pathogen](https://github.com/tpope/vim-pathogen "Pathogen"), place the `easy-session.vim` file in your `plugin` folder or follow the instructions from the plugin manager you're using.

Once the plugin is installed, created a folder called `sessions` in your `.vim`/`vimfiles` home directory. Alternatively, you can use another directory by adding `let g:vim_sessions_dir = path/to/directory` in your `vimrc` file.

The `vim_sessions_dir` variable defaults to `$HOME/.vim/sessions` on Unix and `$HOME/vimfiles/sessions` on Windows.

## Usage

**Save a session:**

    :SaveSession

**Open a session:**

    :Sessions
    :source <session.vim>

The `Sessions` function will execute the `Explore` command in the same directory as the sessions. Add `let g:vim_sessions_explore = 0` to your `vimrc` to turn it off.

## Tips and Tricks

if you're planning on using sessions on both Unix and Windows systems the offical Vim documentation recommends that you add the following to your `vimrc` file:

    set sessionoptions+=unix,slash

## License
[Vim License](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license "Vim License")