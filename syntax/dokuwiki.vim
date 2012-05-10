" Vim syntax file
" Language: dokuwiki
" Last Change: 2012-03-04
" Maintainer: Florian Preinstorfer <nblock@archlinux.org>
" URL: https://github.com/nblock/vim-dokuwiki
" License: same as vim itself
" Reference: http://www.dokuwiki.org/syntax
" Todo: <code lang file> support; {{rss>stuff}} support?
" Credits:
"   Bill Powell <bill@billpowellisalive.com> -- original dokuwiki syntax file
"   Hou Qingping <dave2008713@gmail.com> -- new features (combinations, footnote, quotes), bug fixes
"   Sören König <soeren-koenig@freenet.de> -- zim syntax file
"   Vladimir Zhbanov <vzhbanov@gmail.com> -- various patches

" initial checks. See `:help 44.12`
if exists("b:current_syntax")
 finish
endif

if version < 600
 syntax clear
elseif exists("b:current_syntax")
 finish
endif

"Settings
" Set shift width for indent
setlocal shiftwidth=2
" Set the tab key size to two spaces
setlocal softtabstop=2
" Let tab keys always be expanded to spaces
setlocal expandtab

""" Patterns
" Keywords
syn match dokuwikiLinebreak /\(\\\\$\|\\\\ \)/

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
syn region dokuwikiBold start="\*\*" end="\*\*" contains=ALLBUT,dokuwikiBold,@dokuwikiNoneTextItem
syn region dokuwikiItalic start="\/\/" end="\/\/" contains=ALLBUT,dokuwikiItalic,@dokuwikiNoneTextItem
syn region dokuwikiUnderlined start="__" end="__" contains=ALLBUT,dokuwikiUnderlined,@dokuwikiNoneTextItem
syn region dokuwikiMonospaced start="''" end="''" contains=ALLBUT,dokuwikiMonospaced,@dokuwikiNoneTextItem

syn region dokuwikiStrikethrough start="<del>" end="</del>" contains=ALLBUT,@dokuwikiNoneTextItem,dokuwikiStrikethrough
syn region dokuwikiSubscript start="<sub>" end="</sub>" contains=ALLBUT,@dokuwikiNoneTextItem,dokuwikiStrikethrough
syn region dokuwikiSuperscript start="<sup>" end="</sup>" contains=ALLBUT,@dokuwikiNoneTextItem,dokuwikiStrikethrough

" Smileys: http://github.com/splitbrain/dokuwiki/blob/master/conf/smileys.conf
syn match dokuwikiSmiley "\(8-)\|8-O\|8-o\|:-(\|:-)\|=)\|:-\/\|:-\\\)" contains=@NoSpell
syn match dokuwikiSmiley "\(:-\\\|:-?\|:-D\|:-P\|:-o\|:-O\|:-x\)" contains=@NoSpell
syn match dokuwikiSmiley "\(:-X\|:-|\|;-)\|m(\|\^_\^\|:?:\|:!:\)\|LOL\|FIXME\|DELETEME" contains=@NoSpell

" Entities: http://github.com/splitbrain/dokuwiki/blob/master/conf/entities.conf
syn match dokuwikiEntities "\(<->\|->\|<-\|<=>\|640x480\)" contains=@NoSpell
syn match dokuwikiEntities "\(=>\|<=[^>]\|>>\|<<\|---\|--\)" contains=@NoSpell
syn match dokuwikiEntities "\((c)\|(tm)\|(r)\|\.\.\.\)" contains=@NoSpell

"Cluster most common items
syn cluster dokuwikiTextItems contains=dokuwikiBold,dokuwikiItalic,dokuwikiUnderlined,dokuwikiMonospaced,dokuwikiStrikethrough
syn cluster dokuwikiTextItems add=dokuwikiSubscript,dokuwikiSuperscript,dokuwikiSmiley,dokuwikiEntities
syn cluster dokuwikiTextItems add=dokuwikiExternalLink,dokuwikiInternalLink
syn cluster dokuwikiTextItems add=dokuwikiFootnotes,dokuwikiLinebreak,dokuwikiNowiki,dokuwikiCodeBlocks
syn cluster dokuwikiNoneTextItem contains=ALLBUT,@dokuwikiTextItems

" Links: http://github.com/splitbrain/dokuwiki/blob/master/conf/scheme.conf
syn region dokuwikiExternalLink start=+\(http\|https\|telnet\|gopher\|wais\|ftp\|ed2k\|irc\|ldap\):\/\/\|www\.+ end=+\(\ze[.,?:;-]*\_[^a-zA-Z0-9~!@#%&_+=/.,?:;-]\)+ contains=@NoSpell
syn region dokuwikiInternalLink matchgroup=dokuwikiLink start="\[\[" end="\]\]" contains=@NoSpell,dokuwikiLinkMedia,dokuwikiLinkNoMedia keepend
syn region dokuwikiLinkMedia matchgroup=dokuwikiLink start="|{{"ms=s-1,rs=s+1 end="}}\]\]"me=e-2,re=e-2 contained contains=dokuwikiInternalMediaLink,dokuwikiLinkCaption keepend
syn region dokuwikiLinkNoMedia matchgroup=dokuwikiLink start="|\({{\)\@!"ms=s-1,rs=s+1 end="\]\]" contained contains=dokuwikiLinkCaption keepend
syn region dokuwikiLinkCaption start="." end="\]\]"me=e-2 contained

" Images and other files
syn match dokuwikiMediaSeparator "|" contained nextgroup=dokuwikiMediaCaption
syn region dokuwikiMediaCaption start="." end="}}"me=e-2 contained
syn region dokuwikiMediaLink matchgroup=dokuwikiLink start="{{" end="}}" contains=@NoSpell,dokuwikiMediaSeparator
syn match dokuwikiInternalMediaLink "{{\(\(}\|]]\)\@!\_.\)*}}\(]]\)\@=" contained contains=@NoSpell,dokuwikiMediaLink

"Control Macros
syn region dokuwikiControlMacros start="\~\~" end="\~\~" contains=@NoSpell

"Code Blocks
syn region dokuwikiCodeBlocks start="<code>" end="</code>"
syn region dokuwikiCodeBlocks start="<file>" end="</file>"
syn region dokuwikiCodeBlocks start="^\(  \|\t\)\s*[^*-]" end="$"

" Lists
syn match dokuwikiList "^\(  \|\t\)\s*[*-]" contains=@dokuwikiTextItems

"Quotes
syn match dokuwikiQuotes /^>\+ /

"Footnotes
syn region dokuwikiFootnotes start=/((/ end=/))/ contains=ALLBUT,dokuwikiFootnotes,@dokuwikiNoneTextItem

"Tables
syn match dokuwikiTable "^[|\^].*$" contains=dokuwikiTableRowspan,dokuwikiTableSeparator,dokuwikiTableRowtail,@dokuwikiTextItems transparent
syn match dokuwikiTableSeparator "[|\^]" contained
syn match dokuwikiTableRowspan "[|\^]\s*:::\s*[|\^]" contained contains=dokuwikiTableSeparator
syn match dokuwikiTableRowtail "[^|\^]*$" contained

" Embedded html/php
syn region dokuwikiEmbedded start="<html>" end="</html>"
syn region dokuwikiEmbedded start="<HTML>" end="</HTML>"
syn region dokuwikiEmbedded start="<php>" end="</php>"
syn region dokuwikiEmbedded start="<PHP>" end="</PHP>"

"Comment: requires http://www.dokuwiki.org/plugin:comment
syn region dokuwikiComment start="/\*" end="\*/"

"Horizontal line
syn match dokuwikiHorizontalLine "^\s\?----\+\s*$"

""" Highlighting
hi link dokuwikiLinebreak Keyword

