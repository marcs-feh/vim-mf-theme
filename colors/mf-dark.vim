let g:colors_name = 'mf-dark'
set background=dark
hi! clear

if exists('syntax_on')
  syntax reset
endif

let s:telescopeIntegration = v:true

let s:uiForeground = '#fff8bf'
let s:uiBackground = '#000000'
let s:uiSubtleBackground = '#061511'

if exists('g:mf_dark_transparent') && g:mf_dark_transparent
	let s:uiBackground = 'NONE'
endif

let s:uiLineWeak = '#0a2923'
let s:uiLine = '#0c3c35'
let s:uiLineStrong = '#0f6256'
let s:uiTextMuted = '#79aca0'
let s:uiTextGray = '#707070'

let s:uiSelection = '#06483e'
let s:uiSearchForeground = s:uiBackground
let s:uiSearchBackground = '#42b8a7'
let s:uiSpecialKey = '#4fc8b9'

let s:x = 600 + 100 + 599

let s:synKeyword = '#ffb36b'
let s:synType = '#35b99b'
let s:synFunction = s:uiForeground
let s:synIdentifier = s:uiForeground
let s:synString = '#f08a5d'
let s:synNumber = '#85cf95'
let s:synConstant = '#e9aa4d' " '#93cb67' " '#d5b270' " '#6bcbbf'
let s:synComment = s:uiTextMuted
let s:synPreProc = s:synKeyword
let s:synNamespace = '#6bcbbf'

let s:diagnosticError = '#ff6b5a'
let s:diagnosticWarn = '#e6b450'
let s:diagnosticInfo = s:uiTextMuted
let s:diagnosticHint = s:uiTextMuted
let s:diagnosticOk = '#35b99b'
let s:diagnosticUnnecessary = s:uiLine

let s:diffAdd =    '#35b99b'
let s:diffChange = '#6bcbbf'
let s:diffDelete = '#ff8a72'

function! s:hi(group, fg)
  execute 'hi! ' . a:group . ' guifg=' . a:fg . ' guibg=NONE'
endfunction

function! s:link(ga, gb)
  execute 'hi! link ' . a:ga . ' ' . a:gb
endfunction

function! s:hiEx(group, fg, bg, style = 'NONE')
  execute 'hi! ' . a:group . ' guifg=' . a:fg . ' guibg=' . a:bg . ' cterm=' a:style . ' gui=' a:style
endfunction

function! s:clear(group)
  execute 'hi! clear ' . a:group
endfunction

call s:hiEx('Normal', s:uiForeground, s:uiBackground)
call s:hiEx('Bold', 'NONE', 'NONE', 'bold')
call s:hiEx('Italic', 'NONE', 'NONE', 'italic')
call s:hiEx('Underlined', 'NONE', 'NONE', 'underline')

call s:hiEx('Visual', s:uiForeground, s:uiSelection)

call s:hiEx('SignColumn', s:uiLineWeak, s:uiBackground)
call s:hiEx('ColorColumn', 'NONE', s:uiLineWeak)
call s:hi('LineNr', s:uiTextGray)

call s:clear('CursorLineNr')
call s:hiEx('CursorLine', 'NONE', 'NONE', 'NONE')
call s:hiEx('CursorLineNr', s:uiForeground, 'NONE', 'bold')
call s:hiEx('CursorLineSign', 'NONE', 'NONE')

call s:link('Directory', 'Type')

call s:hiEx('WinBar', 'NONE', s:uiTextMuted)
call s:hiEx('WinSeparator', 'NONE', s:uiSubtleBackground)
call s:hiEx('Todo', s:uiForeground, 'NONE', 'bold')
call s:link('Title', 'Type')
call s:clear('Question')
call s:clear('NonText')

call s:hiEx('Pmenu', s:uiForeground, s:uiSubtleBackground)
call s:hiEx('PmenuSel', s:uiForeground, s:uiLineWeak)
call s:hiEx('PmenuSBar', 'NONE', s:uiLineWeak)
call s:hiEx('PmenuThumb', s:uiLineStrong, s:uiLine)
call s:link('NormalFloat', 'Pmenu')

