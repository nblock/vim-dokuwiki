# vim-dokuwiki - a VIM syntax file for DokuWiki

## Install

### Vim-Plug
```
Plug 'nblock/vim-dokuwiki'
```

### Manual
1) copy [syntax/dokuwiki.vim](syntax/dokuwiki.vim) into your `~/.vim/syntax/`
2) enable by issuing `:set ft=dokuwiki`

## Configuration

### Manually enable syntax highlighting for certain filename patterns
Add the following snippet to your vim configuration, in case you
want to enable Dokuwiki syntax highlighting for all `*.txt` files:

    autocmd BufRead,BufNewFile *.txt       set filetype=dokuwiki

### Comment highlighting
If you want to enable the comment plugin highlighting, 
assign any value to the `dokuwiki_comment` variable:

    :let dokuwiki_comment=1

To disable it use `:unlet`. Example:

    :unlet dokuwiki_comment

### Code block syntax highlighting
Syntax highlighting in code blocks can be enabled by adding the appropriate 
languages to the `dokuwiki_fenced_languages` variable in your vimrc.
Example:

    :let g:dokuwiki_fenced_languages = ['c', 'python', 'html']