hi link dokuwikiNowiki Exception

hi link dokuwikiHeading1 Title
hi link dokuwikiHeading2 Title
hi link dokuwikiHeading3 Title
hi link dokuwikiHeading4 Title
hi link dokuwikiHeading5 Title

hi def dokuwikiBold term=bold cterm=bold gui=bold
hi def dokuwikiItalic term=italic cterm=italic gui=italic
hi link dokuwikiUnderlined Underlined
hi link dokuwikiMonospaced Type
hi link dokuwikiStrikethrough DiffDelete
hi link dokuwikiSubscript Special
hi link dokuwikiSuperscript Special

hi link dokuwikiExternalLink Underlined
hi link dokuwikiInternalLink Underlined
hi link dokuwikiLinkCaption Label
hi link dokuwikiLink Comment
hi link dokuwikiMediaSeparator Comment
hi link dokuwikiMediaCaption Label
hi link dokuwikiMediaLink String

hi link dokuwikiSmiley Todo
hi link dokuwikiEntities Keyword

hi link dokuwikiList Identifier

hi link dokuwikiControlMacros Constant

hi link dokuwikiCodeBlocks String

hi link dokuwikiQuotes Visual

hi link dokuwikiFootnotes Comment

hi link dokuwikiTableSeparator Label
hi link dokuwikiTableRowspan NonText
hi link dokuwikiTableRowtail Comment

hi link dokuwikiEmbedded String

hi link dokuwikiComment Comment

hi link dokuwikiHorizontalLine NonText

"set name
let b:current_syntax = "dokuwiki"
