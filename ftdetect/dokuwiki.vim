autocmd BufRead,BufNewFile *.dokuwiki  set filetype=dokuwiki
autocmd BufRead,BufNewFile *.dwiki     set filetype=dokuwiki
autocmd BufRead,BufNewFile *.dw        set filetype=dokuwiki

" Surround plugin's mappings.
" Select in Visual, press S and b to make bold text.
" Now supported: bold, italic, underlined, monospace, link, headers.
" See:
" https://github.com/tpope/vim-surround
" :h surround-customizing 
autocmd FileType dokuwiki let b:surround_{char2nr('b')} = "** \r **"
autocmd FileType dokuwiki let b:surround_{char2nr('i')} = "// \r //"
autocmd FileType dokuwiki let b:surround_{char2nr('u')} = "__ \r __"
autocmd FileType dokuwiki let b:surround_{char2nr('m')} = "'' \r ''"
autocmd FileType dokuwiki let b:surround_{char2nr('l')} = "[[|\r]]"
autocmd FileType dokuwiki let b:surround_{char2nr('1')} = "====== \r ======"
autocmd FileType dokuwiki let b:surround_{char2nr('2')} = "===== \r ====="
autocmd FileType dokuwiki let b:surround_{char2nr('3')} = "==== \r ===="
autocmd FileType dokuwiki let b:surround_{char2nr('4')} = "=== \r ==="
autocmd FileType dokuwiki let b:surround_{char2nr('5')} = "== \r =="
