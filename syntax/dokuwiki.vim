" Vim syntax file
" Language: dokuwiki
" Last Change: 2011-10-03
" Maintainer: Florian Preinstorfer <nblock@archlinux.org>
" URL: https://github.com/nblock/vim-dokuwiki
" License: same as vim itself
" Reference: http://www.dokuwiki.org/syntax
" Todo: better Tables support (::: missing); Quoting; combinations of bold, italic, underlined
" Credits:
"   Bill Powell <bill@billpowellisalive.com> -- original dokuwiki syntax file
"   Sören König <soeren-koenig@freenet.de> -- zim syntax file

" initial checks. See `:help 44.12`
if exists("b:current_syntax")
 finish
endif

if version < 600
 syntax clear
elseif exists("b:current_syntax")
 finish
endif

""" Patterns
" Keywords
syn match dokuwikiLinebreak /\(\\\\$\)\|\(\\\\ \)/

" No wiki regions
syn region dokuwikiNowiki start=+%%+ end=+%%+
syn region dokuwikiNowiki start=+<nowiki>+ end=+</nowiki>+

" Heading
syn match dokuwikiHeading1 /^\s*=\{6}[^=]\+.*[^=]\+=\{6}\s*$/
syn match dokuwikiHeading2 /^\s*=\{5}[^=]\+.*[^=]\+=\{5}\s*$/
syn match dokuwikiHeading3 /^\s*=\{4}[^=]\+.*[^=]\+=\{4}\s*$/
syn match dokuwikiHeading4 /^\s*=\{3}[^=]\+.*[^=]\+=\{3}\s*$/
syn match dokuwikiHeading5 /^\s*=\{2}[^=]\+.*[^=]\+=\{2}\s*$/

" Highlight
syn region dokuwikiBold start="\*\*" end="\*\*"
syn region dokuwikiItalic start="\/\/" end="\/\/"
syn region dokuwikiUnderlined start="__" end="__"
syn region dokuwikiMonospaced start="''" end="''"
syn region dokuwikiStrikethrough start="<del>" end="</del>"
syn region dokuwikiSubscript start="<sub>" end="</sub>"
syn region dokuwikiSuperscript start="<sup>" end="</sup>"

" Smileys: http://github.com/splitbrain/dokuwiki/blob/master/conf/smileys.conf
syn match dokuwikiSmiley "\(8-)\)\|\(8-O\)\|\(8-o\)\|\(:-(\)\|\(:-)\)\|\(=)\)\|\(:-\/\)\|\(:-\\\)" contains=@NoSpell
syn match dokuwikiSmiley "\(:-\\\)\|\(:-?\)\|\(:-D\)\|\(:-P\)\|\(:-o\)\|\(:-O\)\|\(:-x\)" contains=@NoSpell
syn match dokuwikiSmiley "\(:-X\)\|\(:-|\)\|\(;-)\)\|\(m(\)\|\(\^_\^\)\|\(:?:\)\|\(:!:\)\|LOL\|FIXME\|DELETEME" contains=@NoSpell

" Entities: http://github.com/splitbrain/dokuwiki/blob/master/conf/entities.conf
syn match dokuwikiEntities "\(<->\)\|\(->\)\|\(<-\)\|\(<\=>\)\|\(640x480\)" contains=@NoSpell
syn match dokuwikiEntities "\(=>\)\|\(<=\)\|\(>>\)\|\(<<\)\|\(---\)\|\(--\)" contains=@NoSpell
syn match dokuwikiEntities "\((c)\)\|\((tm)\)\|\((r)\)\|\(\.\.\.\)" contains=@NoSpell

"Cluster most common items
syn cluster dokuwikiTextItems contains=dokuwikiBold,dokuwikiItalic,dokuwikiUnderlined,dokuwikiMonospaced,dokuwikiStrikethrough
syn cluster dokuwikiTextItems contains=dokuwikiSubscript,dokuwikiSuperscript,dokuwikiSmiley,dokuwikiEntities

" Links: http://github.com/splitbrain/dokuwiki/blob/master/conf/scheme.conf
syn match dokuwikiLinkCaption "|\zs[^|\]{}]\+" contained
syn region dokuwikiExternalLink start=+\(http\|https\|telnet\|gopher\|wais\|ftp\|ed2k\|irc\|ldap\):\/\/\|www\.+ end=+ +me=e-1 contains=dokuwikiLinkCaption
syn region dokuwikiInternalLink start="\[\[" end="\]\]" contains=dokuwikiLinkCaption

" Lists
syn match dokuwikiList "^\(\s\s\)*\(\*\|-\)\s" contains=@dokuwikiTextItems

" Images and other files
syn region dokuwikiImageFiles start="{{" end="}}" contains=@NoSpell,dokuwikiLinkCaption

"Control Macros
syn region dokuwikiControlMacros start="\~\~" end="\~\~" contains=@NoSpell

"Code Blocks
syn region dokuwikiCodeBlocks start="<code>" end="</code>"
syn region dokuwikiCodeBlocks start="<file>" end="</file>"
syn region dokuwikiCodeBlocks start="^\s\s[^\s\*-]\{3,}" end="$"

"Tables
syn match dokuwikiTable /\(|\)\|\(\^\)/ contains=@dokuwikiTextItems

" Embedded html/php
syn region dokuwikiEmbedded start="<html>" end="</html>"
syn region dokuwikiEmbedded start="<php>" end="</php>"

"Comment: requires http://www.dokuwiki.org/plugin:comment
syn region dokuwikiComment start="/\*" end="\*/"

""" Highlighting
hi link dokuwikiLinebreak Keyword

hi link dokuwikiNowiki Ignore

hi link dokuwikiHeading1 Title
hi link dokuwikiHeading2 Title
hi link dokuwikiHeading3 Title
hi link dokuwikiHeading4 Title
hi link dokuwikiHeading5 Title

hi def dokuwikiBold term=bold cterm=bold gui=bold
hi def dokuwikiItalic term=italic cterm=italic gui=italic
hi link dokuwikiUnderlined Underlined
hi link dokuwikiMonospaced Type
hi def link dokuwikiStrikethrough Comment
hi def link dokuwikiSubscript Special
hi def link dokuwikiSuperscript Special

hi link dokuwikiExternalLink Underlined
hi link dokuwikiInternalLink Underlined
hi link dokuwikiLinkCaption Label

hi link dokuwikiSmiley Todo
hi link dokuwikiEntities Keyword

hi link dokuwikiList Identifier

hi link dokuwikiImageFiles Underlined

hi link dokuwikiControlMacros Constant

hi link dokuwikiCodeBlocks String

hi link dokuwikiTable Label

hi link dokuwikiEmbedded String

hi link dokuwikiComment Comment

"set name
let b:current_syntax = "dokuwiki"
