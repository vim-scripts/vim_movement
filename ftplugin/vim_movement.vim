" vim_movement.vim: Movement over Vim functions with ]m etc.
"
" This filetype plugin provides movement commands and text objects for Vim
" functions.
" This is duplicated from $VIMRUNTIME/ftplugin/vim.vim, using the (IMHO) correct
" mappings "move to method", not "move to paragraph".

" DEPENDENCIES:
"   - CountJump.vim, CountJump/Motion.vim, CountJump/TextObjects.vim autoload
"     scripts.
"
" Copyright: (C) 2009-2012 Ingo Karkat
"   The VIM LICENSE applies to this script; see ':help copyright'.
"
" Maintainer:	Ingo Karkat <ingo@karkat.de>
"
" REVISION	DATE		REMARKS
"   1.00.002	04-Apr-2012	Published.
"	001	12-Feb-2009	file creation
"				Extracted mapping scheme into general helper
"				function.

" Avoid installing when in unsupported Vim version.
if v:version < 700
    finish
endif

let s:patternFunctionBegin = '^\s*fu\%[nction]\>'
let s:patternFunctionEnd = '^\s*endf*\%[unction]\>'

"			Move around Vim functions:
"]m			Go to [count] next start of a function.
"]M			Go to [count] next end of a function.
"[m			Go to [count] previous start of a function.
"[M			Go to [count] previous end of a function.

call CountJump#Motion#MakeBracketMotion('<buffer>', 'm', 'M', s:patternFunctionBegin, s:patternFunctionEnd, 0)

"im			"inner method" text object, select [count] function contents.
"am			"a method" text object, select [count] functions, including
"			the function definition and 'endfunction'.
call CountJump#TextObject#MakeWithCountSearch('<buffer>', 'm', 'ai', 'V', s:patternFunctionBegin, s:patternFunctionEnd)

unlet s:patternFunctionBegin
unlet s:patternFunctionEnd

" vim: set ts=8 sts=4 sw=4 noexpandtab ff=unix fdm=syntax :
