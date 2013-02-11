# easy-session.vim

*easy-session.vim* is a plugin for easily managing sessions in [Vim](http://www.vim.org/ "Vim").

## Installation

**Pathogen:**

    git clone https://github.com/gummesson/easy-session.vim.git bundle/easy-session.vim

If you're not using [Pathogen](https://github.com/tpope/vim-pathogen "Pathogen"), place the `easy-session.vim` file in your `plugin` folder or follow the instructions from the plugin manager you're using.

Once the plugin is installed, created a folder called `sessions` in your `.vim`/`vimfiles` home directory. Alternatively, you can use another directory by adding `let g:vim_session_dir = path/to/directory` in your `vimrc` file.

The `vim_session_dir` variable defaults to `$HOME/.vim/sessions` on Unix and `$HOME/vimfiles/sessions` on Windows.

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

**See all sessions:**

    :Sessions

The `Sessions` function will execute the `Explore` command in the same directory as the sessions. Use `:source <session>.vim` to open a session from the explorer.

## Limitations

Since the `:SaveSession` function uses the current working directory as it's filename you have to make sure that you're located in your project's root directory when you execute it. The easiest way to do that is to open a file in your current window that's located in it.

## Tips and Tricks

if you're planning on using sessions on both Unix and Windows systems the offical Vim documentation recommends that you add the following to your `vimrc` file:

    set sessionoptions+=unix,slash

## License
[Vim License](http://vimdoc.sourceforge.net/htmldoc/uganda.html#license "Vim License")