call s:hiEx('SpellBad', s:diagnosticError, 'NONE', 'underline')
call s:hiEx('SpellCap', s:uiForeground, 'NONE')
call s:hiEx('SpellLocal', s:uiForeground, 'NONE')
call s:hiEx('SpellRare', s:uiForeground, 'NONE')

call s:link('VertSplit', 'WinSeparator')
call s:hi('EndOfBuffer', s:uiLine)

call s:hiEx('StatusLineNC', s:uiTextMuted, s:uiSubtleBackground)
call s:hiEx('StatusLine', s:uiForeground, s:uiLineWeak)

call s:hiEx('Tabline', s:uiForeground, s:uiSubtleBackground)
call s:hiEx('TablineSel', s:uiForeground, s:uiLineWeak)
call s:hiEx('TablineFill', s:uiForeground, s:uiBackground)

call s:hi('Folded', s:synType)
call s:hi('FoldColumn', s:synType)

call s:hiEx('Identifier', s:synIdentifier, 'NONE')

call s:clear('Delimiter')
call s:clear('Operator')
call s:clear('Special')
call s:hiEx('SpecialKey', s:uiSpecialKey, s:uiLineWeak)

call s:hi('Function', s:synFunction)

call s:hiEx('Keyword', s:synKeyword, 'NONE', 'NONE')
call s:link('Conditional', 'Keyword')
call s:link('Statement', 'Keyword')
call s:link('Repeat', 'Keyword')
call s:link('Exception', 'Keyword')
call s:link('StorageClass', 'Keyword')

call s:hiEx('WildMenu', s:uiForeground, s:uiLine)
call s:hiEx('Search', s:uiSearchForeground, s:uiSearchBackground)
call s:link('IncSearch', 'Search')

call s:hiEx('DiffAdd', s:diffAdd, s:uiLineWeak, 'NONE')
call s:hiEx('DiffChange', s:diffChange, s:uiLineWeak, 'NONE')
call s:hiEx('DiffDelete', s:diffDelete, s:uiLineWeak, 'NONE')
call s:hiEx('DiffText', s:synNumber, s:uiLineWeak, 'NONE')
call s:link('Added', 'DiffAdd')
call s:link('Changed', 'DiffChange')
call s:link('Removed', 'DiffDelete')

call s:hi('MoreMsg', s:uiTextMuted)
call s:hi('WarningMsg', s:diagnosticWarn)
call s:hi('ErrorMsg', s:diagnosticError)
call s:hi('Error', s:diagnosticError)

call s:hi('Namespace', s:synNamespace)
call s:hiEx('Number', s:synNumber, 'NONE')
call s:hi('Constant', s:synConstant)
call s:hi('Boolean', s:synType)
call s:hi('Type', s:synType)
call s:hi('String', s:synString)
call s:hi('Comment', s:synComment)
call s:hi('PreProc', s:synPreProc)
call s:hi('Label', s:synConstant)

" Neovim-only section
if has('nvim')
  call s:hi('DiagnosticError', s:diagnosticError)
  call s:hi('DiagnosticUnnecessary', s:diagnosticUnnecessary)
  call s:hi('DiagnosticWarn', s:diagnosticWarn)
  call s:hi('DiagnosticInfo', s:diagnosticInfo)
  call s:hi('DiagnosticHint', s:diagnosticHint)
  call s:hi('DiagnosticOk', s:diagnosticOk)

  call s:link('@type.builtin', 'Type')
  call s:link('@keyword.modifier.cpp', 'Type')
  call s:link('@keyword.type', 'Keyword')
  call s:link('@constant.builtin', 'Keyword')
  call s:link('@variable', 'Normal')
  call s:hi('@module', s:synNamespace)

  if s:telescopeIntegration
    call s:hiEx('TelescopeNormal', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopePromptBorder', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopeResultsBorder', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopePreviewBorder', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopeSelection', s:uiForeground, s:uiBackground, 'NONE')
    call s:hiEx('TelescopeMultiSelection', s:uiForeground, s:uiBackground, 'bold')
    call s:hiEx('TelescopeMatching', s:uiSearchBackground, s:uiBackground, 'bold')
    call s:hiEx('TelescopePromptPrefix', s:uiForeground, s:uiBackground, 'NONE')
  endif
endif
