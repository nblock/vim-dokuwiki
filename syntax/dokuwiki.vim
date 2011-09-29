" Vim syntax file
" Language: dokuwiki
" Last Change: 2011-09-29
" Maintainer: Florian Preinstorfer <nblock@archlinux.org>
" URL: https://github.com/nblock/vim-dokuwiki
" License: same as vim itself
" Reference: http://www.dokuwiki.org/syntax
" Todo: Tables, Code Blocks; combinations of bold, italic, underlined
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
syntax match dokuwikiH1 /^\s*=\{6}[^=]\+.*[^=]\+=\{6}\s*$/
syntax match dokuwikiH2 /^\s*=\{5}[^=]\+.*[^=]\+=\{5}\s*$/
syntax match dokuwikiH3 /^\s*=\{4}[^=]\+.*[^=]\+=\{4}\s*$/
syntax match dokuwikiH4 /^\s*=\{3}[^=]\+.*[^=]\+=\{3}\s*$/
syntax match dokuwikiH5 /^\s*=\{2}[^=]\+.*[^=]\+=\{2}\s*$/

" Highlight
syn region dokuwikiBold start="\*\*" end="\*\*" skip="<nowiki>.*</nowiki>"
syn region dokuwikiItalic start="\/\/" end="\/\/" skip="<nowiki>.*</nowiki>"
syn region dokuwikiUnderlined start="__" end="__" skip="<nowiki>.*</nowiki>"
syn region dokuwikiMonospaced start="''" end="''" skip="<nowiki>.*</nowiki>"
syn region dokuwikiStrikethrough start="<del>" end="</del>" skip="<nowiki>.*</nowiki>"
syn region dokuwikiSubscript start="<sub>" end="</sub>" skip="<nowiki>.*</nowiki>"
syn region dokuwikiSuperscript start="<sup>" end="</sup>" skip="<nowiki>.*</nowiki>"

" Links: http://github.com/splitbrain/dokuwiki/blob/master/conf/scheme.conf
syn region dokuwikiExternalLink start=+\(http\|https\|telnet\|gopher\|wais\|ftp\|ed2k\|irc\|ldap\):\/\/\|www\.+ end=+ +me=e-1
syn region dokuwikiInternalLink start="\[\[" end="\]\]" skip="<nowiki>.*</nowiki>"

" Smileys: http://github.com/splitbrain/dokuwiki/blob/master/conf/smileys.conf
syn match dokuwikiSmiley "\(8-)\)\|\(8-O\)\|\(8-o\)\|\(:-(\)\|\(:-)\)\|\(=)\)\|\(:-\/\)\|\(:-\\\)" contains=@NoSpell
syn match dokuwikiSmiley "\(:-\\\)\|\(:-?\)\|\(:-D\)\|\(:-P\)\|\(:-o\)\|\(:-O\)\|\(:-x\)" contains=@NoSpell
syn match dokuwikiSmiley "\(:-X\)\|\(:-|\)\|\(;-)\)\|\(m(\)\|\(\^_\^\)\|\(:?:\)\|\(:!:\)\|LOL\|FIXME\|DELETEME" contains=@NoSpell

" Entities: http://github.com/splitbrain/dokuwiki/blob/master/conf/entities.conf
syn match dokuwikiEntities "\(<->\)\|\(->\)\|\(<-\)\|\(<\=>\)\|\(640x480\)" contains=@NoSpell
syn match dokuwikiEntities "\(=>\)\|\(<=\)\|\(>>\)\|\(<<\)\|\(---\)\|\(--\)" contains=@NoSpell
syn match dokuwikiEntities "\((c)\)\|\((tm)\)\|\((r)\)\|\(\.\.\.\)" contains=@NoSpell

" Lists
syntax match dokuwikiList "^\(\s\s\)*\(\*\|-\)\s"

" Images and other files
syn region dokuwikiImageFiles start="{{" end="}}" skip="<nowiki>.*</nowiki>" contains=@NoSpell

"Control Macros
syn region dokuwikiControlMacros start="\~\~" end="\~\~" skip="<nowiki>.*</nowiki>" contains=@NoSpell


""" Highlighting
hi link dokuwikiLinebreak Keyword

hi link dokuwikiNowiki Ignore

hi link dokuwikiH1 Title
hi link dokuwikiH2 Title
hi link dokuwikiH3 Title
hi link dokuwikiH4 Title
hi link dokuwikiH5 Title

hi def dokuwikiBold term=bold cterm=bold gui=bold
hi def dokuwikiItalic term=italic cterm=italic gui=italic
hi link dokuwikiUnderlined Underlined
hi link dokuwikiMonospaced Type
hi def link dokuwikiStrikethrough Comment
hi def link dokuwikiSubscript Special
hi def link dokuwikiSuperscript Special

hi link dokuwikiExternalLink Underlined
hi link dokuwikiInternalLink Underlined

hi link dokuwikiSmiley Todo
hi link dokuwikiEntities Keyword

hi link dokuwikiList Identifier

hi link dokuwikiImageFiles Underlined

hi link dokuwikiControlMacros Constant

"set name
let b:current_syntax = "dokuwiki"
